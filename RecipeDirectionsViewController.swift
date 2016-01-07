//
//  RecipeDirectionsViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class RecipeDirectionsViewController: UIViewController {

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
    
        cell.textLabel?.text = "\(ingredient.1)\(ingredient.0)"
        cell.textLabel?.textColor = .whiteColor()
        
        //stuff
        
        return cell
    }

}
