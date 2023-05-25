//
//  CellView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 21.01.2023.
//

import SwiftUI

struct CellView: View {
    var model: StarWarsCellModel
    
    var body: some View {
        HStack(spacing: 8) {
            Image(model.imageNameType?.rawValue ?? "")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            Text(model.name ?? "")
        }
        .padding()
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MockTabViewModel()
        CellView(model: vm.models[0])
    }
}
