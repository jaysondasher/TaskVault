//
//  TaskVaultApp.swift
//  TaskVault
//
//  Created by Jayson Dasher on 6/11/23.
//
//  test user: test123@test.com
//  test pass: test123

import FirebaseCore
import SwiftUI

@main
struct TaskVaultApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
