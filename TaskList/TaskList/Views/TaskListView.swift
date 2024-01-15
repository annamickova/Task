//
//  TaskListItemsView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseFirestoreSwift
import SwiftUI


struct TaskListView: View {
    
    @StateObject var taskList: TaskList
    @FirestoreQuery var items: [TaskListItem]
    
    
    /// initializes a new TaskListViewModel with a given user ID
    init(userID: String){
        self._items = FirestoreQuery(collectionPath: "Users/\(userID)/tasks to do"
        )
        self._taskList = StateObject(wrappedValue: TaskList(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items){ item in
                    ItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                taskList.delete(id: item.id)
                            }
                            .tint(.red)
                            Button("Edit"){
                                taskList.showingEditItemView = true
                                taskList.delete(id: item.id)
                            }
                            .tint(.purple)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Task List")
            .toolbar{
                Button {
                    taskList.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                        .tint(.purple)
                        .bold()
                }
            }
            .sheet(isPresented: $taskList.showingNewItemView) {
                NewItemView(newItemPresented: $taskList.showingNewItemView)
            }.sheet(isPresented: $taskList.showingEditItemView) {
                EditItemView(editItemPresented: $taskList.showingEditItemView)
            }
        }
    }
}

#Preview {
    TaskListView(userID: "tGoSRe6LvdU9SgbuMo3CNVxNd2G2")
}
