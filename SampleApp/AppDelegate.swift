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

 


}

