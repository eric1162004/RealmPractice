//
//  RealmPracticeApp.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//

import SwiftUI


@main
struct RealmPracticeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TaskViewModel())
        }
    }
}
