//
//  AppDelegate.swift
//  RedditViewer
//
//  Created by Pavlo Zakharov on 13.09.2019.
//  Copyright © 2019 Pavlo Zakharov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        appCoordinator = AppCoordinator(context: navigationController)
        appCoordinator?.start()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        appCoordinator?.applicationWillResignActive()
    }
}

