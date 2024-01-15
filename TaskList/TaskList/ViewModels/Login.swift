//
//  Login.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseAuth
import Foundation

class Login: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    /// sign in with firebase
     func login(){
        guard validate() else{
            return
        }
        /// try login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    /// checking email and password input
    /// - Returns: boolean
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "fill in all fields"
            return false
        }
        
        let pattern = #"^([a-zA-Z]|[0-9]|[_]|[\.]){3,}[@]([a-zA-Z]|[0-9]){3,}[.]([a-zA-Z]){2,4}$"#
        guard NSPredicate(format: "self matches %@", pattern).evaluate(with: email) else{
            errorMessage = "enter valid email"
            return false
        }
        return true
    }
}
