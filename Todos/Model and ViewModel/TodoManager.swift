//
//  TodoManager.swift
//  Todos
//
//  Created by YJ Soon on 3/3/23.
//

import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    @Published var todos: [Todo] = [] {
        didSet {
            save()
        }
    }
    
    @Published var searchTerm = ""
    
    var numTodosLeft: Int {
        todos.filter { !$0.isCompleted }.count
    }
    
    var todosFiltered: Binding<[Todo]> {
        Binding(
            get: {
                if self.searchTerm.isEmpty {
                    return self.todos
                }
                
                return self.todos.filter {
                    $0.title.lowercased().contains(self.searchTerm.lowercased())
                }
            },
            set: {
                self.todos = $0
            }
        )
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
