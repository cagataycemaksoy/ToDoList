//
//  ListView.swift
//  ToDoList
//
//  Created by Cem Aksoy on 23.11.2025.
//

import SwiftUI
import SwiftData

struct ListView: View {
  @Query var tasks: [Task]
  @Environment(\.modelContext) var modelContext
  
  var body: some View {
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
  }
  
  init(sortOption: SortOption) {
    switch sortOption {
    case .alphabetical:
      _tasks = Query(sort: \.title)
    case .chronological:
      _tasks = Query(sort: \.remindingDate)
    case .notCompleted:
      _tasks = Query(filter: #Predicate {$0.taskCompleted == false} )
    }
  }
}

#Preview {
  NavigationStack {
    ListView(sortOption: .alphabetical)
  }
  .modelContainer(Task.preview)
}
