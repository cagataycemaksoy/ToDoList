//
//  ToDoList.swift
//  ToDoList
//
//  Created by Cem Aksoy on 18.11.2025.
//

import SwiftUI
import SwiftData

struct ToDoList: View {
  @State private var sheetPresented = false
  @State private var selectedSort: SortOption = .alphabetical
  
    var body: some View {
      NavigationStack {
       ListView(sortOption: selectedSort)
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
          ToolbarItem(placement: .bottomBar) {
            Picker("", selection: $selectedSort) {
              ForEach(SortOption.allCases, id: \.self) {
                Text($0.rawValue)
              }
            }
            .pickerStyle(.palette)
          }
        }
      }
    }
}

#Preview {
    ToDoList()
    .modelContainer(Task.preview)
}
