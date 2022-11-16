//
//  ToDo.swift
//  List
//
//  Created by Snir Avrahami on 11/11/22.
//

import Foundation

struct ToDo: Equatable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        return nil
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
