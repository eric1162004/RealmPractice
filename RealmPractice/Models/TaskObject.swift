//
//  TaskObject.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import RealmSwift

class TaskObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var completed: Bool = false
    @Persisted var completedAt: Date = Date()
    @Persisted var dueDate: Date? = nil
}
