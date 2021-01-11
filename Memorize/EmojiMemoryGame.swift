//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trey Davis on 12/7/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String>
    
    var theme: Theme
    
    init(theme: Theme) {
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }
    
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis
        return MemoryGame<String>(pairsOfCards: theme.cards ?? Int.random(in: 1..<emojis.count)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    func createNewGame() {
        model = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }
    
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    var score: Int { model.score }
    
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}


