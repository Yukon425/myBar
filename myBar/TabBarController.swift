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
        let viewWidth = UIScreen.mainScreen().bounds.width / 3
        //let viewWidth = ((UIApplication.sharedApplication().windows.first?.frame.width)! / 3)
        //self.tabBar.frame.height * 1.5
        let viewHeight = CGFloat(49)
        let viewX = UIScreen.mainScreen().bounds.width / 2 - viewWidth / 2
        let viewY = UIScreen.mainScreen().bounds.height - CGFloat(49)
        //let viewY = (UIApplication.sharedApplication().windows.first?.frame.height)! - self.tabBar.frame.height
        
        buttonView.frame = CGRect(x:  viewX, y: viewY, width:viewWidth, height: viewHeight)
        //buttonView.backgroundColor = UIColor.redColor()
        self.view.addSubview(buttonView)
        
        let button =  UIButton(frame: CGRectMake(viewWidth/2 - 20 , 4.5, 40, 40))
        button.backgroundColor = UIColor.clearColor()
        //button.setTitle("+", forState: UIControlState.Normal)
        let image = UIImage(named: "addbottle")
        button.setImage(image, forState: .Normal)
        button.addTarget(self, action: "buttonAction", forControlEvents: .TouchUpInside)
        
        buttonView.addSubview(button)
    }
    
    func buttonAction(){
        performSegueWithIdentifier("middleButton", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "middleButton" {
            _ = segue.destinationViewController as! AddIngredientViewController
        }
    }
    
}