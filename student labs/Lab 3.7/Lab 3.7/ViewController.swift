//
//  ViewController.swift
//  Lab 3.7
//
//  Created by Snir Avrahami on 9/18/22.
//

import UIKit

// singleton
struct UserController {
    static var singleton = UserController()
    var users = [ViewController.User]()
    var created = false
    mutating func checkNew() {
        created = users.last!.created
    }
        func newUser(username: String, password: String, maidenName: String, created: Bool) {
    //        var newUser = user(username: username, password: password, maidenName: maidenName)
    //        users[username] = newUser
        }
    
}



class ViewController: UIViewController, addUser {
    func newUser(username: String, password: String, maidenName: String, created: Bool) {
        //        var newUser = User(username: username, password: password, maidenName: maidenName, created: created)
        //        users[username] = newUser
    }
    
    
    // MARK: Outlets
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var forgotUsername: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var newUserLabel: UILabel!
    
    struct User {
        let username: String
        var password: String
        let maidenName: String
        var created: Bool
        
        init(username: String, password: String, maidenName: String, created: Bool) {
            self.username = username
            self.password = password
            self.maidenName = maidenName
            self.created = created
        }
    }
    var users = [User(username: "test", password: "test", maidenName: "test", created: false)]
    
    var currentUser = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newUserLabel.isHidden = true
        users = UserController.singleton.users
        if let created = users.last?.created {
            if created {
                newUserLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.newUserLabel.isHidden = true
                }
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        switch sender {
        case forgotUsername:
            segue.destination.navigationItem.title = "Forgot Username Screen"
        case forgotPassword:
            segue.destination.navigationItem.title = "Forgot Password Screen"
        case registerButton:
            guard let registerView = segue.destination as? RegisterViewController else {return}
            registerView.navigationItem.title = "Register"
            registerView.delegate = self
            
        default:
            segue.destination.navigationItem.title = "Welcome \(usernameText.text!)"
        }
        
    }
    
    @IBAction func forgotUsernamePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotSomething", sender: forgotUsername)
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotSomething", sender: forgotPassword)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "login" {
            guard let username = usernameText.text, username != "", let password = passwordText.text, password != "" else {
                usernameText.backgroundColor = usernameText.text == "" ? .red : .white
                passwordText.backgroundColor = passwordText.text == "" ? .red : .white
                return false }
            let users = UserController.singleton.users
            
            for i in 0..<users.count {
                if username == users[i].username {
                    currentUser = i
                }
            }
            if username == users[currentUser].username {
                usernameText.backgroundColor = .white
            }
            else {
                usernameText.backgroundColor = .red
                return false
            }
            if password == users[currentUser].password {
                passwordText.backgroundColor = .white
                return true
            }
            else {
                passwordText.backgroundColor = .red
                return false
            }
        }
        return true
    }
    
    
    
}

    
