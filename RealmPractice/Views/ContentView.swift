//
//  ContentView.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        // wrap with a navigation view
        NavigationView {
            VStack{
                
                // a view to add a task
                AddTaskView()
                
                // a view to list all task
                TaskListView()
            }
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
