//
//  Task.swift
//  ToDoList
//
//  Created by Cem Aksoy on 19.11.2025.
//

import Foundation

class Task {
  var todoTitle: String
  private var taskDescription: String
  private var taskCompleted: Bool
  private var remindTask: Bool
  private var remindingDate: Date
  
  init(todoTitle: String, taskDescription: String, taskCompleted: Bool, remindTask:Bool, remindingDate: Date) {
    self.todoTitle = todoTitle
    self.taskDescription = taskDescription
    self.taskCompleted = taskCompleted
    self.remindTask = remindTask
    self.remindingDate = remindingDate
  }
}
