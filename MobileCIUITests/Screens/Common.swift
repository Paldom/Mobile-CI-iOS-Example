//
//  Common.swift
//  MobileCIUITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import XCTest

class Common: XCTest {
    
    fileprivate let timeoutDefault = 5.0
    
    let app = XCUIApplication()
    
    func launchApplication() {
        app.launch()
    }
    
    func verifyUIElementExists(_ type: XCUIElement.ElementType, withId id: String) {
        XCTAssert(app.descendants(matching: type)[id].exists)
    }
    
    @discardableResult
    func waitForElementToAppear(_ element: XCUIElement, withTimeout timeout: TimeInterval?) -> Bool {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate,
                                                    object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout ?? timeoutDefault)
        return result == .completed
    }
}
