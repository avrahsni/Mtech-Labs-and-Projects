//
//  AddUserTableViewController.swift
//  Interview Prep Code Challenge 2
//
//  Created by Snir Avrahami on 2/27/23.
//

import UIKit

protocol AddUserDelegate {
    func addUser(_ amount: Int, _ info: [Bool])
}

class AddUserTableViewController: UITableViewController {
    
    @IBOutlet weak var amountStepper: UIStepper!
    @IBOutlet weak var userAmountLabel: UILabel!
    
    @IBOutlet var settingsButtons: [UIButton]!
    
    var delegate: AddUserDelegate?
    
    var amount = 1
    var settings = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAmountLabel.text = "\(amount) User(s)"
        
        for _ in 0..<10 {
            settings.append(true)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return section == 1 ? 1 : 10
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    @IBAction func stepperStepped(_ sender: UIStepper) {
        amount = Int(sender.value)
        userAmountLabel.text = "\(amount) User(s)"
    }
    
    
    @IBAction func buttonToggled(_ sender: UIButton) {
        
        let senderPos = settingsButtons.firstIndex(of: sender)!
        
        if sender.currentImage == UIImage(systemName: "square") {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            settings[senderPos] = true
            print(settings)
        } else {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            settings[senderPos] = true
            print(settings)
        }
    }
    
    

    
    // MARK: - Navigation
    
    @IBAction func createUserButtonPressed(_ sender: Any) {
        delegate?.addUser(amount, settings)
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
