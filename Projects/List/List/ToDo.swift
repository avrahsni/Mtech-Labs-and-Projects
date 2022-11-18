//
//  ToDo.swift
//  List
//
//  Created by Snir Avrahami on 11/11/22.
//

import Foundation

struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension(".plist")
    
    
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func sampleData() -> [ToDo] {
        return [ToDo(title: "first", isComplete: false, dueDate: Date()),
                ToDo(title: "second", isComplete: false, dueDate: Date()),
                ToDo(title: "third", isComplete: false, dueDate: Date()),
                ToDo(title: "fourth", isComplete: false, dueDate: Date()),
                ToDo(title: "fifth", isComplete: false, dueDate: Date()),
                ToDo(title: "sixth", isComplete: false, dueDate: Date()),
        ]
    }
}
