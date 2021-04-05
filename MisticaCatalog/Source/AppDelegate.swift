//
//  AppDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import AppCenter
import AppCenterDistribute
import Mistica
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Configure In-App updates
        AppCenter.start(withAppSecret: "bfef11d4-cda0-4d89-806e-4014c2d80feb", services: [Distribute.self])

        // Configure brand style before initializing the UI
        MisticaConfig.brandStyle = .movistar
        MisticaConfig.styleControls(MisticaControlStyle.allCases)

        return true
    }
}
