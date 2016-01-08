//
//  Ingredient.swift
//  myBar
//
//  Created by Sean Chang on 1/5/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class Ingredient: Equatable {
    
    private let alcoholicKey = "alcoholic"
    private let nameKey = "name"
    private let categoryKey = "category"
    
    var alcoholic: Bool
    var name: String
    var category: String
    
    init(alcoholic: Bool, name: String, category: String) {
        self.alcoholic = alcoholic
        self.name = name
        self.category = category
    }
    
    init?(dictionary: [String:AnyObject]) {
        
        guard let name = dictionary[nameKey] as? String,
                let category = dictionary[categoryKey] as? String,
        let alcoholic = dictionary[alcoholicKey] as? Bool else {
                self.alcoholic = false
                self.name = ""
                self.category = ""
                return nil
        }
        
//        if let alcoholic = dictionary["alcoholic"] as? Bool {
//            self.alcoholic = alcoholic
//        } else if let alcoholic = dictionary["alcoholic"] as? String {
//           
//            if alcoholic == "alcoholic" {
//                self.alcoholic = true
//            } else {
//                self.alcoholic = false
//            }
//        }
        self.name = name
        self.alcoholic = alcoholic
        self.category = category
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        
        let dictionary = [
            alcoholicKey : self.alcoholic,
            nameKey : self.name,
            categoryKey: self.category
        ]
        
        return dictionary as! [String : AnyObject]
    }
}

func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
    return lhs.name == rhs.name
}