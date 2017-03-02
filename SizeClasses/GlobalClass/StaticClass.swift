//
//  StaticClass.swift
//  TDAUX
//
//  Created by NIRAL SHAH on 19/01/17.
//  Copyright © 2017 Envale Systems. All rights reserved.
//

import UIKit

class StaticClass {

    private static var __once: () = {
        // Static.instance = StaticClass()
    }()

    class var sharedInstance: StaticClass {
        struct Static {
            static var instance: StaticClass?
        }
        _ = StaticClass.__once
        return Static.instance!
    }

    func saveToUserDefaults (_ value: AnyObject?, forKey key: NSString) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key as String)
        defaults.synchronize()
    }
    
    func retriveFromUserDefaults (_ key: NSString) -> AnyObject? {
        let defaults = UserDefaults.standard
        if(defaults.value(forKey: key as String) != nil){
            print(defaults.value(forKey: key as String))
        }else{
            return "" as AnyObject?
        }
        return defaults.value(forKey: key as String) as AnyObject?
    }

}
