//
//  Main.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseAuth
import Foundation

class Main: ObservableObject{
    
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    /// sets up user's authentication
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid  ?? ""
            }
        }
    }
    
    /// returns true if user is currently signed in firebase authentication
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
