//
//  RegisterViewController.swift
//  Lab 3.7
//
//  Created by Snir Avrahami on 10/3/22.
//

import UIKit


protocol addUser: ViewController {
    func newUser(username: String, password: String, maidenName: String, created: Bool)
}

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var verifyUsername: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verifyPassword: UITextField!
    @IBOutlet weak var maidenNameTextField: UITextField!
    @IBOutlet weak var usernameNoMatch: UITextView!
    @IBOutlet weak var passwordNoMatch: UITextView!
    
    struct user {
        var username = ""
        var password = ""
        var maidenName = ""
    }
//    var newUser = user.self
    
    weak var delegate: addUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameNoMatch.isHidden = true
        passwordNoMatch.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func checkUsername() -> Bool {
        usernameNoMatch.isHidden = true
        guard let username = usernameTextField.text, username != "" else {
            usernameNoMatch.text = "Enter A Username"
            usernameNoMatch.isHidden = false
            return false
        }
        guard username == verifyUsername.text else {
            usernameNoMatch.text = "Username Does Not Match"
            usernameNoMatch.isHidden = false
            return false }
        return true
    }
    
    func checkPassword() -> Bool {
        passwordNoMatch.isHidden = true
        guard let password = passwordTextField.text, password != "" else {
            passwordNoMatch.text = "Enter A Password"
            passwordNoMatch.isHidden = false
            return false
        }
        guard password == verifyPassword.text else {
            passwordNoMatch.text = "Password Does Not Match"
            passwordNoMatch.isHidden = false
            return false }
        let specialCharacterSet = CharacterSet(charactersIn: ".,!@#$%^&*<>?+=-")
        if password.count < 8 {
            passwordNoMatch.text = "Password Is Too Short"
            passwordNoMatch.isHidden = false
            return false
        }
        if password.rangeOfCharacter(from: specialCharacterSet) == nil {
            passwordNoMatch.text = "Password Needs To Contain A Special Character"
            passwordNoMatch.isHidden = false
            return false
        }
        
        if password.lowercased() == password || password.uppercased() == password {
            passwordNoMatch.text = "Password Needs To Contain Both Uppercase & Lowercase Letters"
            passwordNoMatch.isHidden = false
            return false
        }
        
        return true
    }
    
    
    func checkFields() -> Bool {
        checkPassword()
        checkUsername()
        guard checkPassword(), checkUsername() else {return false}
        return true
    }

    
    // MARK: - Navigation
     
    @IBAction func DonePressed(_ sender: Any) {
        guard checkFields() else { return }
//        delegate?.newUser(username: usernameTextField.text!, password: passwordTextField.text!, maidenName: maidenNameTextField.text!)
        UserController.singleton.users.append(ViewController.User(username: usernameTextField.text!, password: passwordTextField.text!, maidenName: maidenNameTextField.text!, created: true))
//        UserController.singleton.created = true
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        // unwindSegue
    }
    
    
}
