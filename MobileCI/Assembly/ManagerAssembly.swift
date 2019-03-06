//
//  ManagerAssembly.swift
//  MobileCI
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

// swiftlint:disable line_length

class ManagerAssembly: Assembly {
    func assemble(container: Container) {
        
        container.autoregister(RoutingManager.self, initializer: RouteManager.init)
        
    }
}
