//
//  ViewController.swift
//  Light Project
//
//  Created by Snir Avrahami on 9/8/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties & Outlets
    var lightOn = true
    
    // MARK: Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    // MARK: Actions
    fileprivate func updateUI() {
//        if lightOn {
//            view.backgroundColor = .white
//            //lightButton.setTitle("ON", for: .normal)
//        }
//        else {
//            view.backgroundColor = .black
//            //lightButton.setTitle("OFF", for: .normal)
//        }
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func ToggleLight(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    

}

