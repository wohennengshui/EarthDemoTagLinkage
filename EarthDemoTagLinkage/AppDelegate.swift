//
//  AppDelegate.swift
//  EarthDemoTagLinkage
//
//  Created by li on 2021/3/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window!.makeKeyAndVisible()

        self.window?.rootViewController = ViewController()
        return true
    }


}

