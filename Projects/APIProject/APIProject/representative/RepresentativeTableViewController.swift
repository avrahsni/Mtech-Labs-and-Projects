//
//  RepresentativeTableViewController.swift
//  APIProject
//
//  Created by Snir Avrahami on 12/6/22.
//

import UIKit

class RepresentativeTableViewController: UITableViewController {
    
    @IBOutlet weak var repSearchBar: UISearchBar!
    
    var reps = [rep]()
    let controller = RepresentativeInfoController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchRepresentatives() {
        
//        self.reps = []
        self.tableView.reloadData()
        
        let searchTerm = repSearchBar.text ?? ""
        
        if !searchTerm.isEmpty {
            
            // set up query dictionary
            let query = [
                "zip": searchTerm,
                "output": "json"
            ]
            //"attribute": "authorTerm",
            
            
            // use the item controller to fetch items
            // if successful, use the main queue to set self.items and reload the table view
            // otherwise, print an error to the console
            Task {
                do {
                    reps = try await controller.fetchRepData(matching: query)
                    print(reps)
                    print(reps.count)
                    tableView.reloadData()
                }
                catch {
                    print(error)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as! RepresentativeTableViewCell
        configure(cell: cell, forItemAt: indexPath)

        // Configure the cell...



        return cell
    }
    
    func configure(cell: RepresentativeTableViewCell, forItemAt indexPath: IndexPath) {
        
        let rep = reps[indexPath.row]
        
        print(rep.state)
        cell.repNameLabel.text = rep.name
        cell.phoneNumberLabel.text = "Phone: \(rep.phone)"
        cell.websiteLinkLabel.text = "Website: \(rep.link)"
        if rep.link.contains("senate") {
            cell.partyStateLabel.text = "Senate \(rep.party), \(rep.state)"
        } else {
            cell.partyStateLabel.text = "House \(rep.party), \(rep.state)"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RepresentativeTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchRepresentatives()
        searchBar.resignFirstResponder()
    }
}
