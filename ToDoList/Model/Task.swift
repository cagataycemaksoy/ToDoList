//
//  Task.swift
//  ToDoList
//
//  Created by Cem Aksoy on 19.11.2025.
//

import Foundation
import SwiftData

@MainActor
@Model
class Task {
  var title: String
  var taskDescription: String
  var taskCompleted: Bool
  var remindTask: Bool
  var remindingDate: Date
  
  init(todoTitle: String = "", taskDescription: String = "", taskCompleted: Bool = false, remindTask: Bool = false, remindingDate: Date =
       Calendar.current.date(byAdding: .day, value: 1, to: .now) ?? .now) {
    
    self.title = todoTitle
    self.taskDescription = taskDescription
    self.taskCompleted = taskCompleted
    self.remindTask = remindTask
    self.remindingDate = remindingDate
  }
}

extension Task {
  static var preview: ModelContainer {
    let container = try! ModelContainer(for: Task.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Task(todoTitle: "Learn SwiftUI", taskDescription: "Exercise SwfitUI by building projects.", taskCompleted: true, remindTask: true, remindingDate: Date.now ))
    container.mainContext.insert(Task(todoTitle: "Cook Dinner", taskDescription: "Invite friends and cook dinner.", taskCompleted: false, remindTask: true, remindingDate: Date.now + 24*60*60))
    container.mainContext.insert(Task(todoTitle: "Go To Gym", taskDescription: "Weekly workout", taskCompleted: false, remindTask: true, remindingDate: Date.now + 24*60*60*2))
    return container
  }
}
