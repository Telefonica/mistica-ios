//
//  AssetToolkit+UIImage.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    static var arrowRight: UIImage {
        UIImage(named: "icn_arrow_right", type: .common)!
    }

    static var chevron: UIImage {
        UIImage(named: "icn_chevron", type: .common)!
    }

    static var checkmarkIcon: UIImage {
        UIImage(named: "icn_checkbox_check", type: .common)!
    }

    static var eyeEnabled: UIImage {
        UIImage(named: "icn_eye_enabled", type: .common)!
    }

    static var eyeDisabled: UIImage {
        UIImage(named: "icn_eye_disabled", type: .common)!
    }

    static var arrowDown: UIImage {
        UIImage(named: "icn_dropmenu", type: .common)!
    }

    static var search: UIImage {
        UIImage(named: "icn_search", type: .common)!
    }

    static var calendar: UIImage {
        UIImage(named: "icn_calendar", type: .common)!
    }

    static var iconNotificationInfo: UIImage? {
        MisticaConfig.currentBrandAssets.iconNotificationInfo
    }

    static var closeButtonBlackSmallIcon: UIImage {
        UIImage(named: "icn_close_black_small", type: .common)!
    }

    static var bullet: UIImage {
        UIImage(named: "icn_bullet", type: .common)!
    }
    
    static var regularCloseButtonIcon: UIImage {
        UIImage(named: "icn_close_regular", type: .common)!
    }
}
