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
    
    var alcoholic: Bool
    var name: String
    
    init?(dictionary: [String:AnyObject]) {
        
        guard let name = dictionary["name"] as? String,
            let alcoholicString = dictionary["alcoholic"] as? String else {
                self.alcoholic = false
                self.name = ""
                return nil
        }
        
        if alcoholicString == "alcoholic" {
            self.alcoholic = true
        } else {
            self.alcoholic = false
        }
        
        self.name = name
        
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        
        let dictionary = [
            alcoholicKey : self.alcoholic,
            nameKey : self.name
        ]
        
        return dictionary as! [String : AnyObject]
    }
}

func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}