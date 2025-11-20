//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Cem Aksoy on 18.11.2025.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoList()
        }
        .modelContainer(for: Task.self)
    }
}
