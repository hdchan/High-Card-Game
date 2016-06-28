//
//  ViewController.swift
//  High Card
//
//  Created by Henry Chan on 6/22/16.
//  Copyright (c) 2016 Henry Chan. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {

    var viewModel:CardGameViewModel!
    @IBOutlet weak var drawButton: UIButton!
    
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var currentPlayerCardLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.viewModel = CardGameViewModel()
        syncUI()
    }

    func syncUI() {
        
        let currentPlayersTurn = viewModel.game.players[viewModel.game.currentPlayerIndex]
        
        drawButton.enabled = currentPlayersTurn == viewModel.context
        if currentPlayersTurn.hand.count > 0 {
            
            self.currentPlayerCardLabel.text = viewModel.game.players[0].hand[0].description
        }
//        if let opponentHand = viewModel.game.players[1].hand[0] as? PlayingCard {
//            self.opponentCardLabel.text = 
//        }
    }
    
    @IBAction func drawButtonTapped(sender: AnyObject) {
        
        viewModel.handleDrawAction()
        syncUI()
    }

}

