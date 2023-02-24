//
//  TodoDetailView.swift
//  Todos
//
//  Created by YJ Soon on 24/2/23.
//

import SwiftUI

struct TodoDetailView: View {
    
    @State var todo = Todo(title: "Feed the demo cat")
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subtitle)
            Toggle("Is completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView()
    }
}
