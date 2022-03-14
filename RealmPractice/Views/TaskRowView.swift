//
//  TaskRowView.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import SwiftUI

struct TaskRowView: View  {
    
    // initialize with a task
    let task: Task
    
    // use taskViewModel
    @EnvironmentObject private var viewModel: TaskViewModel
    
    var body: some View {
        
        HStack(spacing: 8){
            Button {
                // mark complete action
                viewModel.markComplete(
                    id: task.id,
                    completed: !task.completed)
                
            } label: {
                Image(systemName: task.completed ? "checkmark.circle.fill": "circle")
                    .resizable()
                    .frame(width: 20, height:20)
                    .foregroundColor(task.completed ? Color.green : Color.gray)
            }
            Text(task.title)
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
    
}
