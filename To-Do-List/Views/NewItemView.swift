//
//  NewItemView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemView_ViewModel()
    @Binding var newItemPresented: Bool
    
    //Button stuff
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false

    
    var body: some View {
        
        VStack{
            
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 25)
                .offset(y: 10)
            
            Form {
                
                //Title
                TextField("Title:", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Description
                TextField("Description:", text: $viewModel.description)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .italic()
                
                //Due Date
                DatePicker("Due Date:", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Priority Level Capsules
                HStack {
                    Text("Priority:")
                    
                    //Low priority button
                    PriorityButton(isSelected: $isSelected, color: .blue, text: "Low")
                        .onTapGesture {
                            isSelected = true
                            if isSelected {
                                isSelected2 = false
                                isSelected3 = false
                            }
                            viewModel.setPriority(to: "low")
                        }
                    
                    //Medium priority button
                    PriorityButton(isSelected: $isSelected2, color: .blue, text: "Medium")
                        .onTapGesture {
                            isSelected2 = true
                            if isSelected2 {
                                isSelected = false
                                isSelected3 = false
                            }
                            viewModel.setPriority(to: "medium")
                        }
                    //High priority button
                    PriorityButton(isSelected: $isSelected3, color: .blue, text: "High")
                        .onTapGesture {
                            isSelected3 = true
                            if isSelected3 {
                                isSelected = false
                                isSelected2 = false
                            }
                            viewModel.setPriority(to: "high")
                        }
                }
                .padding()
                
                
                //Create Button
                
                TLButton(title: "Create", background: .blue) {
                    if viewModel.canSave {
                        viewModel.save() //Save new item to database
                    newItemPresented = false //Close paper menu
                    }
                    else {
                        viewModel.showAlert = true
                    }
                        
                }.padding()
                
            }
    
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            }
            
        }
        
        
    }
}





struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in}))
    }
}
