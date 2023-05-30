//
//  Binding+Extension.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 30.05.2023.
//

import SwiftUI

extension Binding {
    func map<T>(
        get: @escaping (Value) -> T?,
        set: @escaping (T?) -> Value
    ) -> Binding<T?> {
        Binding<T?>(
            get: {
                get(wrappedValue)
            },
            set: {
                wrappedValue = set($0)
            }
        )
    }
}
