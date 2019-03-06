//
//  LoginViewModel.swift
//  MobileCI
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

protocol LoginViewModelType {
    
    var username: BehaviorRelay<String> {get}
    var password: BehaviorRelay<String> {get}
    
    var result: BehaviorSubject<String> {get}

    func loginAction() -> CocoaAction
    
}

class MockLoginViewModel: LoginViewModelType {
    
    private var users = [User]()
    
    @discardableResult
    private func addUser(username: String, password: String) -> User {
        let u = User(id: UUID().uuidString, username: username, password: password)
        users.append(u)
        return u
    }
    
    var username: BehaviorRelay<String>
    var password: BehaviorRelay<String>
    
    var result: BehaviorSubject<String>

    init() {
        username = BehaviorRelay<String>(value: "")
        password = BehaviorRelay<String>(value: "")
        result = BehaviorSubject<String>(value: "")
        
        self.addUser(username: "alice", password: "abc123")
        self.addUser(username: "bob", password: "LfdVD=An")
    }
    
    func loginAction() -> CocoaAction {
        return CocoaAction { [weak self] _ in
            let username = self?.username.value
            let password = self?.password.value
            
            let cnt = self?.users.filter {
                $0.username == username && $0.password == password
            }.count
            
            if let count = cnt, count > 0 {
                self?.result.onNext("login_response_success".localized())
            } else {
                self?.result.onNext("login_response_fail".localized())
            }
            
            return Observable.empty()
        }
    }
    
}
