//
//  MemoryGame.swift
//  memorize
//
//  Created by 11344243 on 2026/3/30.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int,
         createCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let cardContent: CardContent = createCardContent(index)
            cards.append(Card(content: cardContent, id: "\(index)a"))
            cards.append(Card(content: cardContent, id: "\(index)b"))
        }
        shuffle()
    }
    
    var lastFaceUpIndex: Int? {
        get { cards.indices.filter( { cards[$0].isFaceUp } ).oneAndOnly }
        set { cards.indices.forEach({ cards[$0].isFaceUp = $0 == newValue }) }
    }
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.indices.first(where: { cards[$0].id == card.id }) {
            if cards[chosenIndex].isFaceUp || cards[chosenIndex].isMatched {
                    return
            }
            
            if let lastIndex = lastFaceUpIndex {
                if cards[lastIndex].content == cards[chosenIndex].content {
                    cards[lastIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
                
            } else {
                lastFaceUpIndex = chosenIndex
            }
            
        }
        print("cards: \(cards)")
    }
    
    
    mutating func shuffle() {
        cards.shuffle()
        print("shuffle cards: \(cards)")
    }
    
    struct Card: Equatable, Identifiable {
        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
            lhs.content == rhs.content && lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.id == rhs.id
        }
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: String
    }
}


extension Array {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
