//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Cem Aksoy on 18.11.2025.
//

import SwiftUI

struct TaskDetailView: View {
  @State var todoTitle: String
  @State private var taskDescripriton = ""
  @State private var taskCompleted = false
  @State private var remindTask = false
  @State private var remindingDate = Calendar.current.date(byAdding: .day, value: 1, to: .now) ?? .now
  
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      Form {
        Section {
          TextField("Enter task ...", text: $todoTitle)
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
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button("Save") {
            //TODO: Save task
          }
        }
      }
    }
}

#Preview {
    NavigationStack {
      TaskDetailView(todoTitle: "")
    }
}
