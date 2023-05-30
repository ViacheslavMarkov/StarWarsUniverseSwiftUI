//
//  NavigationRouter.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 30.05.2023.
//

import SwiftUI

protocol NavigationRouter {
    
    associatedtype V: View

    var transition: NavigationTransitionStyle { get }
    
    var isHideTitle: Bool { get }
    
    /// Creates and returns a view of assosiated type
    ///
    @ViewBuilder
    func view() -> V
}
