//
//  AppDelegate.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/28/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("9rV8VrNcQmtUw04ejgN11cbWB3zwiP572BRCrX4w", clientKey: "8pGkwcZ6hCNgBPDxqDBJsapKo35BFwqQPU55rEAe")
        // Override point for customization after application launch.
        if (PFUser.currentUser() != nil) {
            var mainVC: MainPageTableViewController = MainPageTableViewController(className: "User")
            
            // Creating the tab bar.
            let tabBarController = UITabBarController()
            let createTaskVC = CreateTaskViewController(nibName: "CreateTaskViewController", bundle: nil)
            let taskVC = TaskViewController(nibName: "TaskViewController", bundle: nil)
            let controllers = [mainVC,createTaskVC,taskVC]
            tabBarController.viewControllers = controllers
            
            let firstImage = UIImage(named: "example1")
            let secondImage = UIImage(named: "example2")
            let thirdImage = UIImage(named: "example3")
            createTaskVC.tabBarItem = UITabBarItem(title: "Create Task", image: firstImage, tag: 1)
            taskVC.tabBarItem = UITabBarItem(title: "Home", image: secondImage, tag: 2)
            mainVC.tabBarItem = UITabBarItem(title: "History", image: thirdImage, tag: 3)
            
            let frame = UIScreen.mainScreen().bounds
            window = UIWindow(frame: frame)
            window!.rootViewController = tabBarController
            window!.makeKeyAndVisible()
            
        } else{
            var pickVC: PickTypeViewController = PickTypeViewController(nibName: "PickTypeViewController", bundle: nil)
            let frame = UIScreen.mainScreen().bounds
            window = UIWindow(frame: frame)
            window!.rootViewController = pickVC
            window!.makeKeyAndVisible()
        }

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

