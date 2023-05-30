//
//  MainView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 19.01.2023.
//

import SwiftUI

struct MainView: View {
    //MARK: - Properties
    private let tabItems = Tab.planets.tabBarItems
    
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(tabItems, id: \.self) { tab in
                switch tab {
                case .people:
                    let models = [
                        PeopleModel(
                            name: "name",
                            gender: "",
                            urlString: "",
                            height: "",
                            mass: "",
                            films: [],
                            species: [],
                            vehicles: [],
                            starships: [],
                            hairColor: "",
                            skinColor: "",
                            eyeColor: "",
                            birthYear: "",
                            homeWorld: ""
                        )
                    ]
                    let response = PeopleResponse(count: 0,
                                                  next: "",
                                                  previous: "",
                                                  results: models)
                    createTabView(type: response, tab: tab)
                case .planets:
                    let models = [
                        PlanetModel(
                            name: "",
                            climate: "",
                            urlString: "",
                            rotationPeriod: "",
                            orbitalPeriod: "",
                            diameter: "",
                            gravity: "",
                            terrain: "",
                            surfaceWater: "",
                            population: "",
                            residents: [],
                            films: []
                        )
                    ]
                    let response = PlanetsResponse(count: 0,
                                                   next: "",
                                                   previous: "",
                                                   results: models)
                    createTabView(type: response, tab: tab)
                case .starships:
                    let models = [
                        StarShipModel(
                            name: "",
                            model: "",
                            urlString: "",
                            manufacturer: "",
                            costInCredits: "",
                            length: "",
                            maxAtmospheringSpeed: "",
                            crew: "",
                            passengers: "",
                            cargoCapacity: "",
                            hyperdriveRating: "",
                            starshipClass: "",
                            pilots: [],
                            films: []
                        )
                    ]
                    let response = StarShipResponse(count: 0,
                                                    next: "",
                                                    previous: "",
                                                    results: models)
                    createTabView(type: response, tab: tab)
                case .species:
                    let models = [
                        SpecieModel(
                            name: "",
                            classification: "",
                            urlString: "",
                            cargoCapacity: "",
                            consumables: "",
                            costInCredits: "",
                            crew: "",
                            films: [],
                            people: [],
                            length: "",
                            manufacturer: "",
                            maxAtmospheringSpeed: "",
                            passengers: "",
                            vehicleClass: ""
                        )
                    ]
                    let response = SpecieResponse(count: 0,
                                                  next: "",
                                                  previous: "",
                                                  results: models)
                    createTabView(type: response, tab: tab)
                default:
                    let models = [
                        VehicleModel(
                            name: "",
                            model: "",
                            urlString: "",
                            averageHeight: "",
                            averageLifespan: "",
                            designation: "",
                            eyeColors: "",
                            films: [],
                            hairColors: "",
                            homeWorld: "",
                            language: "",
                            people: [],
                            skinColors: ""
                        )
                    ]
                    let response = VehicleResponse(count: 0,
                                                   next: "",
                                                   previous: "",
                                                   results: models)
                    createTabView(type: response, tab: tab)
                }
            }
            .statusBarHidden(true)
        }
    }
    
    @discardableResult
    func createTabView<T: RequestResponseProtocol>(type: Optional<T>, tab: Tab) -> some View {
        let vm = TabBarItemViewModel<T>(tabItem: tab)
        return CustomTabBarItemView(viewModel: vm)
            .tabItem {
                VStack {
                    Image(tab.imageType.rawValue)
                        .resizable()
                        .aspectRatio(CGSize(width: 20, height: 20), contentMode: .fit)
                    Text(tab.title)
                }
            }
    }
}

//MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
