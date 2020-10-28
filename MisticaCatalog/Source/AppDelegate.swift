//
//  AppDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Configure brand style before initializing the UI
        MisticaConfig.brandStyle = .movistar
        MisticaConfig.styleControls(MisticaControlStyle.allCases)

        return true
    }
}
