//
//  NewItemView_ViewModel.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewItemView_ViewModel: ObservableObject {
    @Published var title =  ""
    @Published var description = ""
    @Published var dueDate = Date()
    @Published var priority: String = ""
    @Published var showAlert = false
    
    var errorMessage = ""
    

    
    
    init() {}
    
    
    
    func setPriority(to priorityLevel: String) {
        if (priorityLevel == "low") {
            priority = "low"
        }
        if (priorityLevel == "medium") {
            priority = "medium"
        }
        if (priorityLevel == "high") {
            priority = "high"
         }
    }
    
    
    //Save new to-do-list item to database
    func save() {
        guard (canSave)
        else {
            return
        }
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid
            else {
                return
            }
        
        //Create model of new item
        let newId = UUID().uuidString
        let newItem = ListItem(id: newId, title: title, description: description, dueDate: dueDate.timeIntervalSince1970, priority: priority, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        
        //Save model to database (As subcollection of current user)
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(uId)
        .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
            
    }
    
    
    
    //computed property that checks if new item is valid
    var canSave: Bool {
        
        guard (!title.trimmingCharacters(in: .whitespaces).isEmpty)
        else {
            errorMessage = "Please enter a valid title."
            return false }
        
        guard (dueDate >= Date().addingTimeInterval(-86400)) //allows dates from today onwards
        else {
            errorMessage = "Please ever a future date."
            return false
        }
        
        guard (!priority.isEmpty)
        else {
            errorMessage = "Please select a priority level."
            return false
        }
        
        return true
    }
    
    
}

