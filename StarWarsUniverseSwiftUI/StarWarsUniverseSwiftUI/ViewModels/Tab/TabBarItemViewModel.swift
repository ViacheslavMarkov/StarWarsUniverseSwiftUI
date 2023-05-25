//
//  TabBarItemViewModel.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 21.01.2023.
//

import Foundation

protocol TabBarItemViewModelProtocol: ObservableObject {
    var models: [StarWarsCellModel] { get set }
    
    func fetchData()
    func getTabBarItem() -> Tab
    func loadMoreContent(currentModel model: StarWarsCellModel)
}

class TabBarItemViewModel<T: RequestResponseProtocol>: TabBarItemViewModelProtocol {
    
    private var cacheModels: [any ResponseModelProtocol] = []
    private var pageURLString: String?
    
    @Published var models: [StarWarsCellModel] = []
    
    let tabItem: Tab
    
    init(
        tabItem: Tab
    ) {
        self.tabItem = tabItem
        
        pageURLString = tabItem.pageURLString
    }
    
    func fetchData() {
        guard
            let pageURLString = pageURLString
        else {
            return
        }
        
        StarWarsService.shared.fetchData(by: pageURLString, completion: { [weak self] (result: Result<T, ApiError>) in
            guard
                let self = self
            else {
//                self?.delegate?.updateFailed(message: "TabBarItemViewModel is missing!")
                return
            }
            
            switch result {
            case .failure(let error):
                print(error)
//                self.delegate?.updateFailed(message: error.errorMessage)
            case .success(let response):
                self.addItemsToData(response: response)
                self.pageURLString = response.next
            }
//            self.delegate?.showASndHideDownloadIndicator(self, isShow: false)
        })
    }
    
    func addItemsToData<T: RequestResponseProtocol>(
        response: T? = nil
    ) {
        guard let list = response?.results as? [any ResponseModelProtocol] else { return }
        
        list.forEach({ (item) in
            let names = cacheModels.compactMap({ $0.name })
            if !names.contains(item.name ) {
                cacheModels.append(item)
                CacheDataManager.shared.addToCache(model: item, by: item.urlString ?? "")
            }
        })
        let newList = createModels(models: list)
        models += newList
//        delegate?.didUpdatedDataSource(self, models: models)
    }
    
    func createModels(
        models: [any ResponseModelProtocol]
    ) -> [StarWarsCellModel] {
        let list: [StarWarsCellModel] = (0..<models.count).map { (index) -> StarWarsCellModel in
            return StarWarsCellModel(
                name: models[index].name,
                imageNameType: models[index].imageType,
                urlString: models[index].urlString
            )
        }
        return list
    }
    
    func getItemsCounter() -> Int {
        return cacheModels.count
    }
    
    func getTabBarItem() -> Tab {
        return tabItem
    }
    
    func getSelectedItem(at urlString: String) -> (any ResponseModelProtocol)? {
        let item = cacheModels.first(where: { $0.urlString == urlString })
        return item
    }
    
    func loadMoreContent(currentModel model: StarWarsCellModel) {
        guard let lastItem = models.last else { return }
        if lastItem.id == model.id {
            fetchData()
            }
        }
}
