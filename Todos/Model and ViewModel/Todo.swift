//
//  Todo.swift
//  Todos
//
//  Created by YJ Soon on 24/2/23.
//

import Foundation

struct Todo: Identifiable {
    
    var id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false
    
}
