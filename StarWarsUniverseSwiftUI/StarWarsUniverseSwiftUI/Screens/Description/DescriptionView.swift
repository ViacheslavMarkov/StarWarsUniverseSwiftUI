//
//  DescriptionView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 23.05.2023.
//

import SwiftUI

struct DescriptionView<ViewModel: DescriptionViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                let dictionary = viewModel.dictionary
                ForEach(Array(dictionary.keys), id: \.self) { key in
                    let list = dictionary[key] ?? []
                    ForEach(list, id: \.self) { value in
                        let isFirst = list.first == value
                        HorizontalTwoTextView(key: key, value: value, isFirstItem: isFirst)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationBarTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchItemData()
            }
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MockDescriptionViewModel()
        DescriptionView(viewModel: vm)
    }
}
