//
//  Recipe.swift
//  myBar
//
//  Created by Sean Chang on 1/5/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class Recipe {
    
    private let nameKey = "name"
    private let ingredientsKey = "ingredients"
    private let volumeKey = "volume"
    private let instructionsKey = "instructions"
    
    var name: String = ""
    var ingredients: [[String:String]] = []
    var instructions: String = ""
    
//    init(name: String, ingredients: [(String, String)], instructions: String) {
//        self.name = name
//        self.ingredients = ingredients
//        self.instructions = instructions
//    }
    
    init?(dic: [String:AnyObject]){
        guard let name = dic[nameKey] as? String,
                let instructions = dic[instructionsKey] as? String,
            let ingredients = dic[ingredientsKey] as? [[String:String]] else {
                self.instructions = ""
                self.name = ""
                self.ingredients = [["":""]]
                return nil
        }
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
        
    }
    
//    init?(dic: [String : AnyObject]) {
//        guard let name = dic["name"] as? String,
//            let instructions = dic["instructions"] as? String else {
//                self.instructions = ""
//                self.name = ""
//                self.ingredients = [("", "")]
//                return nil
//        }
//        
//        self.name = name
//        self.instructions = instructions
//        
//        var ingredientArray: [(String,String)] = []
//        
//        for i in 1...15 {
//            guard let ingredientName = dic["ingredient\(i)"] as? String,
//                let measurement = dic["measurement\(i)"] as? String else {return}
//            
//            if ingredientName.characters.count > 1 {
//                ingredientArray.append((ingredientName, measurement))
//            }
//        }
//        
//        self.ingredients = ingredientArray
//    }
    
//    var dictionaryValue: [String: AnyObject] {
//        
//        return [nameKey: self.name, instructionsKey: self.instructions , ingredientsKey: self.ingredients.map({[nameKey: $0.0, volumeKey: $0.1]})]
//    }
}