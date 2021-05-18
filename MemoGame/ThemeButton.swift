//
//  ThemeButton.swift
//  MemoGame
//
//  Created by Krzysztof Jankowski on 18/05/2021.
//

import Foundation
import SwiftUI

struct ThemeButton {
    
    @Binding var emojis: [String]
    @Binding var emojiCount: Int
    
    let content: [String]
    let themeName: String
    let sfSymbol: String
}

extension ThemeButton: View {
    var body: some View {
        Button {
            emojis = content.shuffled()
            emojiCount = Int.random(in: 4...emojis.count)
        } label: {
            VStack {
                Image(systemName: sfSymbol)
                Text(themeName)
                    .font(.callout)
            }
        }
    }
}
