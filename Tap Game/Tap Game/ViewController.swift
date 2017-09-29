//
//  ViewController.swift
//  Tap Game
//
//  Created by Kedar Rao on 8/29/17.
//  Copyright © 2017 Kedar Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    @IBOutlet weak var playerTwoButton: UIButton!
    @IBOutlet weak var playerOneButton: UIButton!
    
    var playerOneScore: Int = 0
    var playerTwoScore: Int = 0
    
    var isGameStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playerOneButtonTapped(_ sender: UIButton) {
        playerOneScore += 1
        updateUI()
        if isGameStarted == true {
            playerOneButton.backgroundColor = randomColor()
        }
    }
    
    
    @IBAction func playerTwoButtonTapped(_ sender: UIButton) {
        playerTwoScore += 1
        updateUI()
        if isGameStarted == true {
            playerTwoButton.backgroundColor = randomColor()
        }
    }

    
    @IBAction func startGameButtonTapped(_ sender: UIButton) {
        isGameStarted = true
        playerOneScore = 0
        playerTwoScore = 0
        updateUI()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { timer in
            self.isGameStarted = false
        })
        showWinAlert()

    }
    
    func updateUI() {
        if isGameStarted {
            playerOneLabel.text = "Player One Score: \(playerOneScore)"
            playerTwoLabel.text = "Player Two Score: \(playerTwoScore)"
        }
    }
    
    func randomColor() -> UIColor {
        let randomColorValue = {
            return CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
        return UIColor(red: randomColorValue(), green: randomColorValue(), blue: randomColorValue(), alpha: 1)
    }
    
    func gameEndMessage() -> String {
        if playerOneScore > playerTwoScore {
            return "Player One has won!"
        } else if playerTwoScore > playerOneScore {
            return "Player Two has won!"
        } else {
            return "The game has ended in a tie!"
        }
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Alert", message: gameEndMessage(), preferredStyle: .alert)
    }
}

