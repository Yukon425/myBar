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
        
        guard let path = NSBundle.mainBundle().pathForResource("drinkList", ofType: "json") else {return []}
        
        guard let json = NSData(contentsOfFile: path) else {return []}
        
        let object: AnyObject
        
        do {
            object = try NSJSONSerialization.JSONObjectWithData(json, options: [])
        } catch {
            print("Json failed")
            return []
        }
        
        if let dicObject = object as? [String:AnyObject]{
            let allKeys = dicObject.keys
            
            for key in allKeys {
                if let recipeDic = dicObject[key] as? [String:AnyObject]{
                    if let recipeObject = Recipe(dic: recipeDic){
                        recipes.append(recipeObject)
                    }
                }
            }
            
            return recipes
            print("hi")
        } else {
            return []
        }
    }
    
    static func queryIngredients()->[Ingredient]{
        var ingredients: [Ingredient] = []
        
        guard let path = NSBundle.mainBundle().pathForResource("ingredients", ofType: "json") else {return []}
        
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
                guard let ingredientObject = Ingredient(dictionary: ingredient) else {return []}
                ingredients.append(ingredientObject)
            }
            return ingredients
        }
        return []
    }
        
}




















