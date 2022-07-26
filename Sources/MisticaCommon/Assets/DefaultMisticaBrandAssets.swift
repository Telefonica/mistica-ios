//
//  DefaultMisticaBrandAssets.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

struct DefaultMisticaBrandAssets: MisticaBrandAssets {
    var arrowRight: UIImage {
        UIImage(named: "icn_arrow_right", type: .common)!
    }

    var checkmarkIcon: UIImage {
        UIImage(named: "icn_checkbox_check", type: .common)!
    }

    var eyeEnabled: UIImage {
        UIImage(named: "icn_eye_enabled", type: .common)!
    }

    var eyeDisabled: UIImage {
        UIImage(named: "icn_eye_disabled", type: .common)!
    }

    var arrowDown: UIImage {
        UIImage(named: "icn_dropmenu", type: .common)!
    }

    var search: UIImage {
        UIImage(named: "icn_search", type: .common)!
    }

    var calendar: UIImage {
        UIImage(named: "icn_calendar", type: .common)!
    }

    var iconNotificationInfo: UIImage? {
        UIImage(named: "iconNotificationInfo", type: .branded)
    }

    var closeButtonBlackSmallIcon: UIImage {
        UIImage(named: "icn_close_black_small", type: .common)!
    }

    var checkAnimation: NSDataAsset? {
        NSDataAsset(named: "StepperSuccess", type: .branded)
    }

    var successAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackSuccess", type: .branded)
    }

    var errorAnimation: NSDataAsset? {
        NSDataAsset(named: "FeedbackError", type: .branded)
    }
}
