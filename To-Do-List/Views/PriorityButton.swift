//
//  PriorityButton.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/30/23.
//

import SwiftUI

struct PriorityButton: View {
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    
    var body: some View {
        
        ZStack {
            Capsule()
                .frame(height: 50)
                .foregroundColor(isSelected ? color: .gray)
            Text(text)
                .foregroundColor(.white)
        }
        
    }
}

struct PriorityButton_Previews: PreviewProvider {
    static var previews: some View {
        PriorityButton(isSelected: .constant(false), color: .blue, text: "button")
    }
}
