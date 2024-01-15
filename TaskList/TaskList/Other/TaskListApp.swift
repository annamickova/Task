//
//  TaskListApp.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 30.11.2023.
//

import FirebaseCore
import SwiftUI

@main
struct TaskListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

