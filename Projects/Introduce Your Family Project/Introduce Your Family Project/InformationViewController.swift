//
//  InformationViewController.swift
//  Introduce Your Family Project
//
//  Created by Snir Avrahami on 9/27/22.
//

import UIKit

protocol familyMember: AnyObject {
    var familyMember: person { get set }
}

class InformationViewController: UIViewController {
//    var familyMember = FamilyTableViewController.familyMember
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var relationLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthMonthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    weak var delegate: familyMember?
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personInstance = delegate!.familyMember
        
        nameLabel.text = personInstance.name
        relationLabel.text! += personInstance.relation
        occupationLabel.text! += personInstance.occupation
        ageLabel.text! += "\(personInstance.age)"
        birthMonthLabel.text! += personInstance.birthMonth
        genderLabel.text! += personInstance.gender
        imageView.image = personInstance.image
    }

}
