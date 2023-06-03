//
//  ProfileView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileView_ViewModel()
   
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                        
                    profile(user: user)
                    
                } else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
            
            }
        .onAppear {
            viewModel.fetchUser()
            }
        
        }
    
    
    
    
    //Abstracted user info view
    @ViewBuilder
    func profile(user: User) -> some View {
                
        //Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125)
                    .foregroundColor(.blue)
                    .padding()
                
                    .offset(y:30)
                
                
                //User Info: NAme, email, member since
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("Name: ")
                            .bold()
                        Text(user.name)
                    }.padding()
                    
                    HStack{
                        Text("Email: ")
                            .bold()
                        Text(user.email)
                    }.padding()
                    
                    HStack{
                        Text("Member since: ")
                            .bold()
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }
                    .padding()
                    
                }.padding()
                    .offset(y:30)
                
                Spacer()
                //Sign out button
                Button("LogOut") {
                    viewModel.logOut()
                }
                .tint(.red)
                .padding()
        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
