//
//  ContentView.swift
//  Todos
//
//  Created by YJ Soon on 24/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Buy some groceries"),
        Todo(title: "Pick up son from school"),
        Todo(title: "Prepare for class", isCompleted: true)
    ]
    
    var body: some View {
        NavigationStack {
            List(todos) { todo in
                Text(todo.title)
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
