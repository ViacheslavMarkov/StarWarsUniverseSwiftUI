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
    
    var attributedString: AttributedString {
        if !value.isURLString { return AttributedString(value) }
        var result = AttributedString(value)
        result.underlineStyle = Text.LineStyle(
            pattern: .solid, color: .blue)
        return result
    }
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 8) {
            Text(key + ":")
                .foregroundColor(isFirstItem ? Color.black : Color.clear)
            Text(attributedString)
                .foregroundColor(value.isURLString ? .blue : .black)
        }
    }
}

//MARK: - Preview
struct HorisontalTwoTextView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalTwoTextView(key: "key", value: "value", isFirstItem: true)
    }
}
