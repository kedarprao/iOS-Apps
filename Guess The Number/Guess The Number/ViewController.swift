//
//  ViewController.swift
//  Guess The Number
//
//  Created by Kedar Rao on 9/5/17.
//  Copyright © 2017 Kedar Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    let lowerBound = 1
    let upperBound = 100
    
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numberToGuess = generateRandomNumber()
    }
    
    func generateRandomNumber() -> Int {
        return Int(arc4random_uniform(UInt32(upperBound))) + lowerBound
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        if let guess = guessTextField.text {
            if let numberGuess = Int(guess) {
                numberOfGuesses += 1
                print(guess)
                validateGuess(numberGuess)
            }
        }
    }
    
    func validateGuess(_ guess: Int) {
        // local var = guess, paramater var = _
        if guess < lowerBound || guess > upperBound {
            guessLabel.text = "Guess out of range!"
        } else if guess < numberToGuess {
            guessLabel.text = "Guess higher! 👆🏼"
        } else if guess > numberToGuess {
            guessLabel.text = "Guess lower! 👇🏼"
        } else {
            showWinAlert()
        }
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats!", message: "You won only after \(numberOfGuesses) guesses.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play Again", style: .default, handler: { _ in
        
            self.guessLabel.text = "Guess The Number"
            self.numberOfGuesses = 0
            self.numberToGuess = self.generateRandomNumber()
        
        })
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}

