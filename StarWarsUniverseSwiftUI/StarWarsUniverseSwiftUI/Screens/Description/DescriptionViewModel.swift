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
    
    func updateData(at newUrlString: String) async
    func getTab() -> Tab?
    func fetchData() async
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
    }
    
    func updateData(at newUrlString: String) async {
        urlString = newUrlString
        response = nil
        
        await fetchData()
    }
    
    func fetchData() async {
        guard let tab = getTab() else { return }
        switch tab {
        case .people:
            let type = ResponseModelTypes.peopleModel
            await fetchItemData(type: type)
        case .starships:
            let type = ResponseModelTypes.starShipModel
            await fetchItemData(type: type)
        case .planets:
            let type = ResponseModelTypes.planetModel
            await fetchItemData(type: type)
        case .species:
            let type = ResponseModelTypes.specieModel
            await fetchItemData(type: type)
        case .vehicles:
            let type = ResponseModelTypes.vehicleModel
            await fetchItemData(type: type)
        case .films:
            let type = ResponseModelTypes.filmModel
            await fetchItemData(type: type)
        }
    }
    
    func fetchItemData<M: ResponseModelProtocol>(type: M) async {
        if let model = manager.getFromCacheDictionary(by: urlString),
           let res = model as? M {
            response = res
            return
        }
        
        await StarWarsService().fetchData(type: type, by: urlString) { [weak self] (result) in
            guard
                let self = self
            else {
                return
            }
            
            switch result {
            case .failure(let failure):
                print(failure.errorMessage)
            case .success(let success):
                self.response = success
                manager.addToCache(model: success, by: self.urlString)
            }
        }
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
