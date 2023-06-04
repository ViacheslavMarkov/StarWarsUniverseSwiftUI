//
//  TabBarItemViewModel.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 21.01.2023.
//

import Foundation

protocol TabBarItemViewModelProtocol: ObservableObject {
    var models: [StarWarsCellModel] { get set }
    
    func fetchData() async
    func getTabBarItem() -> Tab
    func loadMoreContent(currentModel model: StarWarsCellModel) async
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
    
    //MARK: - The bad part of the code, will need to improve in some way
    @MainActor
    func fetchData() async {
        guard
            let pageURLString = pageURLString
        else {
            return
        }
        
        switch tabItem {
        case .people:
            await StarWarsService.shared.fetchData(type: ResponseModelTypes.peopleResponse, by: pageURLString, completion: { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.addItemsToData(response: response)
                case .failure(let error):
                    print(error.errorMessage)
                }
            })
            
        case .starships:
            await StarWarsService.shared.fetchData(type: ResponseModelTypes.starShipResponse, by: pageURLString, completion: { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.addItemsToData(response: response)
                case .failure(let error):
                    print(error.errorMessage)
                }
            })
        case .planets:
            await StarWarsService.shared.fetchData(type: ResponseModelTypes.planetsResponse, by: pageURLString, completion: { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.addItemsToData(response: response)
                case .failure(let error):
                    print(error.errorMessage)
                }
            })
        case .species:
            await StarWarsService.shared.fetchData(type: ResponseModelTypes.specieResponse, by: pageURLString, completion: { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.addItemsToData(response: response)
                case .failure(let error):
                    print(error.errorMessage)
                }
            })
        default:
            await StarWarsService.shared.fetchData(type: ResponseModelTypes.vehicleResponse, by: pageURLString, completion: { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.addItemsToData(response: response)
                case .failure(let error):
                    print(error.errorMessage)
                }
            })
        }
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
    
    func loadMoreContent(currentModel model: StarWarsCellModel) async {
        guard let lastItem = models.last else { return }
        if lastItem.id == model.id {
            await fetchData()
        }
    }
}
