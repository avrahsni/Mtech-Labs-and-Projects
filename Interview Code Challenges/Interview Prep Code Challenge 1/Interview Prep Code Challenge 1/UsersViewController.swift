//
//  UsersViewController.swift
//  Interview Prep Code Challenge 1
//
//  Created by Snir Avrahami on 2/25/23.
//

import UIKit
import Foundation

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddUserDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    var results = [User]()
    var randNum = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = User.loadFromFile()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addUser(_ userName: String) {
        users.append(User(name: userName))
        User.saveToFile(users: users)
        tableView.reloadData()
    }
    
    func generateRandom(_ num: Int) {
        guard !users.isEmpty else { return }
        
        print(results.count)
        print(num)
        
        while results.count < num {
            let user = users[Int.random(in: 0..<users.count)]
            
            if !results.contains(user) {
                results.append(user)
            }
            
        }
        
        performSegue(withIdentifier: "showRandomSegue", sender: self)
        
    }
    
    
    @IBAction func randomButtonPressed(_ sender: Any) {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0,animated: true)
        vc.view.addSubview(pickerView)
        let randomAlert = UIAlertController(title: "Confirmation", message: "How many random users do you want to choose?", preferredStyle: UIAlertController.Style.alert)
        randomAlert.setValue(vc, forKey: "contentViewController")
        randomAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
            self.generateRandom(self.randNum)
        }))
        randomAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        pickerView.selectRow(0, inComponent: 0, animated: true)
        randNum = 1
        self.present(randomAlert, animated: true)
        
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        users.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        randNum = row + 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = user.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            users.remove(at: indexPath.row)
            User.saveToFile(users: users)
            // Then, delete the row from the table itself
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = users[sourceIndexPath.row]
        users.remove(at: sourceIndexPath.row)
        users.insert(movedObject, at: destinationIndexPath.row)
        User.saveToFile(users: users)
        tableView.reloadData()
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        tableView.setEditing(tableView.isEditing ? false : true, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "addUserSegue" {
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.topViewController as! AddUserTableViewController
            
            vc.delegate = self
        }
        if segue.identifier == "showRandomSegue" {
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.topViewController as! ResultsTableViewController
            
            vc.results = results
            results.removeAll()
        }
    }

}
