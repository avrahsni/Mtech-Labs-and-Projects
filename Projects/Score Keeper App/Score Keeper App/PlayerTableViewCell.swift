//
//  PlayerTableViewCell.swift
//  Score Keeper App
//
//  Created by Snir Avrahami on 11/7/22.
//

import UIKit

protocol scored {
    func playerScored(cell: UITableViewCell, step: Int)
}

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var scoreStepper: UIStepper!
    
    var delegate: scored?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    func update(with player: Player) {
        playerNameLabel.text = player.name
        playerScoreLabel.text = "\(player.score)"
        scoreStepper.value = Double(player.score)
    }
    
    @IBAction func stepperStepped(_ sender: UIStepper) {
//        guard let superView = self.superview as? UITableView else { return }
        self.delegate?.playerScored(cell: self, step: Int(sender.value))
        playerScoreLabel.text = "\(Int(sender.value))"
    }
    
    

}
