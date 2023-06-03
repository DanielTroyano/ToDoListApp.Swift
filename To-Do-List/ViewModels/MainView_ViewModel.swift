//
//  MainView_ViewModel.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseAuth
import Foundation

//Basically checks whether a user is signed in and shows the login view if needed
class MainView_ViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""  //@Published wrapper constantly monitors for changes
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        //Updates main view based on whether or not user is signed in or not
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        
        return Auth.auth().currentUser != nil //True if we do have a user currently signed in
    }
    
}
