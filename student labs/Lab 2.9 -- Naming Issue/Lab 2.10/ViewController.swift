//
//  ViewController.swift
//  Lab 2.10
//
//  Created by Snir Avrahami on 9/1/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties & Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    // MARK: Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Actions
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        self.label.text = self.textField.text
    }
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        self.label.text = ""
        self.textField.text = ""
    }
    
}

