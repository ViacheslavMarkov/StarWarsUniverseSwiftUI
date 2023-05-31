//
//  AppDelegate.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 30.05.2023.
//

//import UIKit
import SwiftUI

@main
final class AppDelegate: NSObject, UIApplicationDelegate {
    
    private lazy var coordinator: Coordinator<MapRouter> = .init(startingRoute: .main)
    
     var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        return true
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sessionRole = connectingSceneSession.role
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: sessionRole)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}
