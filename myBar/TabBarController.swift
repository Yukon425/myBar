//
//  TabBarController.swift
//  myBar
//
//  Created by Michael Wilkowski on 1/18/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        
        let buttonView = UIView()
        let viewWidth = ((UIApplication.sharedApplication().windows.first?.frame.width)! / 3) + 10 //self.tabBar.frame.height * 1.5
        let viewHeight = (self.tabBar.frame.width / 4)
        let viewX = ((UIApplication.sharedApplication().windows.first?.frame.width)! / 2) - (viewWidth / 2)
        let viewY = (UIApplication.sharedApplication().windows.first?.frame.height)! - self.tabBar.frame.height
        
        buttonView.frame = CGRect(x:  viewX, y: viewY, width:viewWidth, height: viewHeight)
        //buttonView.backgroundColor = UIColor.redColor()
        self.view.addSubview(buttonView)
        
        let button =  UIButton(frame: CGRectMake(42.5, 0, 50, 50))
        button.backgroundColor = UIColor.redColor()
        button.layer.cornerRadius = 10
        //button.setTitle("+", forState: UIControlState.Normal)
        let image = UIImage(named: "Plus_Math-30")
        button.setImage(image, forState: .Normal)
        button.addTarget(self, action: "buttonAction", forControlEvents: .TouchUpInside)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.blueColor().CGColor
        buttonView.addSubview(button)
    }
    
    func buttonAction(){
        performSegueWithIdentifier("middleButton", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "middleButton" {
            let dVC = segue.destinationViewController as! AddIngredientViewController
        }
    }
    
}