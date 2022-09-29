//
//  ViewController.swift
//  Introduce Your Family Project
//
//  Created by Snir Avrahami on 9/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var familyMembers: [UIButton]!
    
    struct person {
        let name: String
        var age: Int
        let birthMonth: String
        let relation: String
        var occupation: String
        // Yes, gender is a let
        let gender: String
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
    let dad = person(name: "Nahum", age: 47, relation: "Father",occupation: "Traveling Salesman", gender: "Male", birthMonth: "January", image: UIImage(named: "dad"))
    let mom = person(name: "Yael", age: 46, relation: "Mother",occupation: "DoTerra Employee", gender: "Female", birthMonth: "July", image: nil)
    let ron = person(name: "Ron", age: 18, relation: "Eldest Brother", occupation: "Web Developer", gender: "Male", birthMonth: "January", image: nil)
    let me = person(name: "Snir", age: 17, relation: "Me", occupation: "Student/Math Tutor", gender: "Male", birthMonth: "August", image: nil)
    let maya = person(name: "Maya", age: 10, relation: "Younger Sister",occupation: "Student", gender: "Female", birthMonth: "June", image: nil)
    let ely = person(name: "Ely", age: 8, relation: "Youngest Brother",occupation: "Student", gender: "Male", birthMonth: "December", image: nil)
    
    var personInstance = person(name: "hi", age: 0, relation: "", occupation: "", gender: "", birthMonth: "", image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "dad":
            personInstance = dad
        case "mom":
            personInstance = mom
        case "ron":
            personInstance = ron
        case "snir":
            personInstance = me
        case "maya":
            personInstance = maya
        default:
            personInstance = ely
        }
        if let member = segue.destination as? InformationViewController {
            member.personInstance.name = personInstance.name
            member.personInstance.relation = personInstance.relation
            member.personInstance.occupation = personInstance.occupation
            member.personInstance.age = personInstance.age
            member.personInstance.birthMonth = personInstance.birthMonth
            member.personInstance.gender = personInstance.gender
            member.personInstance.image = personInstance.image
            
        }
    }
    
    @IBAction func personPressed(_ sender: UIButton) {}
    
    

}

