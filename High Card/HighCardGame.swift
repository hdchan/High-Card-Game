//
//  HighCardGame.swift
//  High Card
//
//  Created by Henry Chan on 6/22/16.
//  Copyright (c) 2016 Henry Chan. All rights reserved.
//

import Foundation


class HighCardGame:NSObject, PlayerProtocol {
    
    var players:[Player]
    private var playingCardDeck:PlayingCardDeck
    private var score:[Player:Int]
    var currentPlayerIndex = -1
    
    override init() {
        
        playingCardDeck = PlayingCardDeck()
        players = []
        score = [:]
        
        super.init()
        
        players = [HumanPlayer(game:self, name: "Henry"),
                   ComputerPlayer(game:self, name: "Computer")]
        
        for player in players {
            
            score[player] = 0
            
        }
        
        currentPlayerIndex = 0
        
//        startGame()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(advanceToNextPlayer), name: "turnFinished", object: nil)
        
    }
    
    private func startGame() {
        
        while !playingCardDeck.deck.isEmpty {
            
            
            let currentPlayer = players[currentPlayerIndex]
            
            if currentPlayer is HumanPlayer {
                // human
//                currentPlayer.drawCard()
                
                
            } else {
                // computer
                currentPlayer.drawCard()
            }
            
            if currentPlayer == players.last {
                // evaluate high cards
                let winner = getRoundWinner()
                print("\(winner.name) wins!")
                discardPlayerHands()
            }
            

        }
        
    }
    
    @objc private func advanceToNextPlayer() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
        
        let currentPlayer = players[currentPlayerIndex]
        
        if currentPlayer is ComputerPlayer {
            let computerPlayer = currentPlayer as! ComputerPlayer
            computerPlayer.playTurn()
        }
        
        if currentPlayer == players.last {
            // evaluate high cards
            let winner = getRoundWinner()
            print("\(winner.name) wins!---------------------")
            discardPlayerHands()
        }
        
        if playingCardDeck.deck.isEmpty {
            print("Deck is empty!")
            NSNotificationCenter.defaultCenter().removeObserver(self, name: "turnFinished", object: nil)
        }
        
        
        
    }
    
    private func getRoundWinner() -> Player {
        
        var highCardPlayer:Player?
        
        for player in players {
            
            if highCardPlayer == nil {
                highCardPlayer = player
            } else if player.hand[0].rank.value == highCardPlayer!.hand[0].rank.value {
                if player.hand[0].suit.value > highCardPlayer!.hand[0].suit.value {
                   highCardPlayer = player
                }
            } else if player.hand[0].rank.value > highCardPlayer!.hand[0].rank.value {
                highCardPlayer = player
            }
            
        }
        
        
        return highCardPlayer!
    }
    
    private func discardPlayerHands() {
        for player in players {
            player.discardHand()
        }
    }
    
    func drawCard(player:Player) -> PlayingCard {
        player.discardHand()
        let topCard = playingCardDeck.drawTopCard()
        return topCard
    }
    
}
