//
//  TaskListView.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import SwiftUI

struct TaskListView: View {
    
    // use a taskViewModel
    @EnvironmentObject private var viewModel: TaskViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                
                ForEach(viewModel.tasks, id: \.id) { task in
                    
                    NavigationLink {
                        // navigate to a task detail view
                        TaskView(task: task)
                    } label: {
                        // task row view
                        TaskRowView(task: task)
                    }

                    Divider().padding(.leading, 20)
                }
                .animation(.default)
    
            }
        }
    }
}
