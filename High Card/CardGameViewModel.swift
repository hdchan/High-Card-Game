//
//  ViewModel.swift
//  High Card
//
//  Created by Henry Chan on 6/23/16.
//  Copyright © 2016 Henry Chan. All rights reserved.
//

import Foundation

struct CardGameViewModel {
    
    var game:HighCardGame
    var context:Player
    
    init() {
        game = HighCardGame()
        context = game.players[0]
    }
    
    func handleDrawAction() {
        context.drawCard()
    }
    
}