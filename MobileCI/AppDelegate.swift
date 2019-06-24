//
//  AppDelegate.swift
//  MobileCI
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import Action
import Localize_Swift
import IBLocalizable
import Swinject
import SwinjectStoryboard
import Firebase
import Fabric
import Crashlytics

// swiftlint:disable line_length colon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var container: Container = {
        let container = Container()
        return container
    }()
    
    fileprivate let assemblies: [Assembly] = [
        UIAssembly(),
        ManagerAssembly()
    ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let assembler = Assembler.init(container: container)
        assembler.apply(assemblies: assemblies)
        
        let routeManager = assembler.resolver.resolve(RoutingManager.self)!
        
        SwinjectStoryboard.defaultContainer = container
        
        print(ProcessInfo.processInfo.arguments)
        if let uri = ProcessInfo.processInfo.arguments
            .filter({ return $0.hasPrefix("-Screen:") })
            .first {
            print(ProcessInfo.processInfo.arguments)
            routeManager.open(uri: uri)
        } else {
            routeManager.open(uri: "login")
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let routeManager = SwinjectStoryboard.defaultContainer.resolve(RoutingManager.self)!
        routeManager.open(uri: url.absoluteString)
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

