//
//  Navigation.swift
//  MobileCIUITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import XCTest

class Navigation: XCTest {
    
    let app = XCUIApplication()
    
    func navigatedToScreen(screenName: String) {
        app.launchArguments.append("-Screen:" + screenName)
        app.launch()
    }
    
}
