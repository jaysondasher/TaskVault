//
//  ToDoListView.swift
//  TaskVault
//
//  Created by Jayson Dasher on 6/11/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                // Delete
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(Color.red)

                        }
                        .padding(2)
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .font(.title)
                .fontWeight(.bold)

            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "er4CIBmnIlVHqHQglcsy5KPjIX13")
    }
}
