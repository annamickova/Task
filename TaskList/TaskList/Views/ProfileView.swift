//
//  ProfileView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var profile = Profile()
     
    var body: some View {
        NavigationView {
            VStack{
                if let user = profile.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.purple)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name:")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        HStack{
                            Text("Email:")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        HStack{
                            Text("Member since:")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    
                    Button("Sign out"){
                        profile.logOut()
                    }
                    .foregroundColor(Color(.red))
                    .bold()
                    .padding()
                    Spacer()
                    
                }else{
                    Text("loading...")
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Image(systemName: "heart")) {
                    Image(systemName: "list.bullet.clipboard")
                            .bold()
                            .tint(.purple)
                    }
                }
            }
        }
        .onAppear(perform: {
            profile.fetchUser()
        })
    }
}

#Preview {
    ProfileView()
}
