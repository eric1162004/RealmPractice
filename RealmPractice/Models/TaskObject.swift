//
//  TaskObject.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import RealmSwift

class ProductObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var price: Float = 0
    @Persisted var completedAt: Date = Date()
}

class TaskObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var completed: Bool = false
    @Persisted var completedAt: Date = Date()
    @Persisted var dueDate: Date? = nil
}
