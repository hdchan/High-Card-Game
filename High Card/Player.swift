//
//  Player.swift
//  High Card
//
//  Created by Henry Chan on 6/23/16.
//  Copyright © 2016 Henry Chan. All rights reserved.
//

import Foundation

protocol PlayerProtocol {
    func drawCard(player:Player) -> PlayingCard
}

class Player: Hashable {
    
    var uid:Int
    let name:String
    var hand:[PlayingCard]
    var hashValue: Int {
        return self.uid
    }
    var game:PlayerProtocol
    
    init(game:PlayerProtocol ,name:String) {
        self.uid = Int(arc4random())
        self.name = name
        self.hand = []
        self.game = game
    }
    
    func drawCard() {
        let drawnCard = game.drawCard(self)
        self.hand.append(drawnCard)
        print("\(name) drew a: \(drawnCard)")
        NSNotificationCenter.defaultCenter().postNotificationName("turnFinished", object: nil)
    }
    
    func discardHand() {
        self.hand.removeAll()
    }
    
    
}

class HumanPlayer:Player {
    
    
    
}
class ComputerPlayer:Player {
//    override init(game: PlayerProtocol, name: String) {
//        super.init(game: game, name: name)
//        
//    }
    
    func playTurn() {
        drawCard()
    }
}

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.uid == rhs.uid
}