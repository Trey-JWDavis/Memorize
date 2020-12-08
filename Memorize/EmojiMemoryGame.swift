//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trey Davis on 12/7/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["😋", "😏", "😂", "😅", "😬"]
        
        return MemoryGame<String>(pairsOfCards: Int.random(in: 2...emojis.count)) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    // Mark: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // Mark: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
