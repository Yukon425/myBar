//
//  SettingsController.swift
//  myBar
//
//  Created by Sean Chang on 1/11/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation
import UIKit

class SettingsController {
    
//    static let sharedInstance = SettingsController()
 
    static func firstLaunch() {
        if(UserDefaults.standard.bool(forKey: "HasLaunchedOnce"))
        {
            IngredientController.sharedController.loadFromPersistentStorage()
        }
        else
        {
            // first launch
            UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
            UserDefaults.standard.synchronize()
//            let salt = Ingredient(alcoholic: false, name: "Salt", category: "spice")
//            IngredientController.sharedController.addIngredient(salt)
            
            
            let arrayOfIngredients = [Ingredient(alcoholic: false, name: "Salt", category: "spice"), Ingredient(alcoholic: false, name: "Black pepper", category: "spice"), Ingredient(alcoholic: false, name: "Ice", category: "ice"), Ingredient(alcoholic: false, name: "Sugar", category: "spice"), Ingredient(alcoholic: false, name: "Water", category: "softDrink")]
            IngredientController.sharedController.addPrepopulatedIngredients(arrayOfIngredients)
  
        }
        
   
    }
    
    static func checkEmptyPantry() -> UIViewController? {
        if !UserDefaults.standard.bool(forKey: "DisplayedAddIngredients") {
            UserDefaults.standard.set(true, forKey: "DisplayedAddIngredients")
            let pantryAlertController = UIAlertController(title: "Pantry Requires More Ingredients", message: "Tap '+' to add more ingredients.", preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Continue", style: .default) { (action) in
                print(action)
            }
            
            pantryAlertController.addAction(continueAction)
            
            return pantryAlertController
        } else {
            print("More ingredients required")
            return nil
        }
    }
    
    static func randomizeAlert() -> UIViewController? {
        if !UserDefaults.standard.bool(forKey: "DisplayedRecipes") {
            UserDefaults.standard.set(true, forKey: "DisplayedRecipes")
            let randomizedAlertController = UIAlertController(title: "Generate Random Recipe", message: "Shake phone or tap the dice to generate a randomized recipe.", preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Continue", style: .default) { (action) in
                print(action)
            }
            
            randomizedAlertController.addAction(continueAction)
            
            return randomizedAlertController
        } else {
            print("Recipes not randomized")
            return nil
        }
    }

    
}

