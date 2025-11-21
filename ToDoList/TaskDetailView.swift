//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Cem Aksoy on 18.11.2025.
//

import SwiftUI
import SwiftData

struct TaskDetailView: View {
  @State var taskItem: Task
  
  @State private var taskTitle = ""
  @State private var taskDescripriton = ""
  @State private var taskCompleted = false
  @State private var remindTask = false
  @State private var remindingDate = Calendar.current.date(byAdding: .day, value: 1, to: .now) ?? .now
  
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) var modelContext
  
    var body: some View {
      Form {
        Section {
          TextField("Enter task ...", text: $taskTitle)
            .font(.headline) //TODO: Font design
            .textFieldStyle(.roundedBorder)
          
          TextField("Enter description ...", text: $taskDescripriton, axis: .vertical)
            .font(.subheadline)
            .textFieldStyle(.roundedBorder)
            .listRowSeparator(.hidden)
          
          Toggle("Task Completed", isOn: $taskCompleted)
        }
        
        Section {
          Toggle("Set Reminder", isOn: $remindTask)
            .listRowSeparator(.hidden)
          
          DatePicker("Select Deadline", selection: $remindingDate)
            .disabled(!remindTask)
        }
      }
      .navigationTitle("Task Details")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
      .onAppear {
        taskTitle = taskItem.title
        taskDescripriton = taskItem.taskDescription
        taskCompleted = taskItem.taskCompleted
        remindTask = taskItem.remindTask
        remindingDate = taskItem.remindingDate
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button("Save") {
            taskItem.title = taskTitle
            taskItem.taskDescription = taskDescripriton
            taskItem.taskCompleted = taskCompleted
            taskItem.remindTask = remindTask
            taskItem.remindingDate = remindingDate
            modelContext.insert(taskItem)
            guard let _ = try? modelContext.save() else {
              print("Failed to save the data!")
              return
            }
            dismiss()
          }
        }
      }
    }
}

#Preview {
    NavigationStack {
      TaskDetailView(taskItem: Task())
    }
}
