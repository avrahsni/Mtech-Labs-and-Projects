//
//  ViewController.swift
//  Tally App
//
//  Created by Snir Avrahami on 9/29/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterNameField: UITextField!
    @IBOutlet weak var startingNumberField: UITextField!
    @IBOutlet weak var counterSlider: UISlider!
    @IBOutlet weak var resetToField: UITextField!
    @IBOutlet weak var countByLabel: UILabel!
    
    
    struct settings {
        var name: String
        var startingNumber: Int
        var counter: Int
        var resetNumber: Int
        
        init(name: String, startingNumber: Int, counter: Int, resetNumber: Int) {
            self.name = name
            self.startingNumber = startingNumber
            self.counter = counter
            self.resetNumber = resetNumber
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countByLabel.text = "Count By: \(counterSlider.value)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let name: String? = counterNameField.text
        let startingNumber: Int? = Int(startingNumberField.text!)
        let resetNumber: Int? = Int(resetToField.text!)
        let myCounter = settings(name: name!, startingNumber: startingNumber!, counter: Int(counterSlider.value), resetNumber: resetNumber!)
        if let tallyScreen = segue.destination as? TallyViewController {
            tallyScreen.myTally.name = myCounter.name
            tallyScreen.myTally.startingNumber = myCounter.startingNumber
            tallyScreen.myTally.counter = myCounter.counter
            tallyScreen.myTally.resetNumber = myCounter.resetNumber
        }
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard counterNameField.text != nil && startingNumberField.text != nil && resetToField.text != nil else {return false}
        guard Int(startingNumberField.text!) != nil && Int(resetToField.text!) != nil else {return false}
        return true
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        countByLabel.text = "Count By: \(currentValue)"
    }
    
    
}

