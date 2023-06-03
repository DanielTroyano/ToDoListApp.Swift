//
//  RegisterView_ViewModel.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterView_ViewModel: ObservableObject {
    
    //Abstracted data fields
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    
    
    //Create a new user record in firebase (WTF WTF WTF)
    func register() {
        guard validate() else {
            return //if validate() returned false
            
        }
        
        //if validate returned true create a new user
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    
    
    private func validate() -> Bool {
        //ensure
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "One or more fields are empty."
            return false
        }
        guard email.contains("@") && email.contains(".")
                
            else {
                errorMessage = "Please enter a valid email."
                return false
            }
        
        guard password.count >= 6 else {
                errorMessage = "Please enter a password of at least 6 characters."
            return false
        }
        
        //Success and register() will attempt login
        return true
    }
    
    //Insert record of user into the database
    private func insertUserRecord(id: String) {
        
        //Call the user model to create a new user object
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        //Insert into database
        let dataBase = Firestore.firestore()
        
        dataBase.collection("Users")
            .document(id)
            .setData(newUser.asDictionary()) //Store user info in dictionary (func in extension)
    }
    
    
    
    
}
