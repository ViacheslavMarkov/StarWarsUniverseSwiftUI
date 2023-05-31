//
//  EmptyMessageView.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 31.05.2023.
//

import SwiftUI

struct EmptyMessageView: View {
    //MARK: - Properties
    let messageText: String
    
    //MARK: - Body
    var body: some View {
        Text(messageText)
            .foregroundColor(.green)
            .font(.largeTitle)
            .lineLimit(0)
    }
}

//MARK: - Preview
struct EmptyMessageView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyMessageView(messageText: "Message")
    }
}
