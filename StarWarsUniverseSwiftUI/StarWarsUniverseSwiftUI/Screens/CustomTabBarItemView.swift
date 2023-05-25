//
//  CustomTabBarItemView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 21.01.2023.
//

import SwiftUI

struct CustomTabBarItemView<ViewModel>: View where ViewModel: TabBarItemViewModelProtocol {
    @StateObject var viewModel: ViewModel
    @State private var showingDescriptionScreen = false
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.models) { model in
                CellView(model: model)
                    .onAppear {
                        viewModel.loadMoreContent(currentModel: model)
                    }
                    .frame(maxHeight: 40)
                    .onTapGesture(perform: {
                        showingDescriptionScreen.toggle()
                    })
                    .sheet(isPresented: $showingDescriptionScreen) {
//                        let type = viewModel.getTabBarItem()
                        let vm = DescriptionViewModel<PeopleModel>(urlString: model.urlString ?? "")
                        DescriptionView(viewModel: vm)
                    }
            }
            .navigationBarTitle(viewModel.getTabBarItem().title)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct CustomTabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MockTabViewModel()
        CustomTabBarItemView(viewModel: vm)
    }
}
