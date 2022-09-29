//
//  InformationViewController.swift
//  Introduce Your Family Project
//
//  Created by Snir Avrahami on 9/27/22.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var relationLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthMonthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    struct tempPerson {
        var name: String
        var age: Int
        var birthMonth: String
        var relation: String
        var occupation: String
        var gender: String
        var image: UIImage?
        
        init(name: String, age: Int, relation: String,occupation: String, gender: String, birthMonth: String, image: UIImage?) {
            self.name = name
            self.age = age
            self.relation = relation
            self.gender = gender
            self.occupation = occupation
            self.birthMonth = birthMonth
            self.image = image
        }
    }
    var personInstance = tempPerson(name: "", age: 0, relation: "", occupation: "", gender: "", birthMonth: "", image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = personInstance.name
        relationLabel.text! += personInstance.relation
        occupationLabel.text! += personInstance.occupation
        ageLabel.text! += "\(personInstance.age)"
        birthMonthLabel.text! += personInstance.birthMonth
        genderLabel.text! += personInstance.gender
        imageView.image = personInstance.image
    }

}
