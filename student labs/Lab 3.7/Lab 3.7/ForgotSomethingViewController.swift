//
//  ForgotSomethingViewController.swift
//  Lab 3.7
//
//  Created by Snir Avrahami on 10/3/22.
//

import UIKit

class ForgotSomethingViewController: UIViewController {
    
    
    @IBOutlet weak var firstPrompt: UILabel!
    @IBOutlet weak var secondPrompt: UILabel!
    @IBOutlet weak var firstPromptTextField: UITextField!
    @IBOutlet weak var secondPromptTextField: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var verifyPassword: UITextField!
    @IBOutlet weak var passwordErrorPrompt: UITextView!
    @IBOutlet weak var UsernameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
