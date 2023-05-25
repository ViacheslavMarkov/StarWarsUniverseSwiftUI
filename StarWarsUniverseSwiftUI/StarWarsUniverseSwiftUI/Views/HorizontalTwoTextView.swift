//
//  HorizontalTwoTextView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 24.05.2023.
//

import SwiftUI

struct HorizontalTwoTextView: View {
    //MARK: - Properties
    let key: String
    let value: String
    let isFirstItem: Bool
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 8) {
            Text(key + ":")
                .foregroundColor(isFirstItem ? Color.black : Color.clear)
            Text(value)
        }
    }
}

//MARK: - Preview
struct HorisontalTwoTextView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalTwoTextView(key: "key", value: "value", isFirstItem: true)
    }
}
