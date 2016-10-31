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
        let viewWidth = UIScreen.main.bounds.width / 3
        //let viewWidth = ((UIApplication.sharedApplication().windows.first?.frame.width)! / 3)
        //self.tabBar.frame.height * 1.5
        let viewHeight = CGFloat(49)
        let viewX = UIScreen.main.bounds.width / 2 - viewWidth / 2
        let viewY = UIScreen.main.bounds.height - CGFloat(49)
        //let viewY = (UIApplication.sharedApplication().windows.first?.frame.height)! - self.tabBar.frame.height
        
        buttonView.frame = CGRect(x:  viewX, y: viewY, width:viewWidth, height: viewHeight)
        //buttonView.backgroundColor = UIColor.redColor()
        self.view.addSubview(buttonView)
        
        let button =  UIButton(frame: CGRect(x: viewWidth/2 - 20 , y: 4.5, width: 40, height: 40))
        button.backgroundColor = UIColor.clear
        //button.setTitle("+", forState: UIControlState.Normal)
        let image = UIImage(named: "addbottle")
        button.setImage(image, for: UIControlState())
        button.addTarget(self, action: #selector(TabBarController.buttonAction), for: .touchUpInside)
        
        buttonView.addSubview(button)
    }
    
    func buttonAction(){
        performSegue(withIdentifier: "middleButton", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "middleButton" {
            _ = segue.destination as! AddIngredientViewController
        }
    }
    
}
