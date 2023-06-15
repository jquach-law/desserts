//
//  StructToDict.swift
//  Desserts
//
//  Created by user241379 on 6/14/23.
//

import Foundation

extension Dessert {
    
    // Converted dictionary to use for listing
    // strIngredient from 1-20 and strMeasure from 1-20
    func toDictionary() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary: [String: Any] = [:]
        
        for child in mirror.children {
            if let label = child.label {
                dictionary[label] = child.value
            }
        }
        
        return dictionary
    }
}
