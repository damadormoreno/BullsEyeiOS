//
//  ViewController.swift
//  BullsEye
//
//  Created by David Amador on 5/5/18.
//  Copyright © 2018 David Amador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pointsLabels : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        label.text = String(targetValue)
        pointsLabels.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        pointsLabels.text = "0"
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("El valor del slider es: \(slider.value)" )
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        
        let title: String
        if difference == 0 {
            title = "¡Perfecto!"
            points += 100
        }else if difference < 5 {
            title = "Casi lo tienes!"
            if difference == 1 {
                points += 50
            }
        }else if difference < 10 {
            title = "Uy!!"
        }else {
            title = "No estás muy cerca"
        }
        score += points
        
        let message = "Tu puntuación es: \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}

