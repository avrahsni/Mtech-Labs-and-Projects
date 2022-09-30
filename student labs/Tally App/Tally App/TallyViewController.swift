//
//  TallyViewController.swift
//  Tally App
//
//  Created by Snir Avrahami on 9/29/22.
//

import UIKit

class TallyViewController: UIViewController {
    
    @IBOutlet weak var counterNameLabel: UILabel!
    @IBOutlet weak var CounterNumber: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var tallyButton: UIButton!
    
    struct settings {
        var name = ""
        var startingNumber = 0
        var counter = 0
        var resetNumber = 0
    }
    var myTally = settings()
    var value = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        value = myTally.startingNumber
        updateTally()
        // Do any additional setup after loading the view.
    }
    
    func updateTally() {
        counterNameLabel.text = myTally.name
        CounterNumber.text = "\(value)"
    }
    
    
    @IBAction func tallyButtonPressed(_ sender: Any) {
        value += myTally.counter
        updateTally()
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        value = myTally.resetNumber
        updateTally()
    }
    
}
