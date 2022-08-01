//
//  AssetToolkit+NSDataAsset.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit
import Lottie

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

public extension Optional where Wrapped == NSDataAsset {
    var lottieAnimation: Lottie.Animation? {
        switch self {
        case .none:
            return nil
        case .some(let dataAsset):
            return try? JSONDecoder().decode(Lottie.Animation.self, from: dataAsset.data)
        }
    }
}
