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
    
    static let recipe1 = Recipe(name: "bullshit drink", ingredients: ["Tequila" : "3/4 oz ", "Lime Juice" : "", "7-Up" : "1/2 shot ", "" : ""], instructions: "Stir well")
    
    static let recipe2 = Recipe(name: "made shit up", ingredients: ["Tequila" : "1/2 oz", "Vodka" : "1/2 oz", "Salt" : "", "": ""], instructions: "Mix it all together. Drink up.")
    
    static let recipe3 = Recipe(name: "drink", ingredients: ["Blasdfad" : "1/2 oz", "Vodka" : "1 oz"], instructions: "should never see me")
    
    let mockRecipes: [Recipe] = [recipe1, recipe2, recipe3]
    
    static let ingredient1 = Ingredient(alcoholic: true, name: "Tequila")
    static let ingredient2 = Ingredient(alcoholic: true, name: "Vodka")
    static let ingredient3 = Ingredient(alcoholic: false, name: "Salt")
    static let ingredient4 = Ingredient(alcoholic: false, name: "7-Up")
    static let ingredient5 = Ingredient(alcoholic: false, name: "Lime Juice")
    
    let mockIngredients: [Ingredient] = [ingredient1, ingredient2, ingredient3, ingredient4, ingredient5]
    
    func fitlerRecipes(inventory: [Ingredient], recipes: [Recipe]) -> [Recipe] {
        var canMake = true
        var filteredRecipes = [Recipe]()
        var inventoryStrings = [String]()
        for ingredient in inventory {
            let nameString = ingredient.name
            inventoryStrings.append(nameString)
        }
        print(inventoryStrings)
        
        for recipe in recipes {
            let recipeIngredients = recipe.ingredients.keys
            let recipeIngredientsFiltered = recipeIngredients.filter() { !$0.isEmpty }
            canMake = true
            for recipeItem in recipeIngredientsFiltered {
                if !inventoryStrings.contains(recipeItem) {
                    print("can't make this recipe")
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

