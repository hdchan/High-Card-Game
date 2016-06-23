//
//  HighCardGame.swift
//  High Card
//
//  Created by Henry Chan on 6/22/16.
//  Copyright (c) 2016 Henry Chan. All rights reserved.
//

import Foundation


struct HighCardGame {
    
    private var players:[Player]
    private var playingCardDeck:PlayingCardDeck
    private var score:[Player:Int]
    
    init() {
        
        players = [HumanPlayer(name: "Henry"),
                   ComputerPlayer(name: "Computer 1")]
        
        playingCardDeck = PlayingCardDeck()
        
        score = [:]
        
        for player in players {
            
            score[player] = 0
            
        }
        
    }
    

    func playerDrawsCard() {
        
    }
}