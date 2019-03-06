//
//  LoginScreenSteps.swift
//  MobileCIUITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import Cucumberish

class LoginScreenSteps: LoginScreen {
    
    func LoginScreenStepsImplementation() {
        
        Given("^form is empty$") { _, _ in
            self.verifyFormIsEmpty()
        }
        
        When("^I give username (.+)$") { args, _ in
            self.fillUsername(username: (args?[0])!)
        }
        
        When("^I give password (.+)$") { args, _ in
            self.fillPassword(password: (args?[0])!)
        }
        
        When("^I try to log in$") { _, _ in
            self.tapLoginButton()
        }
        
        Then("^I see message saying '([\\w| ]+)'$") { args, _ in
            self.verifyResponseLabel(content: (args?[0])!)
        }
        
    }
    
}

