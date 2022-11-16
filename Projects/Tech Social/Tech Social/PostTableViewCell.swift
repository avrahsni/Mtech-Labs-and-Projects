//
//  PostTableViewCell.swift
//  Tech Social
//
//  Created by Snir Avrahami on 11/3/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescriptionText: UITextView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
