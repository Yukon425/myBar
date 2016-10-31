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
    

    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var allIngredients = [Ingredient]()
    var ingredientDataSource = [Ingredient]()
    
    @IBAction func doneButtonTapped(_ sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let unsortedIngredients: [Ingredient] = JSONController.queryIngredients()
        let sorted: [Ingredient] = unsortedIngredients.sorted(by: { $0.category > $1.category })
        self.allIngredients = sorted
        self.ingredientDataSource = self.allIngredients
        self.view.backgroundColor = UIColor(red:0.12, green:0.18, blue:0.2, alpha:1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! AddIngredientTableViewCell
        
        cell.nameLabel?.text = ingredientDataSource[(indexPath as NSIndexPath).row].name
        
        if IngredientController.sharedController.myPantry.contains(ingredientDataSource[(indexPath as NSIndexPath).row]) {
            cell.checkLabel?.text = "✓"
        } else {
            cell.checkLabel?.text = "❐"
        }
        cell.nameLabel?.textColor = UIColor.white
        cell.checkLabel?.textColor = UIColor.white

        cell.setCell(ingredientDataSource[(indexPath as NSIndexPath).row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! AddIngredientTableViewCell
        if IngredientController.sharedController.myPantry.contains(ingredientDataSource[(indexPath as NSIndexPath).row]){
            cell.checkLabel?.text = "❐"
            let ingredient = ingredientDataSource[(indexPath as NSIndexPath).row]
            IngredientController.sharedController.removeIngredient(ingredient)
            tableViewOutlet.reloadData()
        } else {
            cell.checkLabel?.text = "✓"
            let ingredient = ingredientDataSource[(indexPath as NSIndexPath).row]
            
            IngredientController.sharedController.addIngredient(ingredient)
            
            tableViewOutlet.reloadData()
        }
    }
    
    // MARK: - Searchbar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        ingredientDataSource = allIngredients.filter({$0.name.uppercased().contains(searchText.uppercased())})
        self.tableViewOutlet.reloadData()
    }
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBarOutlet.resignFirstResponder()
    }

}
