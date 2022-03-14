//
//  AddTaskView.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import SwiftUI

struct AddTaskView: View {
    
    // store a task title input by the user
    @State private var taskTitle: String = ""
    
    // use a task view model
    @EnvironmentObject private var viewModel: TaskViewModel
    
    var body: some View {
        HStack(spacing: 12){
            
            // text field to take task tile
            TextField("Enter New Task..", text: $taskTitle)
            
            // add task title button
            Button(action: handleSubmit){
                Image(systemName: "plus")
            }
        }
        .padding(20)
    }
    
    // use vm to add a task
    private func handleSubmit() {
        viewModel.addTask(title: taskTitle)
        
        // reset task title to an empty string
        taskTitle = ""
    }
}
