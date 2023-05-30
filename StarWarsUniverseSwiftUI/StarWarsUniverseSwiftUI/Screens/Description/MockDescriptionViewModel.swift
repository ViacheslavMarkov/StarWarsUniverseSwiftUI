//
//  MockDescriptionViewModel.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 23.05.2023.
//

import SwiftUI

class MockDescriptionViewModel: DescriptionViewModelProtocol {
    var title: String = "title"
    
    var dictionary: [String : [String]] = ["1": ["dddd"], "2": ["fffff"]]
    
    func fetchItemData() {
        print("fetchItemData")
    }
    
    func updateData(at newUrlString: String) {
        print("updateData")
    }
    
    func getTab() -> Tab? {
        return .people
    }
}
