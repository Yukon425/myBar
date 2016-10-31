//
//  RecipesViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var fromSingleIngredient: Ingredient?
    var recipeDataSource: [Recipe] = []
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var randomButtonOutlet: UIButton!
    
    @IBAction func randomButtonTapped(_ sender: AnyObject) {
        if recipeDataSource.count > 0 {
            presentRandomAlert()
        }
    }
    
    func presentRandomAlert(){
        let number = arc4random_uniform(UInt32(recipeDataSource.count))
        let recipe = recipeDataSource[Int(number)]
        
        let alert = UIAlertController(title: "\(recipe.name)", message: "", preferredStyle: .alert)
        let toDismiss = UIAlertAction(title: "Dismiss", style: .cancel) { (alert) -> Void in
            print(alert)
        }
        let toRecipe = UIAlertAction(title: "View Recipe", style: .default) { (action) -> Void in
            self.performSegue(withIdentifier: "toDetails", sender: recipe)
        }
        alert.addAction(toDismiss)
        alert.addAction(toRecipe)
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let fromSingleIngredient = fromSingleIngredient {
//            let name = fromSingleIngredient.name
//            self.navigationItem.title = "\(name) Recipes"
//        } else {
//            self.navigationItem.title = "Possibilities"
//        }
        //self.canBecomeFirstResponder
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let myGroup = DispatchGroup()
        myGroup.enter()
        populateDataSource()
        myGroup.leave()
        
        myGroup.notify(queue: DispatchQueue.main) { () -> Void in
            self.tableViewOutlet.reloadData()
            
        if let randomizedAlertVC = SettingsController.randomizeAlert() {
            self.present(randomizedAlertVC, animated: true, completion: nil)
            }
        }
    }
    
    func populateDataSource(){
        
        if let fromSingleIngredient = fromSingleIngredient{
                        
            var newRecipes: [Recipe] = []
            
            for recipe in RecipeController.sharedInstance.possibleRecipes {
                let ingredients = recipe.ingredients.map({$0["name"]!})
                print("")
                if ingredients.contains(fromSingleIngredient.name){
                    newRecipes.append(recipe)
                }
            }
            newRecipes.sort(by: {($0.totalIngredients! - $0.userIngredients!) < ($1.totalIngredients! - $1.userIngredients!)})
            recipeDataSource = newRecipes
            
        } else {
            var newRecipes = RecipeController.sharedInstance.possibleRecipes
            newRecipes.sort(by: {($0.totalIngredients! - $0.userIngredients!) < ($1.totalIngredients! - $1.userIngredients!)})
            recipeDataSource = newRecipes
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipeDataSource.count == 0 {
            return 1
        } else {
            return recipeDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let fromSingleIngredient = fromSingleIngredient {
            let name = fromSingleIngredient.name
            return "\(name) Recipes"
        } else {
            return "Possibilities"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipe", for: indexPath)
        
        
        if self.recipeDataSource.count <= 0 {
            cell.textLabel?.text = "Please add ingredients to your inventory"
            cell.detailTextLabel?.text = ""
            cell.textLabel?.textColor = UIColor.white

        } else {
            let recipe = recipeDataSource[(indexPath as NSIndexPath).row]

            cell.textLabel?.text = recipe.name
            cell.textLabel?.textColor = UIColor.white
            
            if recipe.totalIngredients > recipe.userIngredients {
                cell.detailTextLabel?.text = "(\(recipe.userIngredients!)/\(recipe.totalIngredients!))"
                cell.detailTextLabel?.textColor = UIColor.white
            } else {
                cell.detailTextLabel?.text = "✓"
                cell.detailTextLabel?.textColor = UIColor.white
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipeDataSource[(indexPath as NSIndexPath).row]
        self.performSegue(withIdentifier: "toDetails", sender: recipe)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            let dVC = segue.destination as! RecipeDirectionsViewController
            let recipe = sender as! Recipe
            dVC.myRecipe = recipe
        }
    }
    
    //MARK: - Implementing Shake functionality
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if(event!.subtype == UIEventSubtype.motionShake) {
            
            if recipeDataSource.count > 0 {
                presentRandomAlert()
            }
        }
        
        
    }
    
}
