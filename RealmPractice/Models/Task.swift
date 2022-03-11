//
//  Task.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation

struct Task: Identifiable {
    var id: String
    var title: String
    var completed: Bool = false
    var completedAt: Date = Date()
    var dueDate: Date? = nil
    
    // allow mapping to taskObject
    init(taskObject: TaskObject) {
        self.id = taskObject.id.stringValue
        self.title = taskObject.title
        self.completed = taskObject.completed
        self.completedAt = taskObject.completedAt
        self.dueDate = taskObject.dueDate
    }
    
    var formattedDate: String {
        if let date = dueDate {
            let format = "MMM d, y"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return "Due at " + dateFormatter.string(from: date)
        }
        return ""
    }
}
