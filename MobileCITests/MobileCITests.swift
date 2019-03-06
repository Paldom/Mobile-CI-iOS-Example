//
//  MobileCITests.swift
//  MobileCITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import MobileCI

class MobileCITests: XCTestCase {
    var viewModel: LoginViewModelType!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        viewModel = MockLoginViewModel()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    func testUsernameStartsWithEmpty() throws {
        XCTAssertEqual(try viewModel.username.asObservable().toBlocking().first(), "")
    }
    
    func testPasswordStartsWithEmpty() throws {
        XCTAssertEqual(try viewModel.password.asObservable().toBlocking().first(), "")
    }

}
