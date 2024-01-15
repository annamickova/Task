//
//  RegisterView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerClass = Register()
    
    var body: some View {
        VStack{
            // header
            HeaderView(title: "Register", angle: 0, text: "create an account", image: "sand", yset: 10)
                .offset(y: 30)
            Form{
                if !registerClass.errorMessage.isEmpty{
                    Text(registerClass.errorMessage)
                        .foregroundColor(.red)
                }
                TextField("full name", text: $registerClass.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("email address", text: $registerClass.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("password", text: $registerClass.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create account",
                    backgroundColor: .blue
                ) {
                    registerClass.register()
                }
                .padding()
                
            }
           
            .frame(width: UIScreen.main.bounds.width, height: 470)
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
