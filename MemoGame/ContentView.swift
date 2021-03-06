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
            content: ["πΈ","π¦", "πΆ","π¦", "π¦", "π¦", "πΌ","π","π§Έ","π½","π¦","π’","π","π³","π¦","π¦","π¦","π·"],
            themeName: "Animals",
            sfSymbol: "tortoise")
    }
    
    var weather: some View {
        ThemeButton(
            emojis: $emojis,
            emojiCount: $emojiCount,
            content: ["βοΈ","βοΈ","π€","π₯","βοΈ","π¦","π§","π¨","β","π©","β‘οΈ"],
            themeName: "Weather",
            sfSymbol: "cloud.sun")
    }
    
    var sport: some View {
        ThemeButton(
            emojis: $emojis,
            emojiCount: $emojiCount,
            content: ["ποΈββοΈ","βΉπΌββοΈ","π€Ί","ποΈββοΈ","πββοΈ","π΄ββοΈ","β·","π","π€Ό","π€ΈπΌββοΈ","ππΌ","π€½π»ββοΈ", "π£π»"],
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
