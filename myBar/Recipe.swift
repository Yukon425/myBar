//
//  Recipe.swift
//  myBar
//
//  Created by Sean Chang on 1/5/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

class Recipe {
    var name: String
    var ingredients: [Ingredient]
    var directions: String
    
    init(name: String, ingredients: [Ingredient], directions: String) {
        self.name = name
        self.ingredients = ingredients
        self.directions = directions
    }
}