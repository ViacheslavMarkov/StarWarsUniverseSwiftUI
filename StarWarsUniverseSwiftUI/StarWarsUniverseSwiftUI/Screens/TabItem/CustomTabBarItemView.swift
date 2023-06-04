//
//  CustomTabBarItemView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 21.01.2023.
//

import SwiftUI

struct CustomTabBarItemView<ViewModel>: View where ViewModel: TabBarItemViewModelProtocol {
    //MARK: - Properties
    @StateObject var viewModel: ViewModel
    @State private var showingDescriptionScreen = false
    @State private var selectedModel: StarWarsCellModel?
    
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    //MARK: - init
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            if !viewModel.models.isEmpty {
                List(viewModel.models) { model in
                    CellView(model: model)
                        .onAppear {
                            Task {
                                await viewModel.loadMoreContent(currentModel: model)
                            }
                        }
                        .frame(maxHeight: 40)
                        .onTapGesture(perform: {
                            showingDescriptionScreen.toggle()
                            selectedModel = model
                            itemTapped()
                        })
                }
                .navigationBarTitleDisplayMode(.large)
            .navigationTitle(viewModel.getTabBarItem().title)
            } else {
                EmptyMessageView(messageText: "Empty list!")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchData()
            }
        }
    }
    
    //MARK: - Functions
    func itemTapped() {
        if let selectedModel = selectedModel {
            let tab = viewModel.getTabBarItem()
            guard let urlString = selectedModel.urlString else { return }
            coordinator.show(.description(urlString: urlString, tab: tab))
            self.selectedModel = nil
        }
    }
}

//MARK: - Preview
struct CustomTabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MockTabViewModel()
        CustomTabBarItemView(viewModel: vm)
    }
}
