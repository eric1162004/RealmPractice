//
//  TaskView.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import SwiftUI

struct TaskView: View {
    
    // use a task view model
    @EnvironmentObject private var viewModel: TaskViewModel
    
    // toggle to return to the main navigation view
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // for updating a task title
    @State private var taskTitle: String = ""
    
    // initize this view with a task
    let task: Task
    
    var body: some View{
        VStack(alignment: .leading, spacing: 24){
            VStack(alignment: .leading, spacing: 4){
                Text("Title")
                    .foregroundColor(Color.gray)
                
                TextField("Enter title..", text: $taskTitle)
                    .font(.largeTitle)
                
                Divider()
            }
            Button(action: deleteAction){
                HStack{
                    Image(systemName: "trash.fill")
                    Text("Delete")
                }
                .foregroundColor(Color.red)
            }
            Spacer()
        }
        .navigationTitle("Add an item")
        .navigationBarTitleDisplayMode(.inline)
        .padding(24)
        .onAppear {
            taskTitle = task.title
        }
        .onDisappear {
            updateTask()
        }
    }
    
    private func updateTask(){
        viewModel.updateTitle(id:task.id, newTitle: taskTitle)
    }
    
    private func deleteAction(){
        viewModel.remove(id: task.id)
        
        // return to the main navigation view
        presentationMode.wrappedValue.dismiss()
    }
    
}
