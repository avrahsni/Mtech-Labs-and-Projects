//
//  ViewController.swift
//  ContestLab5.3
//
//  Created by Snir Avrahami on 12/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func checkEmail() {
        if emailTextField.text != "" && emailTextField.text?.contains(" ") != true {
            print("if")
            performSegue(withIdentifier: "emailSubmitted", sender: self)
        } else {
            print("else")
            emailTextField.backgroundColor = .red
            UIView.animate(withDuration: 0.25) { [self] in
                let shake1 = CGAffineTransform(translationX: 8, y: 0)
                emailTextField.transform = shake1
            }
            UIView.animate(withDuration: 0.25) { [self] in
                let shake2 = CGAffineTransform(translationX: -16, y: 0)
                emailTextField.transform = shake2
            }
            UIView.animate(withDuration: 0.25) { [self] in
                let shake3 = CGAffineTransform(translationX: 16, y: 0)
                emailTextField.transform = shake3
            }
            UIView.animate(withDuration: 0.125) { [self] in
                let shake4 = CGAffineTransform(translationX: 8, y: 0)
                emailTextField.transform = shake4
            } completion: { [self] (_) in
                emailTextField.transform = CGAffineTransform.identity
            }
            
        }
    }
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
//        sender.backgroundColor = .white
    }
    
    @IBAction func textFieldTouchDown(_ sender: UITextField) {
        sender.backgroundColor = .white
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        checkEmail()
    }
    
    
    
}

