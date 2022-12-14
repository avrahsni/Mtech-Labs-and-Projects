//
//  RepresentativeTableViewCell.swift
//  APIProject
//
//  Created by Snir Avrahami on 12/6/22.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var partyStateLabel: UILabel!
    @IBOutlet weak var websiteLinkLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        repNameLabel.text = "representative name"
        partyStateLabel.text = "camber party state"
        websiteLinkLabel.text = "website link"
        phoneNumberLabel.text = "phone number"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }
    

}
