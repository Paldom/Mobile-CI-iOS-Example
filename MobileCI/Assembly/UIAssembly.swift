//
//  UIAssembly.swift
//  MobileCI
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

// swiftlint:disable line_length

class UIAssembly: Assembly {
    func assemble(container: Container) {
        
        container.storyboardInitCompleted(LoginViewController.self, initCompleted: { r, c in
            c.viewModel = r.resolve(LoginViewModelType.self)!
        })
        container.autoregister(LoginViewModelType.self, initializer: MockLoginViewModel.init)
        
    }
}
