
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
    
    var alcoholicDataSource = [Ingredient]()
    var nonAlcoholicDataSource = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(IngredientController.sharedController.myPantry.map({$0.name}))
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        splitDataSource()

        self.alcoholicTableView.reloadData()
        self.nonAlcoholicTableView.reloadData()
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
            let cell = tableView.dequeueReusableCellWithIdentifier("alcoholic", forIndexPath: indexPath)
            let ingredient = alcoholicDataSource[indexPath.row]
            
            cell.textLabel?.text = ingredient.name
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("nonAlcoholic", forIndexPath: indexPath)
            
            let ingredient = nonAlcoholicDataSource[indexPath.row]
            
            cell.textLabel?.text = ingredient.name
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if tableView == alcoholicTableView{
                let ingredient = alcoholicDataSource[indexPath.row]
                IngredientController.sharedController.removeIngredient(ingredient)
                //alcoholicTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

            } else {
                let ingredient = nonAlcoholicDataSource[indexPath.row]
                IngredientController.sharedController.removeIngredient(ingredient)
                //nonAlcoholicTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

            }
            
        }
    }

}
