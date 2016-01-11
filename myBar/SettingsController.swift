//
//  SettingsController.swift
//  myBar
//
//  Created by Sean Chang on 1/11/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class SettingsController {
    
    static let sharedInstance = SettingsController()
 
    func firstLaunch() {
        if(NSUserDefaults.standardUserDefaults().boolForKey("HasLaunchedOnce"))
        {
            IngredientController.sharedController.loadFromPersistentStorage()
        }
        else
        {
            // first launch
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasLaunchedOnce")
            NSUserDefaults.standardUserDefaults().synchronize()
            let salt = Ingredient(alcoholic: false, name: "Salt", category: "spice")
            IngredientController.sharedController.addIngredient(salt)
            
        }
    }
    
}