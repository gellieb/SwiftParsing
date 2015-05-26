//
//  ViewController.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/1/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Parsing JSON with SwiftyJSON Library --> allows you to eliminate all those nil checks
        // 1. create JSON constant via the JSON() init method and your data object
            // Swifty converts this data into a JSON object using NSJSONSerialization
            // SwiftyJSON takes care of all the optional validation that you previously had to code by hand.
        // 2. Know which keys and indices you want to access.
        // 3. At end of parsing process, pass .string to retrieve string value, .array for array value, etc
        // That's it.
    DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
        // Get #1 app name using SwiftyJSON
        let json = JSON(data: data)
        if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
            println("SwiftyJSON: \(appName)")
        }
    }
    
    DataManager.getTopAppsDataFromItunesWithSuccess{ (iTunesData) -> Void in
        let json = JSON(data: iTunesData)
        if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
            println("NSURLSession: \(appName)")
        }
    }
    
    
    // Parsing JSON Native Swift Way
    
//    DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
//        // Get the number 1 app using optional binding and NSJSONSerialization
//        //1
//        var parseError: NSError?
//        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data,
//            options: NSJSONReadingOptions.AllowFragments,
//            error:&parseError)
//        
//        //2
//        if let topApps = parsedObject as? NSDictionary {
//            if let feed = topApps["feed"] as? NSDictionary {
//                if let apps = feed["entry"] as? NSArray {
//                    if let firstApp = apps[0] as? NSDictionary {
//                        if let imname = firstApp["im:name"] as? NSDictionary {
//                            if let appName = imname["label"] as? NSString {
//                                //3
//                                println("Optional Binding: \(appName)")
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
    
    
    }
}