//
//  ContentView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 30.11.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = Main()
    
    /// if user is signed - displays task list, else user has to log in
    var body: some View {
       if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
           accountView
        }else{
            LoginView()
       }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            TaskListView(userID: viewModel.currentUserID)
                .tabItem {
    
                    Label("List", systemImage: "list.bullet.circle.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}

