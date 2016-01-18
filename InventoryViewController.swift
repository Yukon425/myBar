
//  InventoryViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var alcoholicTableView: UITableView!
    
    @IBOutlet weak var nonAlcoholicTableView: UITableView!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    var alcoholicDataSource = [Ingredient]()
    var nonAlcoholicDataSource = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingsController.firstLaunch()
        navBar.titleView = UIImageView(image: UIImage(named: "devBar_white"))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        splitDataSource()

        self.alcoholicTableView.reloadData()
        self.nonAlcoholicTableView.reloadData()
        
        if let alertVC = SettingsController.checkEmptyPantry() {
            presentViewController(alertVC, animated: true, completion: nil)
        }
    }
    
    
    func splitDataSource(){
        alcoholicDataSource = []
        nonAlcoholicDataSource = []
        for item in IngredientController.sharedController.myPantry{
            if item.alcoholic{
                alcoholicDataSource.append(item)
            } else {
                nonAlcoholicDataSource.append(item)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == alcoholicTableView{
            return alcoholicDataSource.count
        } else {
            return nonAlcoholicDataSource.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == alcoholicTableView {
            let cell = tableView.dequeueReusableCellWithIdentifier("alcoholic", forIndexPath: indexPath) as! IngredientTableViewCell
            let ingredient = alcoholicDataSource[indexPath.row]
            
            cell.setCell(ingredient)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("nonAlcoholic", forIndexPath: indexPath) as! IngredientTableViewCell
            
            let ingredient = nonAlcoholicDataSource[indexPath.row]
            
            cell.setCell(ingredient)
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == alcoholicTableView {
            return "Alcoholic"
        } else {
            return "Non-Alcoholic"
        }
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let ingredient = alcoholicDataSource[indexPath.row]
        
        self.performSegueWithIdentifier("oneIngredient", sender: ingredient)
    }
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if tableView == alcoholicTableView && editingStyle == .Delete {
            
                let ingredient = self.alcoholicDataSource[indexPath.row]
                IngredientController.sharedController.removeIngredient(ingredient)
                self.splitDataSource()
                self.alcoholicTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
         } else  if tableView == nonAlcoholicTableView && editingStyle == .Delete {
            
                let ingredient = self.nonAlcoholicDataSource[indexPath.row]
                IngredientController.sharedController.removeIngredient(ingredient)
                self.splitDataSource()
                self.nonAlcoholicTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "oneIngredient"{
            let dVC = segue.destinationViewController as! RecipesViewController
            let ingredient = sender as! Ingredient
            dVC.fromSingleIngredient = ingredient
        }
    }

}
