//
//  AppDelegate.swift
//  Coupon
//
//  Created by macbook on 17/7/11.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        //设置状态栏为高亮
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
    //    SMSSDK.registerApp("1fc90d227ae80", withSecret: "a46f681d2654a7ca699aab9e3fd730ba")
        
        //创建导航栏
        //let VC = Login()
        let VC = Welcome()
        //let VC = Register()
        //let VC  = SellersInfo()
        //let VC = Details()
       // let VC = Mine()
        //let VC = TabBarViewController()
   
        //let VC = RegisterViewController()
        let navigationC = UINavigationController(rootViewController: VC)
        self.window?.rootViewController = navigationC
        self.window?.backgroundColor = UIColor.white
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

