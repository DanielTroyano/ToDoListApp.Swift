//
//  LoginView_ViewModel.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseAuth //Impliment uer login
import Foundation

class LoginView_ViewModel: ObservableObject {
    
    // Abstracted data fields
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    //Login function
    func login() {
        
        //Call validate func to check for errors
        guard validate()    else {
            //If validate returns false
            return
        }
            //If validate returns true attempt sign in (IMPORTANT)
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    
    
    //Func called by login func to check for errors
    private func validate() -> Bool {
        
        //remove prior error messages
        errorMessage = ""
        
        //ensure email and password are not either empty or only spaces
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        
            else {
                errorMessage = "Please fill in all fields."
                return false
        }
        
        //ensure the email contains both "@" and "."
        guard email.contains("@") && email.contains(".")
                
            else {
                errorMessage = "Please enter a valid email."
                return false
            }
        //If both error tests are successfully guarded:
        return true
    }
    
}
