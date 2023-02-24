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
    
    var body: some View {
        Form {
            
            Section("Info") {
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    // TODO: Implement this
                }
                Button("Cancel", role: .destructive) {
                    // TODO: Implement this
                }
            }
            
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
