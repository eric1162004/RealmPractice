//
//  TaskView.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject private var viewModel: TaskViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var taskTitle: String = ""
    
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
        .navigationTitle("Edit Todo")
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
        presentationMode.wrappedValue.dismiss()
    }
    
}
