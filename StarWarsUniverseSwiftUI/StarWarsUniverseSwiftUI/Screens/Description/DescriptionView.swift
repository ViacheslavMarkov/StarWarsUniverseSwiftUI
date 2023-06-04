//
//  DescriptionView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 23.05.2023.
//

import SwiftUI

struct DescriptionView<ViewModel: DescriptionViewModelProtocol>: View {
    //MARK: - Properties
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            if !viewModel.dictionary.isEmpty {
                List {
                    let dictionary = viewModel.dictionary
                    ForEach(Array(dictionary.keys), id: \.self) { key in
                        let list = dictionary[key] ?? []
                        ForEach(list, id: \.self) { value in
                            let isFirst = list.first == value
                            HorizontalTwoTextView(key: key, value: value, isFirstItem: isFirst)
                                .tag(value)
                                .onTapGesture {
                                    if value.isURLString {
                                        Task {
                                            await createNewModel(urlString: value)
                                        }
                                    }
                                }
                        }
                    }
                    .padding(.vertical, 4)
                }
                .navigationBarTitle(viewModel.title)
                .navigationBarTitleDisplayMode(.inline)
            } else {
                EmptyMessageView(messageText: "Empty list!")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchData()
            }
        }
        .onAppear {
            coordinator.hideAndShowNavController(isHidden: false)
        }
    }
    
    //MARK: - Functions
    private func createNewModel(urlString: String) async {
        await viewModel.updateData(at: urlString)
    }
}

//MARK: - Preview
struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MockDescriptionViewModel()
        DescriptionView(viewModel: vm)
    }
}
