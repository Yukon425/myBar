//
//  JsonController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/6/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class JSONController {
    
    static func queryRecipes(){
        
        var recipes: [Recipe] = []
        
        guard let path = NSBundle.mainBundle().pathForResource("drinkList", ofType: "json") else {return}
        
        guard let json = NSData(contentsOfFile: path) else {return}
        
        let object: AnyObject
        
        do {
            object = try NSJSONSerialization.JSONObjectWithData(json, options: [])
        } catch {
            print("Json failed")
            return
        }
        
        if let dicObject = object as? [String:AnyObject]{
            let allKeys = dicObject.keys
            
            for key in allKeys {
                guard let recipeDic = dicObject[key] as? [String:AnyObject] else {return}
                guard let recipeObject = Recipe(dic: recipeDic) else {return}
                recipes.append(recipeObject)
            }
        }
    }
        
}