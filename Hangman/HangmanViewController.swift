//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet var stringSoFar: UILabel!
    @IBOutlet var hangManImg: UIImageView!
    @IBOutlet var inputLetter: UITextField!
    @IBOutlet var guessed: UILabel!
    @IBOutlet var guessButton: UIButton!
    
    var hangman: Hangman!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let b = UIBarButtonItem(title: "New Game", style: .Plain, target: self, action: "newGame:")
        self.navigationItem.rightBarButtonItem = b
        guessButton.addTarget(self, action: "guess:", forControlEvents: UIControlEvents.TouchUpInside)
        hangman = Hangman()
        initializeGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeGame() {
        hangman.start()
        self.stringSoFar.text = hangman.knownString
        self.guessed.text = ""
    }
    
    func newGame(sender:UIBarButtonItem) {
        hangman.start()
        self.stringSoFar.text = hangman.knownString
        self.guessed.text = ""
        self.stringSoFar.text = ""
    }
    
    func guess(sender:UIButton) -> Bool{
        let valid = hangman.guessLetter(inputLetter.text!)
        if (!valid) {
            var retval = ""
            let guessedLetters = hangman.guessedLetters
            for guess in guessedLetters! {
                //                print(guess)
                retval += guess as! String
            }
            return false
        }
        else {
            if hangman.knownString == hangman.answer {
                print("you a winner")
                self.stringSoFar.text = hangman.knownString
                return true
            }
            var retval = ""
            let guessedLetters = hangman.guessedLetters
            for guess in guessedLetters! {
                //                print(guess)
                retval += guess as! String
            }
            self.guessed.text = retval
            self.stringSoFar.text = hangman.knownString
            return true
        }
    }
}

