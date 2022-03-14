//
//  TaskViewModel.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import Foundation
import Combine
import RealmSwift

final class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    // setup an observer
    private func setupObserver() {
        do {
            let realm = try Realm()
            let results = realm.objects(TaskObject.self)
            
            token = results.observe({ [weak self] changes in
                self?.tasks = results.map(Task.init)
                    .sorted(by: { $0.completedAt > $1.completedAt})
                    .sorted(by: { !$0.completed && $1.completed})
            })
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // add a task
    func addTask(title: String){
        let taskObject = TaskObject(value: [
            "title": title,
            "completed": false
        ])
        do {
            let realm = try Realm()
            try realm.write{
                realm.add(taskObject)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // update completion bool
    func markComplete(id: String, completed: Bool) {
        do {
            let realm = try Realm()
            let objectId = try  ObjectId(string: id)
            let task = realm.object(ofType: TaskObject.self, forPrimaryKey: objectId)
            try realm.write {
                task?.completed = completed
                task?.completedAt = Date()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // remove a task
    func remove(id: String){
        do{
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            if let task = realm.object(ofType: TaskObject.self, forPrimaryKey: objectId){
                try realm.write {
                    realm.delete(task)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // update a task title
    func updateTitle(id: String, newTitle: String){
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            let task = realm.object(ofType: TaskObject.self, forPrimaryKey: objectId)
            try realm.write {
                task?.title = newTitle
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // update a task
    func update(id: String, newTitle: String, dueDate: Date?) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            let task = realm.object(ofType: TaskObject.self, forPrimaryKey: objectId)
            try realm.write {
                task?.title = newTitle
                task?.dueDate = dueDate
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
