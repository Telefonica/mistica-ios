//
//  AssetToolkit+NSDataAsset.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public extension NSDataAsset {
    static var checkAnimation: NSDataAsset? {
        MisticaConfig.currentBrandAssets.checkAnimation
    }

    static var successAnimation: NSDataAsset? {
        MisticaConfig.currentBrandAssets.successAnimation
    }

    static var errorAnimation: NSDataAsset? {
        MisticaConfig.currentBrandAssets.errorAnimation
    }
}
