//
//  AppDelegate.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import UIKit
import MagicalRecord
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MagicalRecord.setupCoreDataStackWithInMemoryStore()
        Fabric.with([Crashlytics.self])
        
        let nav = UINavigationController.init(rootViewController:LoginTableViewController.init(style: .grouped))
        
        self.window = UIWindow()
        if let window = self.window {
            window.rootViewController = nav
            window.makeKeyAndVisible()
        }
        return true
    }
}
