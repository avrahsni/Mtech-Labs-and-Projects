//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Snir Avrahami on 10/21/22.
//

import Foundation

struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
    
    init(name: String, age: Int, league: String, team: String) {
        self.name = name
        self.age = age
        self.league = league
        self.team = team
    }
    
    
}
