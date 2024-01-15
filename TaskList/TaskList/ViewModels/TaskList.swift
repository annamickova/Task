//
//  TaskList.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseFirestore
import Foundation

/// list of items
class TaskList: ObservableObject{
    
    @Published var showingNewItemView = false
    @Published var showingEditItemView = false
    
    private let userID: String
     
    init(userID: String){
        self.userID = userID
    }
    
    /// delete  item from task list
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("Users")
            .document(userID)
            .collection("tasks to do")
            .document(id)
            .delete()
    }
}
