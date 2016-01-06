//
//  RecipesViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let inventory = RecipeController.sharedInstance.mockIngredients
        let recipes = RecipeController.sharedInstance.mockRecipes
        let possibleRecipes = RecipeController.sharedInstance.fitlerRecipes(inventory, recipes: recipes)
        
        print(possibleRecipes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipe", forIndexPath: indexPath)
        
        cell.textLabel?.text = "White Russian"

        
        //stuff
        
        return cell
    }

}
