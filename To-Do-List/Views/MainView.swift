//
//  ContentView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import SwiftUI

struct MainView: View {
    //Check whether the user is already signed in or not
    @StateObject var viewModel = MainView_ViewModel()
    
    
    var body: some View {
        //Shows correct first view based on viewModel
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //Signed in path
            accountView
            
        }
        else { 
            //Not signed in path
            LogInView()
        }
        
    }
    
    
    //Abstracted account view if user is signed in
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
