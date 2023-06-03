 //
//  Extensions.swift
//  To-Do-List
//
//  Created by Daniel Troyano on 5/27/23.
//

import Foundation


extension Encodable {
    
    func asDictionary() -> [String: Any] {
        
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
             
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
            
        } catch {
            return [:]
        }
    }
    
}
