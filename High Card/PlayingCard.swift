//
//  PlayingCard.swift
//  High Card
//
//  Created by Henry Chan on 6/22/16.
//  Copyright (c) 2016 Henry Chan. All rights reserved.
//

import Foundation


struct Suit {
    var suit:String
    var value:Int
}

struct Rank {
    var rank:String
    var value:Int
}

class PlayingCard:NSObject {
    
    let rank:Rank
    let suit:Suit
    
    init(rank:Rank, suit:Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    override var description:String {
        return "\(rank.rank) of \(suit.suit)'s"
    }
}