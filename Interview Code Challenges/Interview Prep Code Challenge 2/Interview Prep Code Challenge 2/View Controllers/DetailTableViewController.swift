//
//  DetailTableViewController.swift
//  Interview Prep Code Challenge 2
//
//  Created by Snir Avrahami on 2/27/23.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var image = [UIImage]()
    var user: User?
    var info = [String]()
    var includedDetails = [Bool]()
    var truePositions = [Int]()
    var trueCount = 0
    let options = ["Gender:", "Location:", "Email:", "Login:", "Registered:", "DOB:", "Phone:", "Cell:", "ID:", "Nationality:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else { return }
        
        info.append(user.gender)
        info.append("\(user.location.city), \(user.location.state), \(user.location.country)")
        info.append(user.email)
        info.append("\(user.login.username); \(user.login.password)")
        info.append(user.registered.date)
        info.append(user.dob.date)
        info.append(user.phone)
        info.append(user.cell)
        info.append("\(user.id.name): \(user.id.value ?? "000-00-0000")")
        info.append(user.nat)
        
        
        userImageView.image = image[2]
        navBar.title = "\(user.name.title) \(user.name.first) \(user.name.last)"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var trueCount = 0
        var count = 0
        for i in includedDetails {
            if i {
                truePositions.append(count)
                trueCount += 1
            }
            count += 1
        }
        return trueCount
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
        
        // Configure the cell...
        let pos = truePositions[trueCount]
        
        cell.detailLabel.text = options[pos]
        cell.infoLabel.text = info[pos]
        trueCount += 1
        
        return cell
    }
    // MARK: - Navigation

    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
