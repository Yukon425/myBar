//
//  RecipesViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var recipeDataSource = [Recipe]()
    
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
        
        let alert = UIAlertController(title: "Cocktail", message: "\(recipe.name)\n (You can also shake to randomize recipes)", preferredStyle: .Alert)
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
        populateDataSource()
        self.tableViewOutlet.reloadData()
        self.navigationItem.title = "Possibilities"
        self.becomeFirstResponder()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        populateDataSource()
        self.tableViewOutlet.reloadData()
//        randomButtonOutlet.layer.borderWidth = 1.75
//        randomButtonOutlet.layer.borderColor = UIColor.whiteColor().CGColor
//        randomButtonOutlet.layer.cornerRadius = 10.0
//        randomButtonOutlet.tintColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateDataSource(){
        let inventory = IngredientController.sharedController.myPantry
        let recipes = JSONController.queryRecipes()
        recipeDataSource = RecipeController.sharedInstance.filterRecipes(inventory, recipes: recipes)
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipe", forIndexPath: indexPath)
        
        let recipe = recipeDataSource[indexPath.row]
        
        cell.textLabel?.text = recipe.name
        cell.textLabel?.textColor = .whiteColor()
        
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
