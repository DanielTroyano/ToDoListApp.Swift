//
//  ToDoListItemView_ViewModel.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


//ViewModel for a single item on the to-do-list (Each row in items list)
class ToDoListItemView_ViewModel: ObservableObject {
    
  
    init() {}
    
    //Rather than edit actual item's completion in storage, creates a copy, modifies, then saves over actual item
    func toggleCompletion(item: ListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
            db.collection("Users")
                .document(uid)
            .collection("todos")
                .document(itemCopy.id)
                .setData(itemCopy.asDictionary())
    }
    
    
    
            
    
}

