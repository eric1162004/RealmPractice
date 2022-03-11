//
//  AddTaskView.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import SwiftUI

struct AddTaskView: View {
    
    @State private var taskTitle: String = ""
    @EnvironmentObject private var viewModel: TaskViewModel
    
    var body: some View {
        HStack(spacing: 12){
            TextField("Enter New Task..", text: $taskTitle)
            
            Button(action: handleSubmit){
                Image(systemName: "plus")
            }
        }
        .padding(20)
    }
    
    private func handleSubmit() {
        viewModel.addTask(title: taskTitle)
        taskTitle = ""
    }
}
