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
            NavigationLink {
             TaskDetailView(taskItem: task)
            } label: {
              Text(task.title)
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
}
