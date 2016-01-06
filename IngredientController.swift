//
//  IngredientController.swift
//  myBar
//
//  Created by Daniel Lee on 1/6/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class IngredientController {
    
    var ingredients: [Ingredient]
    
    
    init() {
        self.ingredients = []
    }
    
    func addIngredient(ingredient: Ingredient) {
        ingredients.append(ingredient)
    }
    
    func removeIngredient(ingredient: Ingredient) {
    }
    
    func loadToPersistentStorage() {
        
    }
    
    
}
