//
//  HeaderAndBackgroundView.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/25/23.
//

import SwiftUI

struct HeaderAndBackgroundView: View {
    
    //Generic inputs to reuse this view
    var image:String
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
        
        ZStack {
            //Background
            Image(image)
            
            VStack {
                
                //Header
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                   
                //SubHeader
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
            }
            

           // .padding(.top, 60)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        
        Spacer()
    }
    }
}

struct HeaderAndBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAndBackgroundView(image: "image", title: "title", subtitle: "subtitle")
    }
}
