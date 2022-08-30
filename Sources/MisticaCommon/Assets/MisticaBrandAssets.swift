//
//  MisticaBrandAssets.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public protocol MisticaBrandAssets {
    var eyeEnabled: UIImage { get }
    var eyeDisabled: UIImage { get }
    var arrowDown: UIImage { get }
    var search: UIImage { get }
    var calendar: UIImage { get }

    var arrowRight: UIImage { get }
    var closeButtonBlackSmallIcon: UIImage { get }

    var checkmarkIcon: UIImage { get }
    var iconNotificationInfo: UIImage? { get }
    var successAnimation: NSDataAsset? { get }
    var checkAnimation: NSDataAsset? { get }
    var errorAnimation: NSDataAsset? { get }
}
