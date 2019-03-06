//
//  RouteManager.swift
//  MobileCI
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

protocol RoutingManager {
    
    func open(uri: String)
    
}

class RouteManager: RoutingManager {
    
    fileprivate var rootViewController: UIViewController? {
    
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }
        
        set {
            guard let vc = newValue else { return }
            if let window = UIApplication.shared.keyWindow {
                window.rootViewController = vc
            } else if let window = UIApplication.shared.delegate?.window {
                window?.rootViewController = vc
                window?.makeKeyAndVisible()
            }
        }
    
    }
    
    func open(uri: String) {
        
        switch uri {
        case let str where str.contains("login"):
            let sb = SwinjectStoryboard.create(name: "Login",
                                               bundle: Bundle.main,
                                               container: SwinjectStoryboard.defaultContainer)
            self.rootViewController = sb.instantiateInitialViewController()
        default:
            break
        }
    }
    
    
}
