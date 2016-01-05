//
//  InventoryViewController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/4/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var alcoholicTableView: UITableView!
    
    
    @IBOutlet weak var nonAlcoholicTableView: UITableView!
    
    
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
        if tableView == alcoholicTableView {
            let cell = tableView.dequeueReusableCellWithIdentifier("alcoholic", forIndexPath: indexPath)
            
            cell.textLabel?.text = "Vodka"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("nonAlcoholic", forIndexPath: indexPath)
            
            cell.textLabel?.text = "salt"
            
            return cell
        }
    }

}
