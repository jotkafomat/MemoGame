//
//  ContentView.swift
//  MemoGame
//
//  Created by Krzysztof Jankowski on 18/05/2021.
//

import SwiftUI

struct ContentView {
    
    @State var emojis = [String]()
    @State var emojiCount = 0
    
}

extension ContentView: View {
    var body: some View {
        
        VStack {
            Text("Memorize!")
                .font(.title)
                .fontWeight(.medium)
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack(alignment: .lastTextBaseline) {
                animals
                Spacer()
                sport
                Spacer()
                weather
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

extension ContentView {
    var animals: some View {
        ThemeButton(
            emojis: $emojis,
            emojiCount: $emojiCount,
            content: ["🐸","🦆", "🐶","🦁", "🦒", "🦊", "🐼","🐎","🧸","🐽","🦖","🐢","🐓","🐳","🦀","🦑","🦐","🐷"],
            themeName: "Animals",
            sfSymbol: "tortoise")
    }
    
    var weather: some View {
        ThemeButton(
            emojis: $emojis,
            emojiCount: $emojiCount,
            content: ["☁️","☀️","🌤","🌥","⛅️","🌦","🌧","🌨","⛈","🌩","⚡️"],
            themeName: "Weather",
            sfSymbol: "cloud.sun")
    }
    
    var sport: some View {
        ThemeButton(
            emojis: $emojis,
            emojiCount: $emojiCount,
            content: ["🏋️‍♀️","⛹🏼‍♀️","🤺","🏌️‍♂️","🏄‍♂️","🚴‍♀️","⛷","🏂","🤼","🤸🏼‍♀️","🏇🏼","🤽🏻‍♀️", "🚣🏻"],
            themeName: "Sport",
            sfSymbol: "sportscourt")
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
