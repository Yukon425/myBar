//
//  RecipesViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var recipeDataSource: [Recipe] = []
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var randomButtonOutlet: UIButton!
    
    @IBAction func randomButtonTapped(sender: AnyObject) {
        if recipeDataSource.count > 0 {
            presentRandomAlert()
        }
    }
    
    func presentRandomAlert(){
        let number = arc4random_uniform(UInt32(recipeDataSource.count))
        let recipe = recipeDataSource[Int(number)]
        
        let alert = UIAlertController(title: "\(recipe.name)", message: "", preferredStyle: .Alert)
        let toDismiss = UIAlertAction(title: "Dismiss", style: .Cancel) { (alert) -> Void in
            print(alert)
        }
        let toRecipe = UIAlertAction(title: "View Recipe", style: .Default) { (action) -> Void in
            self.performSegueWithIdentifier("toDetails", sender: recipe)
        }
        alert.addAction(toDismiss)
        alert.addAction(toRecipe)
        presentViewController(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Possibilities"
        self.canBecomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let myGroup = dispatch_group_create()
        dispatch_group_enter(myGroup)
        populateDataSource()
        dispatch_group_leave(myGroup)
        
        dispatch_group_notify(myGroup, dispatch_get_main_queue()) { () -> Void in
            self.tableViewOutlet.reloadData()
            
        if let randomizedAlertVC = SettingsController.randomizeAlert() {
            self.presentViewController(randomizedAlertVC, animated: true, completion: nil)
            }
        }
    }
    
    func populateDataSource(){
//        let inventory = IngredientController.sharedController.myPantry
//        let recipes = JSONController.queryRecipes()
        recipeDataSource = RecipeController.sharedInstance.possibleRecipes
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipeDataSource.count == 0 {
            return 1
        } else {
            return recipeDataSource.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipe", forIndexPath: indexPath)
        
        
        if self.recipeDataSource.count <= 0 {
            cell.textLabel?.text = "Please add ingredients to your inventory"
        } else {
            let recipe = recipeDataSource[indexPath.row]

            cell.textLabel?.text = recipe.name
            
            if recipe.totalIngredients > recipe.userIngredients {
                cell.detailTextLabel?.text = "(\(recipe.userIngredients!)/\(recipe.totalIngredients!))"
                cell.detailTextLabel?.textColor = .whiteColor()
            } else {
                cell.detailTextLabel?.text = "✓"
                cell.detailTextLabel?.textColor = .whiteColor()
            }
        }
        
        cell.textLabel?.textColor = .whiteColor()
        cell.detailTextLabel?.text = ""
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let recipe = recipeDataSource[indexPath.row]
        self.performSegueWithIdentifier("toDetails", sender: recipe)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetails"{
            let dVC = segue.destinationViewController as! RecipeDirectionsViewController
            let recipe = sender as! Recipe
            dVC.myRecipe = recipe
        }
    }
    
    //MARK: - Implementing Shake functionality
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if(event!.subtype == UIEventSubtype.MotionShake) {
            
            if recipeDataSource.count > 0 {
                presentRandomAlert()
            }
        }
        
        
    }
    
}
