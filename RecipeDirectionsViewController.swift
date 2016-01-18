//
//  RecipeDirectionsViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class RecipeDirectionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var myRecipe: Recipe?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = myRecipe!.instructions
        self.navigationItem.title = myRecipe!.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myRecipe!.ingredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredients", forIndexPath: indexPath)
        
        let ingredient = myRecipe!.ingredients[indexPath.row]
        
        let ingredientAmt = ingredient["volume"]
        let ingredientName = ingredient["name"]
        
        let ingredientObj = Ingredient(name: ingredientName!)
        
        if IngredientController.sharedController.myPantry.contains(ingredientObj){
            cell.textLabel?.text = "●   " + ingredientAmt! + ingredientName!
            cell.textLabel?.textColor = .whiteColor()

        } else {
            cell.textLabel?.text = "●   " + ingredientAmt! + ingredientName!
            cell.textLabel?.textColor = .grayColor()

        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recipe"
    }
    
//    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
//        header.contentView.backgroundColor = .lightColor()
//        header.textLabel?.textColor = .whiteColor()
//        header.layer.borderWidth = 1.75
//        header.layer.cornerRadius = 5.0
//        header.layer.borderColor = UIColor.whiteColor().CGColor
//    }

}
