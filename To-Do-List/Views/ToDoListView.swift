//
//  ToDoListView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListView_ViewModel
    @FirestoreQuery var items: [ListItem] //Continuously checks for new items
    

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/todos")
        
        //Assign the view model and pass the userId as a wrapped value
        self._viewModel = StateObject(wrappedValue: ToDoListView_ViewModel(userId: userId))
    }
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(spacing: 2.0) {
                
                List(items) { item in
                    ToDoListItemView(item: item)
                        .padding(.vertical, 7)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.deleteItem(id: item.id)
                            }
                            .tint(.red)
                                
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do List")
            
            
            
            .toolbar {
                Button { //Slide up new item creation view
                    
                   viewModel.showingNewItemView = true

                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView( newItemPresented: $viewModel.showingNewItemView)
            }
            
        }
        
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "q7cb4pqyryRYHInF5O3jaBASoRS2")
    }
}
