//
//  DescriptionViewModel.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 23.05.2023.
//

import SwiftUI

protocol DescriptionViewModelProtocol: ObservableObject {
    var dictionary: [String: [String]] { get set }
    var title: String { get set }
    
    func fetchItemData()
    func updateData(at newUrlString: String)
    func getTab() -> Tab?
}

final class DescriptionViewModel<T: ResponseModelProtocol>: DescriptionViewModelProtocol {
    private var response: (any ResponseModelProtocol)? {
        didSet {
            dictionary = response?.description ?? [:]
            title = response?.name ?? "title"
        }
    }
    @Published var dictionary: [String: [String]] = [:]
    @Published var title: String = ""
    
    var urlString: String
    private let manager = CacheDataManager.shared
    
    init(urlString: String) {
        self.urlString = urlString
        
//        fetchItemData()
    }
    
    func fetchItemData() {
        if let model = manager.getFromCacheDictionary(by: urlString),
           let res = model as? T {
            response = res
            dictionary = response?.description ?? [:]
            return
        }
        
        StarWarsService().fetchData(by: urlString) { [weak self] (result: Result<T, ApiError>) in
            guard
                let self = self
            else {
                //                self?.delegate?.updateFailed(message: "DescriptionViewModel is missing!")
                return
            }
            
            switch result {
            case .failure(let failure):
                print(failure.errorMessage)
                //                self.delegate?.updateFailed(message: failure.errorMessage)
            case .success(let success):
                self.response = success
                manager.addToCache(model: success, by: self.urlString)
            }
        }
    }
    
    func updateData(at newUrlString: String) {
        urlString = newUrlString
        response = nil
    }
    
    func getTab() -> Tab? {
        let list = urlString.components(separatedBy: "/")
        
        guard
            let firstIndex = list.firstIndex(of: "api"),
            let tab = Tab(rawValue: list[firstIndex + 1])
        else { return nil }
        return tab
    }
}
