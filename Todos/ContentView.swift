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
    @State var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            List($todos, editActions: [.all]) { $todo in
                    NavigationLink {
                        TodoDetailView(todo: $todo)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(todos: $todos)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
