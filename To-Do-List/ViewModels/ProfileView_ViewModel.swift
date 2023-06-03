//
//  ProfileView_ViewModel.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore

class ProfileView_ViewModel: ObservableObject {
    
    init() {}
    
    @Published var user: User? = nil
    
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("Users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
            
        }
    }
    
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
        
    }
    
}

