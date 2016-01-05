//
//  NetworkController.swift
//  myBar
//
//  Created by Sean Chang on 1/5/16.
//  Copyright © 2016 JustWilks. All rights reserved.
//

import Foundation

//http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=15122
//http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka

class NetworkController {
    
    static let baseSearchURLString = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i="
    
    static func dataAtURLwithKeyword(keyword: String, completion: (resultData: NSData?) -> Void) {
        
        let searchURLString = baseSearchURLString + keyword
        
        let url = NSURL(string: searchURLString)
        guard let myUrl = url else {return}
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(myUrl) { (data, _, error) -> Void in
            
            if let error = error {
                print(error.localizedDescription)
                completion(resultData: nil)
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
}