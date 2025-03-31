//
//  AppDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import MisticaCommon
import MisticaSwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Configure brand style before initializing the UI
        MisticaConfig.brandStyle = .movistar
        MisticaConfig.styleControls(MisticaControlStyle.allCases)

        return true
    }
}
