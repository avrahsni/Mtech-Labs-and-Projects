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
//
//
//        return [
//        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
//        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
//        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
//        Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
//        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
//        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
//        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
//        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
//        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
//        Emoji(symbol: "📚", name: "Stack of Books",description: "Three colored books stacked on each other.", usage: "homework, studying"),
//        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
//        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
//     ]
//    }

}

let documentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

