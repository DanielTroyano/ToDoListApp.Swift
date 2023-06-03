//
//  ToDoListView_ViewModel.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseFirestore
import Foundation


//ViewModel for list of items (Primary Tab)
class ToDoListView_ViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: Item id to delete
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
        .collection("todos")
            .document(id)
        .delete()
    }
}
