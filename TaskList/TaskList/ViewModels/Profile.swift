//
//  Profile.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class Profile: ObservableObject{
    init(){}
    
    @Published var user: User? = nil
    
    /// fetches the current user's data from Firestore and updates the user property of the view model with the data
    func fetchUser(){
        guard let userID = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument{[weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    /// sign out from firebase
    func logOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
