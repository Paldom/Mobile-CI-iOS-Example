//
//  NavigationSteps.swift
//  MobileCIUITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import Cucumberish

class NavigationSteps: Navigation {
    
    func NavigationStepsImplementation() {
        
        Given("^I navigated to '(\\w+)' screen$") { args, _ in
            self.navigatedToScreen(screenName: (args?[0])!)
        }
        
    }
    
}
