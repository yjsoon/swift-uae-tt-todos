//
//  HowManyMoreView.swift
//  Todos
//
//  Created by YJ Soon on 3/3/23.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        Text("You have \(todoManager.numTodosLeft) todos left!")
            .font(.largeTitle)
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
