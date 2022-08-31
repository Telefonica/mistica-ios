//
//  DefaultMisticaBrandAssets.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public struct DefaultMisticaBrandAssets: MisticaBrandAssets {
    public init() {
        // Do nothing
    }

    public var iconNotificationInfo: UIImage? {
        UIImage(named: "icnNotificationInfo", type: .branded)!.withRenderingMode(.alwaysTemplate)
    }

    public var checkAnimation: NSDataAsset? {
        NSDataAsset(named: "StepperSuccess", type: .branded)!
    }

    public var successAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackSuccess", type: .branded)!
    }

    public var errorAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackError", type: .branded)!
    }
}
