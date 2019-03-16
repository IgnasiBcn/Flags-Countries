//
//  ViewController.swift
//  Flags-Countries
//
//  Created by ignasiSwift on 11/03/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberCuestions = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " | Score: " + String(score)
        
        numberCuestions += 1
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var titleCorrectOrWrong: String
        
        if sender.tag == correctAnswer {
            titleCorrectOrWrong = "Correct!"
            score += 1
        }
        else {
            titleCorrectOrWrong = "Wrong, That's the flag of \(countries[sender.tag])"
            score -= 1
        }
        
        if numberCuestions <= 6 {
            let ac = UIAlertController(title: titleCorrectOrWrong,
                                       message: "Your score is \(score).",
                preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continiue",
                                       style: .default,
                                       handler: askQuestion))
            
            present(ac, animated: true)
        }
        else {
            let ac = UIAlertController(title: titleCorrectOrWrong,
                                       message: "Your FINAL score is \(score).",
                preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "GAME OVER",
                                       style: .default,
                                       handler: nil))
            
            present(ac, animated: true)
        }
    }
    
}

