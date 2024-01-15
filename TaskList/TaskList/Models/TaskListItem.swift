//
//  TaskListItem.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import Foundation

struct TaskListItem: Codable, Identifiable{
    let id: String
    var title: String
    var dueDate: TimeInterval
    let createdDate: TimeInterval
    var note: String
    var isDone: Bool
  
    
    /// updates isDone
    /// - Parameter state: new state of isDone
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
