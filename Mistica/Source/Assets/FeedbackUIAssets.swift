//
//  FeedbackUIAssets.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static var iconNotificationInfo: UIImage? {
        UIImage(named: "icnNotificationInfo", type: .brandedAndThemed)
    }
}

extension NSDataAsset {
    static var successAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackSuccess", type: .branded)
    }

    static var errorAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackError", type: .branded)
    }
}
