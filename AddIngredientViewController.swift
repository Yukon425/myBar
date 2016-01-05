//
//  AddIngredientViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class AddIngredientViewController: UIViewController {

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredient", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Schnops"

        
        return cell
    }

}
