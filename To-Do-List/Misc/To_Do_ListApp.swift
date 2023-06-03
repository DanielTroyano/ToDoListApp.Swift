//
//  To_Do_ListApp.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/24/23.
//

import FirebaseCore
import SwiftUI

@main
struct To_Do_ListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
