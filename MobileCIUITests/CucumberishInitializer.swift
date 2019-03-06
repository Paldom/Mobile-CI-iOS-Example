//
//  CucumberishInitializer.swift
//  MobileCIUITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import XCTest
import Cucumberish

class CucumberishInitializer: NSObject {
    
    fileprivate struct Keys {
        static let IncludeTags = "-IncludeTags:"
        static let ExcludeTags = "-ExcludeTags:"
    }
    
    @objc public class func CucumberishSwiftInit() {
 
        beforeStart { () -> Void in
            LoginScreenSteps().LoginScreenStepsImplementation()
            NavigationSteps().NavigationStepsImplementation()
        }
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        
        Cucumberish.executeFeatures(
            inDirectory: "Features",
            from: bundle,
            includeTags: getTags(for: Keys.IncludeTags),
            excludeTags: getTags(for: Keys.ExcludeTags))
    }
    
    fileprivate class func getTags(for key: String) -> [String]? {
        var itemsTags: [String]?
        for i in ProcessInfo.processInfo.arguments {
            if i.hasPrefix(key) {
                let newItems = i.replacingOccurrences(of: key, with: "")
                itemsTags = newItems.components(separatedBy: ",")
            }
        }
        return itemsTags
    }
    
}
