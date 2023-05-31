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
    @State private var selection = 0
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    //MARK: - Body
    var body: some View {
        TabView(selection: $selection) {
            ForEach(tabItems, id: \.self) { tab in
                
                switch tab {
                case .people:
                    let models = [ResponseModelTypes.peopleModel]
                    let response = PeopleResponse(count: 0,
                                                  next: "",
                                                  previous: "",
                                                  results: models)
                    createTabView(type: response, tab: tab)
                case .planets:
                    let models = [ResponseModelTypes.planetModel]
                    let response = PlanetsResponse(count: 0,
                                                   next: "",
                                                   previous: "",
                                                   results: models)
                    createTabView(type: response, tab: tab)
                case .starships:
                    let models = [ResponseModelTypes.starShipModel]
                    let response = StarShipResponse(count: 0,
                                                    next: "",
                                                    previous: "",
                                                    results: models)
                    createTabView(type: response, tab: tab)
                case .species:
                    let models = [ResponseModelTypes.specieModel]
                    let response = SpecieResponse(count: 0,
                                                  next: "",
                                                  previous: "",
                                                  results: models)
                    createTabView(type: response, tab: tab)
                default:
                    let models = [ResponseModelTypes.vehicleModel]
                    let response = VehicleResponse(count: 0,
                                                   next: "",
                                                   previous: "",
                                                   results: models)
                    createTabView(type: response, tab: tab)
                }
            }
            .statusBarHidden(true)
            .onAppear {
                coordinator.hideAndShowNavController(isHidden: true)
            }
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
                        .foregroundColor(tab.tag == selection ? .black : .gray)
                }
            }
            .tag(tab.tag)
    }
}

//MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
