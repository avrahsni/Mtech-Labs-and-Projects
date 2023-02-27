//
//  User.swift
//  Interview Prep Code Challenge 1
//
//  Created by Snir Avrahami on 2/25/23.
//

import Foundation

struct User: Codable, Equatable {
    var name: String
    
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

let documentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
