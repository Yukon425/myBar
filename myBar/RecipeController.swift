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
    
    var possibleRecipes: [Recipe] = []
    
    func populatePossibleRecipes(){
        self.possibleRecipes = filterRecipes(IngredientController.sharedController.myPantry, recipes: JSONController.queryRecipes())
    }
    
    func filterRecipes(inventory: [Ingredient], recipes: [Recipe]) -> [Recipe] {
        var canMake = true
        var filteredRecipes = [Recipe]()
        var inventoryStrings = [String]()
        for ingredient in inventory {
            let nameString = ingredient.name.lowercaseString
            inventoryStrings.append(nameString)
        }
        
        for recipe in recipes {
            var recipeIngredients = [String]()
            
            
            for ingredient in recipe.ingredients{
                let ingredientName = ingredient["name"]!.lowercaseString
                recipeIngredients.append(ingredientName)
            }
            
            let ingredientCount = recipeIngredients.count
            var containCount = 0
            canMake = true
            for recipeItem in recipeIngredients {
                if inventoryStrings.contains(recipeItem) {
                    containCount++
                }
            }
            
            if ingredientCount > containCount + 1 {
                canMake = false
            }
            if ingredientCount == containCount + 1 && ingredientCount <= 2 {
                canMake = false
            }
            
            if canMake == true {
                filteredRecipes.append(recipe)
                print(recipe.name)
                recipe.totalIngredients = ingredientCount
                recipe.userIngredients = containCount
                
            }
        }
        return filteredRecipes
    }
}

