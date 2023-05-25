//
//  Image+Extension.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 23.05.2023.
//

import SwiftUI

extension Image {
    init(imageType: ImageNameType) {
        self.init(imageType.rawValue)
    }
}
