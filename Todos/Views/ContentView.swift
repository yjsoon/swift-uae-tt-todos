//
//  ContentView.swift
//  Todos
//
//  Created by YJ Soon on 24/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        TabView {
            
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
            
            HowManyMoreView()
                .tabItem {
                    Label("Number left", systemImage: "number.circle.fill")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
