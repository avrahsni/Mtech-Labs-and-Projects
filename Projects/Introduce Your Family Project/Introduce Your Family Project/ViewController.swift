//
//  ViewController.swift
//  Introduce Your Family Project
//
//  Created by Snir Avrahami on 9/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var familyMembers: [UIButton]!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        var family = [dad, mom, ron, me, maya, ely]
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case "dad":
//            personInstance = dad
//        case "mom":
//            personInstance = mom
//        case "ron":
//            personInstance = ron
//        case "snir":
//            personInstance = me
//        case "maya":
//            personInstance = maya
//        default:
//            personInstance = ely
//        }
//        if let member = segue.destination as? InformationViewController {
//            member.personInstance.name = personInstance.name
//            member.personInstance.relation = personInstance.relation
//            member.personInstance.occupation = personInstance.occupation
//            member.personInstance.age = personInstance.age
//            member.personInstance.birthMonth = personInstance.birthMonth
//            member.personInstance.gender = personInstance.gender
//            member.personInstance.image = personInstance.image
//
//        }
//    }
    
    @IBAction func personPressed(_ sender: UIButton) {}
    
    

}

