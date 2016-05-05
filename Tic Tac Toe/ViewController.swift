//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Chatterjee, Snigdhaman on 31/12/15.
//  Copyright © 2015 Chatterjee, Snigdhaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameActive = true
    var gameWon = false

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playButtonOutlet: UIButton!
    
    @IBAction func playButton(sender: AnyObject) {
    
        playButtonOutlet.hidden = true
        playButtonOutlet.center = CGPointMake(playButtonOutlet.center.x, playButtonOutlet.center.y + 300)
        resultLabel.hidden = true
        resultLabel.center = CGPointMake(resultLabel.center.x, resultLabel.center.y - 1000)
        resultLabel.alpha = 0
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        gameWon = false
        
        var buttonToBeCleared: UIButton
        
        for var i = 0; i < 9; i++ {
            
            buttonToBeCleared = view.viewWithTag(i) as! UIButton
            buttonToBeCleared.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        
            if gameState[sender.tag] == 0 && gameActive {
                gameState[sender.tag] = activePlayer
                if activePlayer == 1 {
            
                    sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                    activePlayer = 2
            
                } else {
            
                    sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                    activePlayer = 1
                
                }
            
                for var combination in winningCombination {
                
                    if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                        if gameState[combination[0]] == 1 {
                        
                            resultLabel.text = "Congrats!! O has won!"
                        
                        } else {
                        
                            resultLabel.text = "Congrats!! X has won!"
                        
                        }
                    
                        gameActive = false
                        gameWon = true
                        UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                            self.resultLabel.hidden = false
                            self.playButtonOutlet.hidden = false
                            self.resultLabel.center = CGPointMake(self.resultLabel.center.x, self.resultLabel.center.y + 1000)
                            self.resultLabel.alpha = 0.9
                            self.playButtonOutlet.center = CGPointMake(self.playButtonOutlet.center.x, self.playButtonOutlet.center.y - 300)
                        
                        })
                    
                    }
                
                }
                
                if !gameWon {
                    
                gameActive = false
                for checkWin in gameState {
                    
                    if checkWin == 0 {
                        
                        gameActive = true
                        
                    }
                    
                }
                
                if !gameActive {
                    
                    resultLabel.text = "It's a draw!!"
                    gameActive = false
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.resultLabel.hidden = false
                        self.playButtonOutlet.hidden = false
                        self.resultLabel.center = CGPointMake(self.resultLabel.center.x, self.resultLabel.center.y + 1000)
                        self.resultLabel.alpha = 0.9
                        self.playButtonOutlet.center = CGPointMake(self.playButtonOutlet.center.x, self.playButtonOutlet.center.y - 300)
                        
                    })
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        playButtonOutlet.hidden = true
        playButtonOutlet.center = CGPointMake(playButtonOutlet.center.x, playButtonOutlet.center.y + 300)
        resultLabel.hidden = true
        resultLabel.center = CGPointMake(resultLabel.center.x, resultLabel.center.y - 1000)
        resultLabel.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

