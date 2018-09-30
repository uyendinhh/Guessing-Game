//
//  ViewController.swift
//  Guessing Game
//
//  Created by Uyen Dinh on 9/29/18.
//  Copyright © 2018 Uyen Dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    var answer = 0
    var justWon = false
    var attemp = 0
    @IBAction func buttonClicked(_ sender: Any) {
        if justWon {
            generateRandom()
            button.setTitle("Go", for: .normal)
            justWon = false
            label.text = "Guess the number"
        } else {
            evaluateInput()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandom()
    }
    
    func generateRandom() {
        answer = Int(arc4random_uniform(100))
    }
    
    func evaluateInput() {
        guard let text = textField.text else { return }
        guard let guess = Int(text) else {return}
        attemp += 1
        if guess < answer {
            label.text = "Too low!"
        } else if guess > answer {
            label.text = "Too high!"
        } else {
            //you won
            label.text = "You won in \(attemp) attemps"
            justWon = true
            button.setTitle(("Play Again"), for: .normal)
        }
        textField.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

