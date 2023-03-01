//
//  UsersViewController.swift
//  Interview Prep Code Challenge 2
//
//  Created by Snir Avrahami on 2/27/23.
//

import UIKit
import Foundation

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource, SaveSettingsDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var trashButton: UIBarButtonItem!
    
    var users = [User]()
    var images = [[UIImage]]()
    var thumbnails = [UIImage]()
    var results = [User]()
    var randNum = 1
    var amountToAdd = 1
    
    var includedDetails = [Bool]()
    
    var detailUser: User?
    var detailImage = [UIImage]()
    var details = [Bool]()
    
    let refreshControl = UIRefreshControl()
    
    let documentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    var archiveUrl: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("details").appendingPathExtension("json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        users = User.loadFromFile()
        includedDetails = loadSettingsFromFile()
        loadImagesFromFile(users)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        trashButtonEnabled()
    }
    
     @objc func refresh() {
         loadImagesFromFile(users)
         tableView.reloadData()
         refreshControl.endRefreshing()
    }
    
    func saveSettings(_ info: [Bool]) {
        includedDetails = info
        saveSettingsToFile(details: includedDetails)
    }
    
    func addUser(_ amount: Int, _ info: [Bool]) {
        
        includedDetails = info
        
        Task {
            do {
                // Make the API Call
                let usersResponse = try await GetUsersController().getUsers(amount: amount)
                
                self.users.append(contentsOf: usersResponse)
                
                for user in users {
                    let position = users.firstIndex(of: user)!
                    let thumbnail = try await GetPicturesController().getPictures(user.picture.thumbnail, position).image
                    let medium = try await GetPicturesController().getPictures(user.picture.medium, position).image
                    let large = try await GetPicturesController().getPictures(user.picture.large, position).image
                    images.append([thumbnail, medium, large])
                    thumbnails.append(thumbnail)
                }
                
                
                User.saveToFile(users: users)
                tableView.reloadData()
                
            } catch {
                print(error)
            }
        }
        
    }
    
    func saveSettingsToFile(details: [Bool]) {
        if let dataObject: Data = try? JSONEncoder().encode(includedDetails) {
            do {
                try? dataObject.write(to: archiveUrl)
                print("It worked")
            }
        }
        
        
    }
    
    func loadSettingsFromFile() -> [Bool] {
        guard let dataCheck = try? Data(contentsOf: archiveUrl) else {
            var settings = [Bool]()
            for _ in 0..<10 {
                settings.append(true)
            }
            return settings
        }
        if let details = try? JSONDecoder().decode([Bool].self, from: dataCheck) {
            
            return details
        }
        var settings = [Bool]()
        for _ in 0..<10 {
            settings.append(true)
        }
        return settings
    }
    
    func loadImagesFromFile(_ users: [User]) {
        
        Task {
            do {
                for user in users {
                    let position = users.firstIndex(of: user)!
                    let thumbnail = try await GetPicturesController().getPictures(user.picture.thumbnail, position).image
                    let medium = try await GetPicturesController().getPictures(user.picture.medium, position).image
                    let large = try await GetPicturesController().getPictures(user.picture.large, position).image
                    if thumbnails.count > position {
                        thumbnails.remove(at: position)
                    }
                    if images.count > position {
                        images.remove(at: position)
                    }
                    
                    thumbnails.insert(thumbnail, at: position)
                    images.insert([thumbnail, medium, large], at: position)
                    tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        
        // Configure the cell...
        cell.nameLabel.text = "\(user.name.title) \(user.name.first) \(user.name.last)"
        if thumbnails.count > indexPath.row {
            cell.thumbnailImageView.image = thumbnails[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailUser = users[indexPath.row]
        detailImage = images[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            users.remove(at: indexPath.row)
            thumbnails.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            includedDetails.remove(at: indexPath.row)
            User.saveToFile(users: users)
            // Then, delete the row from the table itself
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = users[sourceIndexPath.row]
        let thumbnail = thumbnails[sourceIndexPath.row]
        let image = images[sourceIndexPath.row]
        let dtls = includedDetails[sourceIndexPath.row]
        users.remove(at: sourceIndexPath.row)
        users.insert(movedObject, at: destinationIndexPath.row)
        thumbnails.remove(at: sourceIndexPath.row)
        thumbnails.insert(thumbnail, at: destinationIndexPath.row)
        images.remove(at: sourceIndexPath.row)
        images.insert(image, at: destinationIndexPath.row)
        includedDetails.remove(at: sourceIndexPath.row)
        includedDetails.insert(dtls, at: destinationIndexPath.row)
        User.saveToFile(users: users)
        tableView.reloadData()
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        tableView.setEditing(tableView.isEditing ? false : true, animated: true)
        trashButtonEnabled()
    }
    
    func trashButtonEnabled() {
        if tableView.isEditing {
            trashButton.isEnabled = true
            trashButton.tintColor = .red
            trashButton.customView?.alpha = 1
        } else {
            trashButton.isEnabled = false
            trashButton.tintColor = .clear
            trashButton.customView?.alpha = 0
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if (editing) {
            super.setEditing(true, animated: true)
            self.navigationItem.rightBarButtonItem!.isEnabled = false
        } else {
            super.setEditing(false, animated: true)
            self.navigationItem.rightBarButtonItem!.isEnabled = true
        }
    }
    
    @IBAction func addUsersButtonPressed(_ sender: Any) {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0,animated: true)
        vc.view.addSubview(pickerView)
        
        let randomAlert = UIAlertController(title: "Add Users", message: "How many random users do you want to add?", preferredStyle: UIAlertController.Style.alert)
        randomAlert.setValue(vc, forKey: "contentViewController")
        randomAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
            self.addUser(self.amountToAdd, self.includedDetails)
        }))
        randomAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        pickerView.selectRow(0, inComponent: 0, animated: true)
        
        amountToAdd = 1
        
        self.present(randomAlert, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        amountToAdd = row + 1
    }
    
    @IBAction func trashButtonPressed(_ sender: Any) {
        
        users.removeAll()
        User.saveToFile(users: users)
        tableView.reloadData()
        setEditing(false, animated: true)
    }
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "displayOptionsSegue" {
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.topViewController as! DetailSettingsTableViewController
            
            vc.settings = includedDetails
            vc.delegate = self
        }
        if segue.identifier == "detailSegue" {
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.topViewController as! DetailTableViewController
            
            vc.user = detailUser
            vc.image = detailImage
            vc.includedDetails = includedDetails
            results.removeAll()
        }
    }

}
