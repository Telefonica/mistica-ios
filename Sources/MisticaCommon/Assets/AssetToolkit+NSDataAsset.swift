//
//  AssetToolkit+NSDataAsset.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie
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

public extension Optional where Wrapped == NSDataAsset {
    var lottieAnimation: LottieAnimation? {
        switch self {
        case .none:
            return nil
        case .some(let dataAsset):
            return try? JSONDecoder().decode(LottieAnimation.self, from: dataAsset.data)
        }
    }
}
