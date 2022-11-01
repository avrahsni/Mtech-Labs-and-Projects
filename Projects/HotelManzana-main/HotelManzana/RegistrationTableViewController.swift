
import UIKit

//protocol detailViewDelegate {
//    var isDetailView: Bool { get }
//}

var isDetailView = Bool()


class RegistrationTableViewController: UITableViewController {
    
    var localDetailView = Bool()
    
    var registrations: [Registration] = []
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return dateFormatter
        
    }()
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController, let registration = addRegistrationTableViewController.registration else { return }
        
        registrations.append(registration)
        tableView.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "details" {
//            print("identifier is details")
//            localDetailView = true
//            isDetailView = true
//        } else {
//            print("identifier is not details")
//            localDetailView = false
//            isDetailView = false
//        }
//
//    }
    
    @IBSegueAction func addRegistrationAction(_ coder: NSCoder) -> UINavigationController? {
        isDetailView = false
        return UINavigationController(coder: coder)
    }
    @IBSegueAction func detailViewAction(_ coder: NSCoder) -> UINavigationController? {
        isDetailView = true
        return UINavigationController(coder: coder)
    }
    
    
    func findDetailView() -> Bool {
        print("localDetailView: \(localDetailView)")
        print("isDetailView: \(isDetailView)")
        return localDetailView
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)

        let registration = registrations[indexPath.row]

        cell.textLabel?.text = registration.firstName + " " + registration.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " + dateFormatter.string(from: registration.checkOutDate) + ": " + registration.roomType.name

        return cell
    }

}
