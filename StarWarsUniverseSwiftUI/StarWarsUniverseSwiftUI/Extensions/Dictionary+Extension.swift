//
//  Dictionary+Extension.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

extension Dictionary {
    func nullKeyRemoval() -> Dictionary {
        var dict = self
        dict.forEach { (key, value) in
            if let value = value as? String,
               value.isEmpty {
                dict.removeValue(forKey: key)
            }
            
            if let value = value as? [String],
               value.isEmpty {
                dict.removeValue(forKey: key)
            }
        }
        
        return dict
    }
}
