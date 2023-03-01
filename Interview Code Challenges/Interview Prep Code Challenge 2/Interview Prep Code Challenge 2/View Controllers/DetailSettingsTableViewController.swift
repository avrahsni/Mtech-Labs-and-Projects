//
//  DetailSettingsTableViewController.swift
//  Interview Prep Code Challenge 2
//
//  Created by Snir Avrahami on 3/1/23.
//

import UIKit

protocol SaveSettingsDelegate {
    func saveSettings(_ info: [Bool])
}

class DetailSettingsTableViewController: UITableViewController {
    
    @IBOutlet var settingsButtons: [UIButton]!
    
    var settings = [Bool]()
    
    var delegate: SaveSettingsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if settings.isEmpty {
            for _ in 0..<10 {
                settings.append(true)
            }
        }
        
        for i in 0..<settingsButtons.count - 1 {
            if settings[i] {
                settingsButtons[i].setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            } else {
                settingsButtons[i].setImage(UIImage(systemName: "square"), for: .normal)
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
    @IBAction func buttonToggled(_ sender: UIButton) {
        
        let senderPos = settingsButtons.firstIndex(of: sender)!
        
        if sender.currentImage == UIImage(systemName: "square") {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            settings[senderPos] = true
        } else {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            settings[senderPos] = false
        }
    }
    
    // MARK: - Navigation
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        delegate?.saveSettings(settings)
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
