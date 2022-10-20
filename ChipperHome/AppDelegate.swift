//
//  AppDelegate.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ContainerViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

