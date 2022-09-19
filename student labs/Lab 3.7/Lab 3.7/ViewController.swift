//
//  ViewController.swift
//  Lab 3.7
//
//  Created by Snir Avrahami on 9/18/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var forgotUsername: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        switch sender {
        case forgotUsername:
            segue.destination.navigationItem.title = "Forgot Username"
        case forgotPassword:
            segue.destination.navigationItem.title = "Forgot Password"
        default:
            segue.destination.navigationItem.title = usernameText.text
        }
        
    }

    @IBAction func forgotUsernamePressed(_ sender: Any) {
        performSegue(withIdentifier: "forgotSomething", sender: forgotUsername)
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        performSegue(withIdentifier: "forgotSomething", sender: forgotPassword)
    }
    
    
}

