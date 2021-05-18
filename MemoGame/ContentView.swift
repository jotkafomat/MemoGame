//
//  ContentView.swift
//  MemoGame
//
//  Created by Krzysztof Jankowski on 18/05/2021.
//

import SwiftUI

struct ContentView {
    
    var emojis = ["🐸","🦆", "🐶","🦁", "🦒", "🦊", "🐼","🐎","🧸","🐽","🦖","🐢","🐓","🐳","🦀","🦑","🦐","🐷"]
    @State var emojiCount = 18
    
}

extension ContentView: View {
    var body: some View {
        
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

extension ContentView {
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct CardView {
    var content: String
    @State var isFaceUp: Bool = true
    
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
