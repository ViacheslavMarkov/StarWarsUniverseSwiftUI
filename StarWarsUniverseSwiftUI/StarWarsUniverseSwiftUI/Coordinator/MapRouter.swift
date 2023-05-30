//
//  MapRouter.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 30.05.2023.
//

import SwiftUI

enum MapRouter: NavigationRouter {
   
    case main
    case description(urlString: String, tab: Tab)
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .main:
            return .push
        case .description:
            return .push
        }
    }
    
    var isHideTitle: Bool {
        switch self {
        case .main:
            return true
        case .description:
            return false
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .main:
            MainView()
        case .description(urlString: let urlString, tab: let tab):
//            let _ = createDescriptionPage(type: type, urlString: urlString)
//            let vm = DescriptionViewModel<PeopleModel>(urlString: urlString)
//            let vm: (any ResponseModelProtocol) = createVM(type: type, urlString: urlString) as! ResponseModelProtocol
//            DescriptionView(viewModel: vm)
            switch tab {
            case .people:
                let vm = DescriptionViewModel<PeopleModel>(urlString: urlString)
                DescriptionView(viewModel: vm)
            case .starships:
                let vm = DescriptionViewModel<StarShipModel>(urlString: urlString)
                DescriptionView(viewModel: vm)
            case .planets:
                let vm = DescriptionViewModel<PlanetModel>(urlString: urlString)
                DescriptionView(viewModel: vm)
            case .species:
                let vm = DescriptionViewModel<SpecieModel>(urlString: urlString)
                DescriptionView(viewModel: vm)
            case .vehicles:
                let vm = DescriptionViewModel<VehicleModel>(urlString: urlString)
                DescriptionView(viewModel: vm)
            case .films:
                let vm = DescriptionViewModel<FilmModel>(urlString: urlString)
                DescriptionView(viewModel: vm)
            }
        }
    }
    
    @ViewBuilder
    private func createDescriptionPage<T: ResponseModelProtocol>(type: T, urlString: String) -> some View {
        let vm = DescriptionViewModel<T>(urlString: urlString)
        DescriptionView(viewModel: vm)
    }
}
