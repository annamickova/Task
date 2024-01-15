//
//  Item.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

 /// sigle item view
class Item: ObservableObject{
    init(){}
    
    /// updates in firestore when item is done
    /// - Parameter item: TaskListItem to be updated
    func toggleIsDone(item: TaskListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uid)
            .collection("tasks to do")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary() )
    }
}
