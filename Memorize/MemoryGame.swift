//
//  MemoryGame.swift
//  Memorize
//
//  Created by Trey Davis on 12/7/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        for index in 0..<cards.count {
            if card.id == cards[index].id {
                cards[index].isFaceUp = !cards[index].isFaceUp
            }
        }
    }
    
    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<pairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
