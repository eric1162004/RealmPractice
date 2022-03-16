//
//  AppDelegate.swift
//  RealmPractice
//
//  Created by eric on 2022-03-11.
//
//  Must update schemaVersion every when changing the schema of a model

import Foundation
import UIKit
import RealmSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        configMigration()
        return true
    }

    private func configMigration() {
        // perform migration if necessary
        let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in
                // additional process such as rename, combine fields and link to other object
            })
        Realm.Configuration.defaultConfiguration = config
    }
}
