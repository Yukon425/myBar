//
//  Ingredient.swift
//  myBar
//
//  Created by Sean Chang on 1/5/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class Ingredient {
    var alcoholic: Bool
    var name: String
    
    var amountInt: String?
    var amountUnit: String?
    
    init(alcoholic: Bool, name: String){
        self.alcoholic = alcoholic
        self.name = name
    }
    
    init(dictionary: [String:AnyObject]){
        if let dicName = dictionary["name"] as? String{
            self.name = dicName
        } else {
            self.name = ""
        }
        if let dicAlcoholic = dictionary["alcoholic"] as? Bool{
            self.alcoholic = dicAlcoholic
        } else {
            self.alcoholic = false
        }
    }
}