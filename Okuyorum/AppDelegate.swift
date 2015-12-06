//
//  AppDelegate.swift
//  Oku
//
//  Created by Abdurrahman AVCI on 05/12/15.
//  Copyright © 2015 Abdurrahman AVCI. All rights reserved.
//

import Darwin
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var words: [String] = []
    var sentences: [String] = []

    // MARK: UIApplicationDelegate

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        do {
            if let path = NSBundle.mainBundle().pathForResource("data", ofType: "txt") {
                let data = try String(contentsOfFile: path)

                let items = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())

                for item in items {
                    if item.isEmpty {
                        continue
                    }
                    
                    if let _ = item.rangeOfString("^[\\wçÇğĞıİöÖşŞüÜ]*$", options: .RegularExpressionSearch) {
                        words.append(item)
                    }
                    else {
                        sentences.append(item)
                    }
                }
            }
        }
        catch _ {
            // TODO: handle errors
        }

        return true
    }

    // MARK: Functions
    
    class func instance() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }

    func word() -> String {
        return self.words[Math.random(self.words.count)]
    }

    func sentence() -> String {
        return self.sentences[Math.random(self.sentences.count)]
    }
}

