//
//  Player.swift
//  Score Keeper App
//
//  Created by Snir Avrahami on 11/7/22.
//

import Foundation

struct Player: Codable {
    var name: String
    var score: Int
    
    static func saveToFile(players: [Player]) {
        if let dataObject: Data = try? JSONEncoder().encode(players) {
            do {
                try? dataObject.write(to: archiveUrl)
                print("It worked")
            }
        }
        
        
    }
    
    static func loadFromFile() -> [Player]? {
        guard let dataCheck = try? Data(contentsOf: archiveUrl) else { return nil }
        if let players = try? JSONDecoder().decode([Player].self, from: dataCheck) {
            
            return players
        }
        
        return nil
    }
    
    
    static var archiveUrl: URL = documentsDirectory.appendingPathComponent("Players").appendingPathExtension("json")
    
//    static func samplePlayers() -> [Player] {

}

let documentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

