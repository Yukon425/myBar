//
//  RecipeController.swift
//  myBar
//
//  Created by Sean Chang on 1/5/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class RecipeController{
    
    static func initArrayRecipeID(data: NSData)->[Int]{
        var json = [String : AnyObject]()
        
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String : AnyObject]
        } catch (let error as NSError){
            print(error.localizedDescription)
        }
        
        if let searchObject = json as [String:AnyObject]?{
            if let dicArray = searchObject["drinks"] as? [[String:AnyObject]]{
                var idArray: [Int] = []
                
                for item in dicArray {
                    if let id = item["idDrink"] as? String {
                        
                        if let idInt = Int(id) {
                            idArray.append(idInt)
                        }
                        
                    }
                }
                return idArray
            }
        }
        
        return []
    }
    
}