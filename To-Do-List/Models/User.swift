//
//  User.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

//Create an object of a user here

import Foundation

struct User: Codable { //Conformed to protocol in order to use extension dictionary
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}

