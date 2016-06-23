//
//  Player.swift
//  High Card
//
//  Created by Henry Chan on 6/23/16.
//  Copyright © 2016 Henry Chan. All rights reserved.
//

import Foundation

protocol PlayerProtocol {
    
}

class Player:Hashable {
    
    var uid:Int
    let name:String
    var hand:[PlayingCard]
    var hashValue: Int {
        return self.uid
    }
    init(name:String) {
        self.uid = Int(arc4random())
        self.name = name
        self.hand = []
    }
   
    func discardHand() {
        self.hand.removeAll()
    }
}

class HumanPlayer:Player {
    
}
class ComputerPlayer:Player {
    
}

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.uid == rhs.uid
}