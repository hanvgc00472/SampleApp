//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Nguyễn Việt Hà on 4/22/20.
//  Copyright © 2020 Nguyễn Việt Hà. All rights reserved.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterDistribute

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MSDistributeDelegate {

    let window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MSDistribute.setDelegate(self);
        
        // Override point for customization after application launch.
        MSDistribute.checkForUpdate()
        MSAppCenter.start("5bf8ee42-bb8e-4bd1-9746-b1cdc68cf01a", withServices:[
          MSAnalytics.self,
          MSCrashes.self
        ])
        
        let alertController = UIAlertController(title: "Update available.",
                                              message: "Do you want to update?",
                                       preferredStyle:.alert)

        alertController.addAction(UIAlertAction(title: "Update", style: .cancel) {_ in
          MSDistribute.notify(.update)
        })

        alertController.addAction(UIAlertAction(title: "Postpone", style: .default) {_ in
          MSDistribute.notify(.postpone)
        })

        // Show the alert controller.
        self.window?.rootViewController?.present(alertController, animated: true)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

