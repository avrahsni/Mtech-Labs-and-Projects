//
//  User.swift
//  Interview Prep Code Challenge 2
//
//  Created by Snir Avrahami on 2/27/23.
//

import Foundation

struct User: Codable, Equatable {
    
    var name: Name
    var picture: Picture
    var gender: String
    var location: Location
    var email: String
    var login: Login
    var dob: DateOfBirth
    var registered: Registered
    var phone: String
    var cell: String
    var id: Identification
    var nat: String
    
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.login.uuid == rhs.login.uuid
    }
    
    
    static func saveToFile(users: [User]) {
        if let dataObject: Data = try? JSONEncoder().encode(users) {
            do {
                try? dataObject.write(to: archiveUrl)
                print("It worked")
            }
        }
        
        
    }
    
    static func loadFromFile() -> [User] {
        guard let dataCheck = try? Data(contentsOf: archiveUrl) else { return [User]() }
        if let players = try? JSONDecoder().decode([User].self, from: dataCheck) {
            
            return players
        }
        
        return [User]()
    }
    
    
    static var archiveUrl: URL = documentsDirectory.appendingPathComponent("Users").appendingPathExtension("json")

}

struct Name: Codable {
    var title: String
    var first: String
    var last: String
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

struct Location: Codable {
    var street: Street
    var city: String
    var state: String
    var country: String
    var postcode: String
    var coordinates: Coordinates
    var timezone: Timezone
}

struct Street: Codable {
    var number: Int
    var name: String
}

struct Coordinates: Codable {
    var latitude: String
    var longitude: String
}

struct Timezone: Codable {
    var offset: String
    var description: String
}

struct Login: Codable {
    var uuid: String
    var username: String
    var password: String
    
}

struct DateOfBirth: Codable {
    var date: String
    var age: Int
}

struct Registered: Codable {
    var date: String
    var age: Int
}

struct Identification: Codable {
    var name: String
    var value: String
}

let documentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
