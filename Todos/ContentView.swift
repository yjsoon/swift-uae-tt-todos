//
//  ContentView.swift
//  Todos
//
//  Created by YJ Soon on 24/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Buy some groceries", subtitle: "Vegetables and corn"),
        Todo(title: "Pick up son from school"),
        Todo(title: "Prepare for class", isCompleted: true)
    ]
    
    var body: some View {
        NavigationStack {
            List($todos) { $todo in
                
                NavigationLink {
                    
                    TodoDetailView()
                    
                } label: {
                    
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        VStack(alignment: .leading) {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            if !todo.subtitle.isEmpty {
                                Text(todo.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                }
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
