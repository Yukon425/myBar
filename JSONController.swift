//
//  JsonController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/6/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class JSONController {
    
    static func queryRecipes()->[Recipe]{
        
        var recipes: [Recipe] = []
        
        guard let path = NSBundle.mainBundle().pathForResource("recipes", ofType: "json") else {return []}
        
        guard let json = NSData(contentsOfFile: path) else {return []}
        
        let object: AnyObject
        
        do {
            object = try NSJSONSerialization.JSONObjectWithData(json, options: [])
        } catch {
            print("Json failed")
            return []
        }
        
        if let dicObject = object as? [[String:AnyObject]]{
            
            for dictionary in dicObject {
                if let recipeObject = Recipe(dic: dictionary){
                    recipes.append(recipeObject)
                }
            }
            
            return recipes
        } else {
            return []
        }
    }
    
    static func queryIngredients()->[Ingredient]{
        
        var ingredients: [Ingredient] = []
        
        guard let path = NSBundle.mainBundle().pathForResource("catingredients", ofType: "json") else {return []}
        
        guard let json = NSData(contentsOfFile: path) else {return []}
        
        let object: AnyObject
        
        do {
            object = try NSJSONSerialization.JSONObjectWithData(json, options: [])
        } catch {
            print("Json failed")
            return []
        }
        
        if let dicObject = object as? [String : AnyObject]{
            
            guard let dicArray = dicObject["drinks"] as? [[String:AnyObject]] else {return []}
            
            
            for ingredient in dicArray {
//                guard let ingredientObject = Ingredient(dictionary: ingredient) else {return []}
                if let ingredientObject = Ingredient(dictionary: ingredient){
                    ingredients.append(ingredientObject)
                }
            }
            return ingredients
        }
        return []
    }
        
}


