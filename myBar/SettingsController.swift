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
        if(NSUserDefaults.standardUserDefaults().boolForKey("HasLaunchedOnce"))
        {
            IngredientController.sharedController.loadFromPersistentStorage()
        }
        else
        {
            // first launch
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasLaunchedOnce")
            NSUserDefaults.standardUserDefaults().synchronize()
//            let salt = Ingredient(alcoholic: false, name: "Salt", category: "spice")
//            IngredientController.sharedController.addIngredient(salt)
            
            
            let arrayOfIngredients = [Ingredient(alcoholic: false, name: "Salt", category: "spice"), Ingredient(alcoholic: false, name: "Black pepper", category: "spice"), Ingredient(alcoholic: false, name: "Ice", category: "ice"), Ingredient(alcoholic: false, name: "Sugar", category: "spice"), Ingredient(alcoholic: false, name: "Water", category: "softDrink")]
            IngredientController.sharedController.addPrepopulatedIngredients(arrayOfIngredients)
  
        }
        
   
    }
    
    static func checkEmptyPantry() -> UIViewController? {
        if !NSUserDefaults.standardUserDefaults().boolForKey("DisplayedAddIngredients") {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "DisplayedAddIngredients")
            let pantryAlertController = UIAlertController(title: "Pantry Requires More Ingredients", message: "Tap '+' to add more ingredients.", preferredStyle: .Alert)
            let continueAction = UIAlertAction(title: "Continue", style: .Default) { (action) in
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
        if !NSUserDefaults.standardUserDefaults().boolForKey("DisplayedRecipes") {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "DisplayedRecipes")
            let randomizedAlertController = UIAlertController(title: "Generate Random Recipe", message: "Shake phone or tap the dice to generate a randomized recipe.", preferredStyle: .Alert)
            let continueAction = UIAlertAction(title: "Continue", style: .Default) { (action) in
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

