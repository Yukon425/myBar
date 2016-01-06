//
//  IngredientController.swift
//  myBar
//
//  Created by Daniel Lee on 1/6/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class IngredientController {
    
    private let ingredientsKey = "ingredients"
    
    var ingredients: [Ingredient]
    
    
    init() {
        self.ingredients = []
        self.loadFromPersistentStorage()
    }
    
    func addIngredient(ingredient: Ingredient) {
        ingredients.append(ingredient)
        self.saveToPersistentStorage()
    }
    
    func removeIngredient(ingredient: Ingredient) {
        if let ingredientIndex = ingredients.indexOf(ingredient) {
            ingredients.removeAtIndex(ingredientIndex)
        }
        
        self.saveToPersistentStorage()
        
    }
    
    func loadFromPersistentStorage() {
        let ingredientDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(ingredientsKey) as? [Dictionary<String, AnyObject>]
        
        if let ingredientDictionaries = ingredientDictionariesFromDefaults {
            
            self.ingredients = ingredientDictionaries.map({Ingredient(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        let ingredientDictionaries = self.ingredients.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setObject(ingredientDictionaries, forKey: ingredientsKey)
    }
    
    
}
