//
//  PlayingCard.swift
//  High Card
//
//  Created by Henry Chan on 6/22/16.
//  Copyright (c) 2016 Henry Chan. All rights reserved.
//

import Foundation
typealias Suit = String
struct Rank {
    var rank:String
    var value:Int
}
struct PlayingCard {
    
    let rank:Rank
    let suit:Suit
    
    init(rank:Rank, suit:Suit) {
        self.rank = rank
        self.suit = suit
    }
}