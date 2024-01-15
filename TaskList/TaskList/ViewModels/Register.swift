//
//  Register.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation


class Register: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
   
    init(){}
    
    /// creating user 
    func register(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userID = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userID)
        }
    }
    
    
    /// stores register data about user into database
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    /// checking registration info
    /// - Returns: boolean
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "fill in all fields"
            return false
        }
        let pattern = #"^([a-zA-Z]|[0-9]|[_]|[\.]){3,}[@]([a-zA-Z]|[0-9]){3,}[.]([a-zA-Z]){2,4}$"#
        guard NSPredicate(format: "self matches %@", pattern).evaluate(with: email) else{
            errorMessage = "enter valid email"
            return false
        }
        guard password.count  >= 6 else{
            errorMessage = "enter longer passsword"
            return false
        }
        return true
        
    }
}
