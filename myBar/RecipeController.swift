//
//  RecipeController.swift
//  myBar
//
//  Created by Sean Chang on 1/6/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class RecipeController {
    
    static let sharedInstance = RecipeController()
    
    func fitlerRecipes(inventory: [Ingredient], recipes: [Recipe]) -> [Recipe] {
        var canMake = true
        var filteredRecipes = [Recipe]()
        var inventoryStrings = [String]()
        for ingredient in inventory {
            let nameString = ingredient.name
            inventoryStrings.append(nameString)
        }
//        print(inventoryStrings)
        
        for recipe in recipes {
            let recipeIngredients = recipe.ingredients.keys
            let recipeIngredientsFiltered = recipeIngredients.filter() { !$0.isEmpty }
            canMake = true
            for recipeItem in recipeIngredientsFiltered {
                if !inventoryStrings.contains(recipeItem) {
                    //print("can't make this recipe")
                    canMake = false
                }
            }
            if canMake == true {
                filteredRecipes.append(recipe)
                print(recipe.name)
            }
        }
        return filteredRecipes
    }
}

