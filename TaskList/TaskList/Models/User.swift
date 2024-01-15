//
//  User.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import Foundation

struct User: Codable{
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
