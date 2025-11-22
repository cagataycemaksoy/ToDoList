//
//  ToDoList.swift
//  ToDoList
//
//  Created by Cem Aksoy on 18.11.2025.
//

import SwiftUI
import SwiftData

struct ToDoList: View {
  @Query var tasks: [Task]
  @Environment(\.modelContext) var modelContext
  
  @State private var sheetPresented = false
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(tasks) { task in
            HStack {
              Image(systemName: task.taskCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                  task.taskCompleted.toggle()
                }
              NavigationLink {
               TaskDetailView(taskItem: task)
              } label: {
                VStack(alignment: .leading) {
                  Text(task.title)
                    .font(.headline)
                  HStack {
                    Image(systemName: "calendar")
                    Text(task.remindingDate.formatted(date: .numeric, time: .shortened))
                  }
                  .font(.subheadline)
                }
              }
            }
            .swipeActions {
              Button("Delete", role: .destructive) {
                modelContext.delete(task)
              }
            }
          }
        }
        .navigationTitle("To-Dos")
        .navigationBarTitleDisplayMode(.automatic)
        .listStyle(.plain)
        .sheet(isPresented: $sheetPresented) {
          NavigationStack {
           TaskDetailView(taskItem: Task())
          }
        }
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              sheetPresented.toggle()
            } label: {
              Image(systemName: "plus")
            }

          }
        }
      }
    }
}

#Preview {
    ToDoList()
    .modelContainer(Task.preview)
}
