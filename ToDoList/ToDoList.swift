//
//  ToDoList.swift
//  ToDoList
//
//  Created by Cem Aksoy on 18.11.2025.
//

import SwiftUI

struct ToDoList: View {
  @State private var sheetPresented = false
  private let tasks = ["Do Landry", "Cook dinner", "Go to gym", "Call your friends"]
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(tasks, id: \.self) { task in
            NavigationLink {
             // TaskDetailView(todoTitle: task)
            } label: {
              Text(task)
            }

          }
        }
        .navigationTitle("To-Dos")
        .navigationBarTitleDisplayMode(.automatic)
        .listStyle(.plain)
        .sheet(isPresented: $sheetPresented) {
          NavigationStack {
           // TaskDetailView(todoTitle: "")
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
