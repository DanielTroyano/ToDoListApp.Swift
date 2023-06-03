//
//  ListItem.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import Foundation

struct ListItem: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let dueDate: TimeInterval
    let priority: String
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
