//
//  AddPlayerViewController.swift
//  Score Keeper App
//
//  Created by Snir Avrahami on 11/7/22.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var playerScoreTextField: UITextField!
    @IBOutlet weak var scoreErrorLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var saveButtonTemp: UIButton!
    
//    init?(coder: NSCoder, player: Player?) {
//        self.player = player
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    var player: Player?
    var delegate: TableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    func updateSaveButtonState() {
        let nameText = playerNameTextField.text ?? ""
//        let scoreText = playerScoreTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty && validSetScore()
    }
    
    func validSetScore() -> Bool {
        let scoreText: Int? = Int(playerScoreTextField.text ?? " ")
        return scoreText != nil
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let name = playerNameTextField.text ?? ""
        let score = playerScoreTextField.text ?? ""
        player = Player(name: name, score: Int(score)!)
        delegate?.updateScores()
        performSegue(withIdentifier: "save", sender: self)
    }
    
    
    // MARK: - Navigation
    
    
    
}
