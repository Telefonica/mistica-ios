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
        AppCenter.start(withAppSecret: appSecret, services: [Distribute.self])
        
        // Configure brand style before initializing the UI
        MisticaConfig.brandStyle = .movistar
        MisticaConfig.styleControls(MisticaControlStyle.allCases)

        return true
    }
}

// MARK: Private

private extension AppDelegate {
    var appSecret: String {
        guard let object = Bundle.main.object(forInfoDictionaryKey: "APPCENTER_APP_SECRET") else {
            fatalError("Missing key APPCENTER_APP_SECRET in Info.plist")
        }
        guard let string = object as? String else {
            fatalError("Value of key APPCENTER_APP_SECRET cannot be casted to String")
        }
        
        return string
    }
}
