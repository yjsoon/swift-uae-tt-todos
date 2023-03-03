//
//  NewTodoView.swift
//  Todos
//
//  Created by YJ Soon on 24/2/23.
//

import SwiftUI

struct NewTodoView: View {
    @State var todoTitle = ""
    @State var todoSubtitle = ""
    @Binding var todos: [Todo]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            
            Section("Info") {
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    let newTodo = Todo(title: todoTitle, subtitle: todoSubtitle)
                    todos.append(newTodo)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
            
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(todos: .constant([]))
    }
}
