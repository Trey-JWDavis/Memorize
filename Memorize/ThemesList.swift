//
//  ThemesList.swift
//  Memorize
//
//  Created by Trey Davis on 1/5/21.
//

import Foundation

class ThemesList: ObservableObject {
    @Published var themes = [Theme]()
    
    init() {
        themes = [
            Theme(name: "Faces", emojis: ["☺️","😂","😅","🤣","😌","😝","😋","🥰","😍"], cards: 9, color: .yellow, id: 1),
            Theme(name: "Flags", emojis: ["🚩","🇩🇿","🇦🇮","🇦🇷","🇦🇲","🇦🇼","🇦🇿","🇦🇹","🇧🇿"], color: .blue, id: 2),
            Theme(name: "Food", emojis: ["🍎","🥥","🍅","🥯","🥐","🍇","🍜","🌮","🍕","🍔","🍟"], color: .green, id: 3),
            Theme(name: "Hearts", emojis: ["❤️","🧡","💛","💚","💙","💜","🖤","🤍","🤎","💔"], color: .red, id: 4),
            Theme(name: "Electronics", emojis: ["⌚️","📱","💻","🖥","⌨️","🖨","📷"], color: .gray, id: 5),
            Theme(name: "Halloween", emojis: ["🦇","🕷","🕸","🧛🏼‍♂️","🧟‍♀️"], color: .orange, id: 6)
        ]
    }
}
