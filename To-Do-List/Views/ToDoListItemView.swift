//
//  ToDoListItemView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemView_ViewModel()
    let item: ListItem
    
    
    var body: some View {
        
        HStack {
            
            ZStack {
                //Priority border
                if item.priority == "low" {
                    RoundedRectangle(cornerRadius: 15)
                    .frame(width: 80, height: 30)
                    .foregroundColor(.blue) }
                if item.priority == "medium" {
                    RoundedRectangle(cornerRadius: 15)
                    .frame(width: 80, height: 30)
                    .foregroundColor(.purple) }
                if item.priority == "high" {
                    RoundedRectangle(cornerRadius: 15)
                    .frame(width: 80, height: 30)
                    .foregroundColor(.red) }
                    
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 75, height: 24) //70 20
                    .foregroundColor(.white)
                
                //Priority text
                if item.priority == "low" {
                    Text(item.priority)
                        .fontWeight(.light)
                    .foregroundColor(.blue) }
                if item.priority == "medium" {
                    Text("med.")
                        .fontWeight(.light)
                    .foregroundColor(.purple) }
                if item.priority == "high" {
                    Text(item.priority)
                        .fontWeight(.light)
                    .foregroundColor(.red) }
                
            }
            
            
            
            HStack {
                
                VStack(alignment: .leading){
                    //Title
                    Text(item.title)
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    
                    //Description (optional)
                    if (item.description != "") {Text(item.description)
                            .italic()
                            .font(.body)
                        .padding(.bottom, 1) }
                    
                    //Due date
                    Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                }
                .padding(.leading)
                
                Spacer()
                
                
                
                
                Button {
                    
                    viewModel.toggleCompletion(item: item)
                    
                } label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(.blue)
                    
                }
            }
            
        }
        
    }
    
}










struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "Enjoy The Moment", description: "Bruhhhh", dueDate: Date().timeIntervalSince1970, priority: "high", createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}
