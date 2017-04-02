//
//  AppDelegate.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 3/26/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.black
        let nav = UINavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
        //nav.pushViewController(ClassicFeedViewController(), animated: false)
        nav.pushViewController(MainVC(), animated: false)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }


}

