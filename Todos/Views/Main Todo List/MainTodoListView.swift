//
//  MainTodoListView.swift
//  Todos
//
//  Created by YJ Soon on 3/3/23.
//

import SwiftUI

struct MainTodoListView: View {
    @State var showAddSheet = false
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        NavigationStack {
            List(todoManager.todosFiltered, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
            }
            .searchable(text: $todoManager.searchTerm)
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
                NewTodoView(todos: $todoManager.todos)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
