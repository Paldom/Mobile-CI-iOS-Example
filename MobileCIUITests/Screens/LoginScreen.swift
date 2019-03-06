//
//  LoginScreen.swift
//  MobileCIUITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import XCTest

class LoginScreen: XCTestCase {
    
    fileprivate struct Keys {
        static let usernameInput = "login_username_input"
        static let passwordInput = "login_password_input"
        static let loginButton = "login_button"
        static let responseLabel = "login_response_label"
    }
    
    let app = XCUIApplication()
    
    func verifyFormIsEmpty() {
        
        Common().waitForElementToAppear(app.buttons[Keys.loginButton], withTimeout: nil)
        Common().verifyUIElementExists(.button, withId: Keys.loginButton)
        
        let loginUsernameInputTextField = app.textFields[Keys.usernameInput]
        let loginPasswordInputSecureTextField = app.secureTextFields[Keys.passwordInput]
        
        let loginValue = loginUsernameInputTextField.value as! String
        let passwordValue = loginPasswordInputSecureTextField.value as! String
        
        XCTAssert(loginValue == "" || loginValue == loginUsernameInputTextField.placeholderValue,
                  "Login field is not empty")
        XCTAssert(passwordValue == "" || passwordValue == loginPasswordInputSecureTextField.placeholderValue,
                  "Password field is not empty")
    }
    
    func fillUsername(username: String) {
        let loginUsernameInputTextField = app.textFields[Keys.usernameInput]
        loginUsernameInputTextField.tap()
        loginUsernameInputTextField.typeText(username)
    }
    
    func fillPassword(password: String) {
        let loginPasswordInputSecureTextField = app.secureTextFields[Keys.passwordInput]
        loginPasswordInputSecureTextField.tap()
        loginPasswordInputSecureTextField.typeText(password)
    }
    
    func tapLoginButton() {
        app.buttons[Keys.loginButton].tap()
    }
    
    func verifyResponseLabel(content: String) {
        XCTAssertEqual(content,
                       app.staticTexts
                        .element(matching: .any, identifier: "login_response_label")
                        .label)
    }
    
}
