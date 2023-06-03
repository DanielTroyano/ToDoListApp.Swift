//
//  RegisterView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import SwiftUI



struct RegisterView: View {
    
   @StateObject var viewModel = RegisterView_ViewModel()
    
    var body: some View {
        
        ZStack {
            
            //Header and background view
            VStack {
            
            ZStack {
                //Background
                Image("BlueArchBG")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: 10)
                    .offset(x: -10)
                  
                                
                VStack {
                    
                    //Header
                    Text("Register")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .bold()
                       
                    //SubHeader
                    Text("Get organized today!")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                    
                } .offset(y: 5)
                

               // .padding(.top, 60)
                
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 300)
            
            Spacer()
        }
            
    
            Form {
                
                //Print error message if needed
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                   
                }
                
                //Enter name prompt
                TextField("Your Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                //Enter email prompt
                TextField("Your Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                //Enter password prompt
                SecureField("Create Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                //Register Button
                TLButton(title: "Create Account", background: Color(red: 0.489, green: 0.22, blue: 0.575)) {
                    viewModel.register()
                }
                
                
            }
           .offset(y:60)

            
            .padding(.vertical,280)
            .padding(.horizontal, 430)
            
            
        }
        //fuck you shit
        .offset(y: -40)
        
    }
    
    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
}
