//
//  IngredientController.swift
//  myBar
//
//  Created by Daniel Lee on 1/6/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class IngredientController {
    
    fileprivate let ingredientsKey = "ingredients"
    
    static let sharedController = IngredientController()
    
    var myPantry: [Ingredient] = [] {
        didSet{
            
            //The following code takes 2-3 seconds, we put it on a background thread to prevent "deleting" from slowing down the UI
            let backgroundQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)

            backgroundQueue.async(execute: { () -> Void in
                RecipeController.sharedInstance.populatePossibleRecipes()
            })
        }
    }
    

    
    func addIngredient(_ ingredient: Ingredient) {
        if !(myPantry.contains(ingredient)){
            myPantry.append(ingredient)
            self.saveToPersistentStorage()
        }
        
    }
    
    func addPrepopulatedIngredients(_ ingredients: [Ingredient]) {
        for ingredient in ingredients {
            addIngredient(ingredient)
        }
    }
    
    func removeIngredient(_ ingredient: Ingredient) {
        if let ingredientIndex = myPantry.index(of: ingredient) {
            myPantry.remove(at: ingredientIndex)
            self.saveToPersistentStorage()
        }
    }
    
    func loadFromPersistentStorage() {
        let ingredientDictionariesFromDefaults = UserDefaults.standard.object(forKey: ingredientsKey) as? [Dictionary<String, AnyObject>]
        
        if let ingredientDictionaries = ingredientDictionariesFromDefaults {
            
            self.myPantry = ingredientDictionaries.map({Ingredient(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        let ingredientDictionaries = self.myPantry.map({$0.dictionaryCopy()})
        UserDefaults.standard.set(ingredientDictionaries, forKey: ingredientsKey)
    }
    
    
}
