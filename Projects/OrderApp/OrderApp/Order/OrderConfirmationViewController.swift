//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by Snir Avrahami on 12/22/22.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var confirmationLabel: UILabel!
    
    
    let minutesToPrepare: Int
    
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implimented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        confirmationLabel.text = "Thank you for your order, your estimated wait time is approximately \(minutesToPrepare) minutes"
    }
    

}
