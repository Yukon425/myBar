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
        self.allIngredients = JSONController.queryIngredients()
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredient", forIndexPath: indexPath)
        
        cell.textLabel?.text = ingredientDataSource[indexPath.row].name
        
        if IngredientController.sharedController.myPantry.contains(ingredientDataSource[indexPath.row]) {
            cell.detailTextLabel?.text = "√"
        } else {
            cell.detailTextLabel?.text = "-"
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredient", forIndexPath: indexPath)
        cell.detailTextLabel?.text = "√"
        let ingredient = ingredientDataSource[indexPath.row]
        
        IngredientController.sharedController.addIngredient(ingredient)
        
        tableViewOutlet.reloadData()
        
    }
    
    // MARK: - Searchbar Delegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        ingredientDataSource = allIngredients.filter({$0.name.uppercaseString.containsString(searchText.uppercaseString)})
        self.tableViewOutlet.reloadData()
    }

}
