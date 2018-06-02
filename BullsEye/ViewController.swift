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
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pointsLabels : UILabel!
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        label.text = String(targetValue)
        pointsLabels.text = String(score)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        pointsLabels.text = "0"
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("El valor del slider es: \(slider.value)" )
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        
        let message = "Tu puntuación es: \(points)"
        
        let alert = UIAlertController(title: "Holi!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
}

