//
//  Tab.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 23.05.2023.
//

import Foundation

enum Tab: String, CaseIterable, Hashable {
    case people
    case starships
    case planets
    case species
    case vehicles
    case films

    var title: String {
        switch self {
        case .people:
            return "People"
        case .planets:
            return "Planets"
        case .starships:
            return "Starships"
        case .vehicles:
            return "Vehicles"
        case .species:
            return "Species"
        case .films:
            return "Film"
        }
    }
    
    var tag: Int {
        switch self {
        case .people:
            return 0
        case .starships:
            return 1
        case .planets:
            return 2
        case .species:
            return 3
        case .vehicles:
            return 4
        case .films:
            return 5
        }
    }

    var imageType: ImageNameType {
        switch self {
        case .people:
            return .personTabIcon
        case .planets:
            return .planetTabIcon
        case .starships:
            return .starshipTabIcon
        case .vehicles:
            return .vehicleTabIcon
        case .species:
            return .specieTabIcon
        default:
            return .emptyImage
        }
    }
    
//    var selectedColor: UIColor? {
//        return .selectedGray
//    }
//    
//    var unselectedColor: UIColor? {
//        return .titleGray
//    }
    
    var pageURLString: String {
        switch self {
        case .people:
            return EndPoint.people.urlString + "1"
        case .starships:
            return EndPoint.starships.urlString + "1"
        case .species:
            return EndPoint.species.urlString + "1"
        case .planets:
            return EndPoint.planets.urlString + "1"
        case .vehicles:
            return EndPoint.vehicles.urlString + "1"
        case .films:
            return EndPoint.films.urlString + "1"
        }
    }
    
    var defaultURLString: String {
        switch self {
        case .people:
            return "https://swapi.dev/api/people/1/"
        case .starships:
            return "https://swapi.dev/api/starships/2/"
        case .species:
            return "https://swapi.dev/api/planets/1/"
        case .planets:
            return "https://swapi.dev/api/species/1/"
        case .vehicles:
            return "https://swapi.dev/api/vehicles/4/"
        case .films:
            return "https://swapi.dev/api/films/4/"
        }
    }
    
    var tabBarItems: [Tab] {
        return [.people, .starships, .planets, .species, .vehicles]
    }
    
    var defaultResponseType: any RequestResponseProtocol {
        switch self {
        case .people:
            let models = [ResponseModelTypes.peopleModel]
            let response = PeopleResponse(count: 0,
                                          next: "",
                                          previous: "",
                                          results: models)
            return response
        case .planets:
            let models = [ResponseModelTypes.planetModel]
            let response = PlanetsResponse(count: 0,
                                           next: "",
                                           previous: "",
                                           results: models)
            return response
        case .starships:
            let models = [ResponseModelTypes.starShipModel]
            let response = StarShipResponse(count: 0,
                                            next: "",
                                            previous: "",
                                            results: models)
            return response
        case .species:
            let models = [ResponseModelTypes.specieModel]
            let response = SpecieResponse(count: 0,
                                          next: "",
                                          previous: "",
                                          results: models)
            return response
        default:
            let models = [ResponseModelTypes.vehicleModel]
            let response = VehicleResponse(count: 0,
                                           next: "",
                                           previous: "",
                                           results: models)
            return response
        }
    }
}
