//
//  AppearanceController.swift
//  myBar
//
//  Created by Daniel Lee on 1/7/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func darkColor() -> UIColor {
        return UIColor(red:0.02, green:0.09, blue:0.12, alpha:1)
    }
    
    class func lightColor() -> UIColor {
        return UIColor(red:0.05, green:0.21, blue:0.34, alpha:1)
    }
    
    class func lightestColor() -> UIColor {
        return UIColor(red:0.2, green:0.49, blue:0.64, alpha:1)
    }
}

class AppearanceController{
    class func setupAppearance() {
       // UINavigationBar.appearance().tintColor = .darkColor()
        UITabBar.appearance().tintColor = .whiteColor()
        UIBarButtonItem.appearance().tintColor = .whiteColor()
        

    }
}
