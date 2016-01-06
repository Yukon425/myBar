//
//  RecipesViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource {

    var recipeDataSource = [Recipe]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDataSource()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableViewOutlet.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateDataSource(){
        let inventory = IngredientController.sharedController.myPantry
        let recipes = JSONController.queryRecipes()
        recipeDataSource = RecipeController.sharedInstance.fitlerRecipes(inventory, recipes: recipes)
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipe", forIndexPath: indexPath)
        
        let recipe = recipeDataSource[indexPath.row]
        
        cell.textLabel?.text = recipe.name
        
        return cell
    }

}
