//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Brad Gray on 7/16/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // naught = 1 , crosses = 2
    var activePlayer = 1
    var gameActive = true
    
    var gameState = [0,0,0,0,0,0,0,0,0,]
    
     var winningSpaces = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]

   
    
    
    @IBOutlet weak var button: UIButton!
    
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var Score: UILabel!

   
    
   
    
    
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as! UIButton
            
            button.setImage(nil, forState: .Normal)
            
        }

            
            
        
        Score.hidden = true
        playAgain.hidden = true
        
        Score.center = CGPointMake(Score.center.x - 400, Score.center.y)
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
        
        

        
    }
    
    
    
    
    
    @IBAction func ButtonPressed(sender: UIButton) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
                
            
        var image = UIImage()
        gameState[sender.tag] = activePlayer
        if activePlayer == 1 {
        
         image = UIImage(named: "nought.png")!
            activePlayer = 2
            
        } else {
            image = UIImage(named: "cross.png")!
            activePlayer = 1
            
        }

        sender.setImage(image, forState: .Normal)
            
            for combination in winningSpaces {
            if gameState[combination[0]] != 0 && gameState[combination [0]] == gameState[combination [1]] && gameState[combination [1]] == gameState[combination [2]] {
                
               var labelText = "Noughts has won!"
                if gameState[combination[0]] == 2 {
                labelText = "crosses has won"
                }
               Score.text = labelText
               
                Score.hidden = false
                playAgain.hidden = false
               
                
                
                UIView.animateWithDuration(0.5, animations: {
                    () -> Void in
                    self.Score.center = CGPointMake(self.Score.center.x + 400, self.Score.center.y)
                    self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                })

                
                
                gameActive = false
                
                
                }
                }
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Score.hidden = true
        playAgain.hidden = true
       
            
            Score.center = CGPointMake(Score.center.x - 400, Score.center.y)
        
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

