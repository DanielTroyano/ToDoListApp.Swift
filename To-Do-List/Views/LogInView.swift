//
//  LogInView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import SwiftUI

struct LogInView: View {
   
    //email and pass vars from LoginView_ViewModel
    @StateObject var viewModel = LoginView_ViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                //Call header and background
                HeaderAndBackgroundView(image: "SolidBG", title: "To Do List", subtitle: "Go Hard Reguardless")
                
            
                
                //Login form
                Form {
                    
                    //Attempt to call login error message (if error var is not empty)
                     if !viewModel.errorMessage.isEmpty {
                         Text(viewModel.errorMessage)
                             .foregroundColor(.red)
                        
                     }
                    
                    //Enter email address prompt
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    //Enter password prompt
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                       
                    
                    //Login Button
                    TLButton(title: "Log In", background: Color(red: 0.997, green: 0.205, blue: 0.338)) {
                        viewModel.login()
                    }
                    
                    
                }
                .offset(y: -120)
                .padding(.vertical, 82)
                
                
                
    
                
                //Create Account prompt
                VStack {
                    Text("New around here?")
                        .foregroundColor(.white)
                      
                    //Link to resistration view
                    NavigationLink("Create An Account", destination: RegisterView())
                        .bold()
                        .foregroundColor(.white)
                        
                    
                } .padding(.top, 20)
                    
                
                Spacer()
                
            }
        }
        
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
    
