//
//  ViewController.swift
//  ItunesGuidedProject
//
//  Created by Snir Avrahami on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    let controller = ITunesController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        Task {
            let info = try await ITunesController.fetchITunesInfo(controller)
        }
        
    }
    
}

