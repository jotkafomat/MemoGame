//
//  CardView.swift
//  MemoGame
//
//  Created by Krzysztof Jankowski on 18/05/2021.
//

import Foundation
import SwiftUI

struct CardView {
    @State private var isFaceUp = true
    
    let content: String
    let shape = RoundedRectangle(cornerRadius: 20)
}

extension CardView: View {
    
    var body: some View {
        ZStack {
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        .aspectRatio(2/3, contentMode: .fit)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "🐶")
    }
}
