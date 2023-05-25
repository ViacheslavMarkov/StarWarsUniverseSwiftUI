//
//  MockTabViewModel.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 23.05.2023.
//

import SwiftUI

class MockTabViewModel: TabBarItemViewModelProtocol {
    func loadMoreContent(currentModel model: StarWarsCellModel) {
        print("loadMoreContent")
    }
    
    var models: [StarWarsCellModel] = [StarWarsCellModel(name: "Name", imageNameType: .destroyerShip, urlString: "urlString")]
    
    func fetchData() {
        print("fetchData")
    }
    
    func getTabBarItem() -> Tab {
        return Tab.people
    }
}
