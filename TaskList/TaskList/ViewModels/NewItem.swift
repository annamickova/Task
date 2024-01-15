//
//  NewItem.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItem: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var note = ""
    
    @Published var id = ""
    @Published var createdDate = 0.0
    @Published var isDone = false
    
    
    init(){}
    
    /// save information about new item into firestore
    func save(){
        guard canSave else{
            return
        }
        
        /// get current user id
        guard let uID = Auth.auth().currentUser?.uid else{
            return
        }
        /// create model
        let newID = UUID().uuidString
        let newItem = TaskListItem(id: newID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   note: note,
                                   isDone: false)
        ///save model
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uID)
            .collection("tasks to do")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    /// checking title and date
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
    
    
    func editData(id: String, item: TaskListItem) {
        guard let uID = Auth.auth().currentUser?.uid else{
            return
        }
        /// update model in firestore
            let db = Firestore.firestore()
            db.collection("Users")
                .document(uID)
                .collection("tasks to do")
                .document(self.id)
                .updateData(item.asDictionary())
       }
    
    
}
