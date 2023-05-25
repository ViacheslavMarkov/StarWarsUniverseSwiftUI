//
//  StarShipResponse.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - Welcome
struct StarShipResponse: RequestResponseProtocol {
    typealias T = StarShipModel
    
    let id: UUID = UUID()
    
    let count: Int?
    let next: String?
    let previous: String?
    let results: [T]
}
