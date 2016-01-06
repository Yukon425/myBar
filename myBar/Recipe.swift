//
//  Recipe.swift
//  myBar
//
//  Created by Sean Chang on 1/5/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class Recipe {
    var name: String
    var ingredients = [String : String]()
    var instructions: String
    
//    init(name: String, ingredients: [Ingredient], directions: String) {
//        self.name = name
//        self.ingredients = ingredients
//        self.directions = directions
//    }
    
    init?(dic: [String : AnyObject]) {
        guard let name = dic["name"] as? String,
            let instructions = dic["instructions"] as? String else {
                self.instructions = ""
                self.name = ""
                self.ingredients = ["":""]
                return nil
        }
        
        self.name = name
        self.instructions = instructions
        
        var ingredientDic = [String : String]()
        for i in 1...15 {
            guard let ingredientName = dic["ingredient\(i)"] as? String,
                let measurement = dic["measurement\(i)"] as? String else {return}
            
            if ingredientName.characters.count > 1 {
                ingredientDic[ingredientName] = measurement
            }
        }
        self.ingredients = ingredientDic
        
    }
}