//
//  LifeFormTableViewCell.swift
//  Life-FormSearch
//
//  Created by Snir Avrahami on 1/25/23.
//

import UIKit

class LifeFormTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(with result: result) {
        self.textLabel?.text = result.content
        self.detailTextLabel?.text = result.title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
