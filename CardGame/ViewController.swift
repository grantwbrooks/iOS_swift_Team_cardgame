//
//  ViewController.swift
//  CardGame
//
//  Created by Grant Brooks on 9/7/17.
//  Copyright © 2017 Grant Brooks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var newDeck = Deck()
    var newPlayer = Player(name: "Mr. Crabbs")
    var score: Int = 0
    
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        if newPlayer.hand.count < 5 {
            newPlayer.draw(deck: newDeck)
        }
        else { print("you already have 5") }
        
        print(newPlayer.hand[0].roll)
        
        card1.image = UIImage(named: "\(newPlayer.hand[0].roll)-\(newPlayer.hand[0].roll)")
        if newPlayer.hand.count > 1 {
            card2.image = UIImage(named: "\(newPlayer.hand[1].roll)-\(newPlayer.hand[1].roll)")
        }
        if newPlayer.hand.count > 2 {
            card3.image = UIImage(named: "\(newPlayer.hand[2].roll)-\(newPlayer.hand[2].roll)")
        }
        if newPlayer.hand.count > 3 {
            card4.image = UIImage(named: "\(newPlayer.hand[3].roll)-\(newPlayer.hand[3].roll)")
        }
        if newPlayer.hand.count > 4 {
            card5.image = UIImage(named: "\(newPlayer.hand[4].roll)-\(newPlayer.hand[4].roll)")
        }
        
        
        print("player hand \(newPlayer.hand)")
        
        if newPlayer.hand.count > 1 {
            for i in stride(from: newPlayer.hand.count-2, through: 0, by: -1) {
                if newPlayer.hand[newPlayer.hand.count-1].roll == newPlayer.hand[i].roll {
                    score += 1
                }
            }
        }
        
        playerScore.text = String(score)
        
    }
    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        newPlayer.hand = []
        card1.image = UIImage(named: "backdeck")
        card2.image = UIImage(named: "backdeck")
        card3.image = UIImage(named: "backdeck")
        card4.image = UIImage(named: "backdeck")
        card5.image = UIImage(named: "backdeck")
        print("player hand \(newPlayer.hand)")
        newDeck.shuffle()
        print(newDeck.cards)
        score = 0
        playerScore.text = String(score)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newDeck.shuffle()
        print(newDeck.cards)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

