//
//  AddIngredientViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class AddIngredientViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var allIngredients = [Ingredient]()
    var ingredientDataSource = [Ingredient]()
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let unsortedIngredients: [Ingredient] = JSONController.queryIngredients()
        let sorted: [Ingredient] = unsortedIngredients.sort({ $0.category > $1.category })
        self.allIngredients = sorted
        self.ingredientDataSource = self.allIngredients
        self.view.backgroundColor = UIColor(red:0.12, green:0.18, blue:0.2, alpha:1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell", forIndexPath: indexPath) as! AddIngredientTableViewCell
        
        cell.nameLabel?.text = ingredientDataSource[indexPath.row].name
        
        if IngredientController.sharedController.myPantry.contains(ingredientDataSource[indexPath.row]) {
            cell.checkLabel?.text = "✓"
        } else {
            cell.checkLabel?.text = "❐"
        }
        cell.nameLabel?.textColor = .whiteColor()
        cell.checkLabel?.textColor = .whiteColor()

        cell.setCell(ingredientDataSource[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell", forIndexPath: indexPath) as! AddIngredientTableViewCell
        if IngredientController.sharedController.myPantry.contains(ingredientDataSource[indexPath.row]){
            cell.checkLabel?.text = "❐"
            let ingredient = ingredientDataSource[indexPath.row]
            IngredientController.sharedController.removeIngredient(ingredient)
            tableViewOutlet.reloadData()
        } else {
            cell.checkLabel?.text = "✓"
            let ingredient = ingredientDataSource[indexPath.row]
            
            IngredientController.sharedController.addIngredient(ingredient)
            
            tableViewOutlet.reloadData()
        }
    }
    
    // MARK: - Searchbar Delegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        ingredientDataSource = allIngredients.filter({$0.name.uppercaseString.containsString(searchText.uppercaseString)})
        self.tableViewOutlet.reloadData()
    }

}
