//
//  AppDelegate.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/02/26.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            KeyakiViewController.createWithTabBarItem(),
            HinataViewController.createWithTabBarItem(),
        ]
        
        // タグ番号が被らないように配列のindexを再設定している
        tabBarController.viewControllers?.enumerated().forEach { args in
            args.element.tabBarItem.tag = args.offset
        }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = tabBarController
        self.window = window
        self.window?.makeKeyAndVisible()
        
        return true
    }

}
