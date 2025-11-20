//
//  Task.swift
//  ToDoList
//
//  Created by Cem Aksoy on 19.11.2025.
//

import Foundation
import SwiftData

@Model
class Task {
  var title: String
  var taskDescription: String
  var taskCompleted: Bool
  var remindTask: Bool
  var remindingDate: Date
  
  init(todoTitle: String = "", taskDescription: String = "", taskCompleted: Bool = false, remindTask: Bool = false, remindingDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: .now) ?? .now) {
    
    self.title = todoTitle
    self.taskDescription = taskDescription
    self.taskCompleted = taskCompleted
    self.remindTask = remindTask
    self.remindingDate = remindingDate
  }
}
