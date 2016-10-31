
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        splitDataSource()

        self.alcoholicTableView.reloadData()
        self.nonAlcoholicTableView.reloadData()
        
        if let alertVC = SettingsController.checkEmptyPantry() {
            present(alertVC, animated: true, completion: nil)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == alcoholicTableView{
            return alcoholicDataSource.count
        } else {
            return nonAlcoholicDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == alcoholicTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "alcoholic", for: indexPath) as! IngredientTableViewCell
            let ingredient = alcoholicDataSource[(indexPath as NSIndexPath).row]
            
            cell.setCell(ingredient)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nonAlcoholic", for: indexPath) as! IngredientTableViewCell
            
            let ingredient = nonAlcoholicDataSource[(indexPath as NSIndexPath).row]
            
            cell.setCell(ingredient)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == alcoholicTableView {
            return "Alcoholic"
        } else {
            return "Non-Alcoholic"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ingredient = alcoholicDataSource[(indexPath as NSIndexPath).row]
        
        self.performSegue(withIdentifier: "oneIngredient", sender: ingredient)
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if tableView == alcoholicTableView && editingStyle == .delete {
            
                let ingredient = self.alcoholicDataSource[(indexPath as NSIndexPath).row]
                IngredientController.sharedController.removeIngredient(ingredient)
                self.splitDataSource()
                self.alcoholicTableView.deleteRows(at: [indexPath], with: .fade)
            
         } else  if tableView == nonAlcoholicTableView && editingStyle == .delete {
            
                let ingredient = self.nonAlcoholicDataSource[(indexPath as NSIndexPath).row]
                IngredientController.sharedController.removeIngredient(ingredient)
                self.splitDataSource()
                self.nonAlcoholicTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oneIngredient"{
            let dVC = segue.destination as! RecipesViewController
            let ingredient = sender as! Ingredient
            dVC.fromSingleIngredient = ingredient
        }
    }

}
