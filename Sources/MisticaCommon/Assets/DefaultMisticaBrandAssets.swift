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

    public var arrowRight: UIImage {
        UIImage(named: "icn_arrow_right", type: .common)!
    }

    public var checkmarkIcon: UIImage {
        UIImage(named: "icn_checkbox_check", type: .common)!
    }

    public var eyeEnabled: UIImage {
        UIImage(named: "icn_eye_enabled", type: .common)!
    }

    public var eyeDisabled: UIImage {
        UIImage(named: "icn_eye_disabled", type: .common)!
    }

    public var arrowDown: UIImage {
        UIImage(named: "icn_dropmenu", type: .common)!
    }

    public var search: UIImage {
        UIImage(named: "icn_search", type: .common)!
    }

    public var calendar: UIImage {
        UIImage(named: "icn_calendar", type: .common)!
    }

    public var iconNotificationInfo: UIImage? {
        UIImage(named: "iconNotificationInfo", type: .branded)
    }

    public var closeButtonBlackSmallIcon: UIImage {
        UIImage(named: "icn_close_black_small", type: .common)!
    }

    public var checkAnimation: NSDataAsset? {
        NSDataAsset(named: "StepperSuccess", type: .branded)
    }

    public var successAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackSuccess", type: .branded)
    }

    public var errorAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackError", type: .branded)
    }
}
