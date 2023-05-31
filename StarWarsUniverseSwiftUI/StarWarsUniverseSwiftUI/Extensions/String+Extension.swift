//
//  String+Extension.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 31.05.2023.
//

import Foundation

extension String {
    var isURLString: Bool {
        return self.contains("http")
    }
}
