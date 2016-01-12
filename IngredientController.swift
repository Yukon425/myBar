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
    
    static let sharedController = IngredientController()
    
    var myPantry: [Ingredient] = [] {
        didSet{
            RecipeController.sharedInstance.populatePossibleRecipes()
        }
    }
    
    
//    init() {
//        self.myPantry = []
//        self.loadFromPersistentStorage()
//    }
    
    func addIngredient(ingredient: Ingredient) {
        if !(myPantry.contains(ingredient)){
            myPantry.append(ingredient)
            self.saveToPersistentStorage()
        }
        
    }
    
    func addPrepopulatedIngredients(ingredients: [Ingredient]) {
        for ingredient in ingredients {
            addIngredient(ingredient)
        }
    }
    
    func removeIngredient(ingredient: Ingredient) {
        if let ingredientIndex = myPantry.indexOf(ingredient) {
            myPantry.removeAtIndex(ingredientIndex)
            self.saveToPersistentStorage()
        }
    }
    
    func loadFromPersistentStorage() {
        let ingredientDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(ingredientsKey) as? [Dictionary<String, AnyObject>]
        
        if let ingredientDictionaries = ingredientDictionariesFromDefaults {
            
            self.myPantry = ingredientDictionaries.map({Ingredient(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        let ingredientDictionaries = self.myPantry.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setObject(ingredientDictionaries, forKey: ingredientsKey)
    }
    
    
}
