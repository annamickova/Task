//
//  LoginView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import SwiftUI


/// first view to display
struct LoginView: View {
    
    @StateObject var login = Login()
    
    var body: some View {
        NavigationView{
            VStack{
                // header
                HeaderView(title: "Task List", angle: 0, text: "lets organise", image: "backGround", yset: 120)
                    .offset(y: 70)
                
                // login form
                Form{
                    if !login.errorMessage.isEmpty{
                        Text(login.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("email address", text: $login.email )
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("password", text: $login.password )
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log in",
                        backgroundColor: .blue
                    ) {
                        login.login()
                    }
                    .padding(.all)
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: 515)
                .offset(y: -30)
                
                // create account
                VStack{
                    Text("Are you new here?")
                    NavigationLink("Create an account", destination: RegisterView())
                        .padding(.bottom, 20)
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: 10)
                .offset(y: -70)
            }
            
        }
    }
}

#Preview {
    LoginView()
}
