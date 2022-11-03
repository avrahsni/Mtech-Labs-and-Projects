//
//  family.swift
//  Introduce Your Family Project
//
//  Created by Snir Avrahami on 11/3/22.
//

import Foundation
import UIKit

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
    
    static func familyMembers() ->[person] {
        return [
        person(name: "Nahum", age: 47, relation: "Father",occupation: "Traveling Salesman", gender: "Male", birthMonth: "January", image: UIImage(named: "dad")),
        person(name: "Yael", age: 46, relation: "Mother",occupation: "DoTerra Employee", gender: "Female", birthMonth: "July", image: nil),
        person(name: "Ron", age: 18, relation: "Eldest Brother", occupation: "Web Developer", gender: "Male", birthMonth: "January", image: nil),
        person(name: "Snir", age: 17, relation: "Me", occupation: "Student/Math Tutor", gender: "Male", birthMonth: "August", image: nil),
        person(name: "Maya", age: 10, relation: "Younger Sister",occupation: "Student", gender: "Female", birthMonth: "June", image: nil),
        person(name: "Ely", age: 8, relation: "Youngest Brother",occupation: "Student", gender: "Male", birthMonth: "December", image: nil)
        ]
    }
    
    
}


    
