//
//  PlayingCardDeck.swift
//  High Card
//
//  Created by Henry Chan on 6/22/16.
//  Copyright © 2016 Henry Chan. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
 
    private var deck:[PlayingCard] = []
    
    init() {
        
        buildDeck()
        shuffle()
        
    }
    
    mutating func drawTopCard() -> PlayingCard {
        
        return deck.removeAtIndex(0)
        
    }
    
    private mutating func buildDeck() {
      
        for rank in validRanks() {
            
            for suit in validSuits() {
             
                deck.append(PlayingCard(rank: rank, suit: suit))
                
            }
            
        }
        
    }
    
    private mutating func shuffle() {
        
        var shuffledDeck = deck
        
        var m = shuffledDeck.count
        
        while m > 0 {
            
            let i = Int(Double(arc4random_uniform(100))/100.0 * Double(m))
           
            m -= 1
            
            let t = shuffledDeck[m]
            shuffledDeck[m] = shuffledDeck[i]
            shuffledDeck[i] = t
            
        }
        
        deck = shuffledDeck
    }
    
    private func validSuits() -> [Suit] {
        return ["♠️", "♥️", "♦️", "♣️"]
    }
    
    private func validRanks() -> [Rank] {
        
        return [
            Rank(rank: "2", value: 2),
            Rank(rank: "3", value: 3),
            Rank(rank: "4", value: 4),
            Rank(rank: "5", value: 5),
            Rank(rank: "6", value: 6),
            Rank(rank: "7", value: 7),
            Rank(rank: "8", value: 8),
            Rank(rank: "9", value: 9),
            Rank(rank: "10", value: 10),
            Rank(rank: "J", value: 11),
            Rank(rank: "Q", value: 12),
            Rank(rank: "K", value: 13),
            Rank(rank: "A", value: 14)
        ]
    }
    
}