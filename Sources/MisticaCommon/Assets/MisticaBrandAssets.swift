//
//  MisticaBrandAssets.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public protocol MisticaBrandAssets: Sendable {
    var iconNotificationInfo: UIImage? { get }
    var successAnimation: NSDataAsset? { get }
    var checkAnimation: NSDataAsset? { get }
    var errorAnimation: NSDataAsset? { get }
}
