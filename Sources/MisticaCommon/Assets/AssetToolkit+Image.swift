//
//  AssetToolkit+Image.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension Image {
    static var arrowRight: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.arrowRight)
    }

    static var checkmarkIcon: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.checkmarkIcon)
    }

    static var eyeEnabled: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.eyeEnabled)
    }

    static var eyeDisabled: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.eyeDisabled)
    }

    static var arrowDown: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.arrowDown)
    }

    static var search: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.search)
    }

    static var calendar: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.calendar)
    }

    static var iconNotificationInfo: Image? {
        MisticaConfig.currentBrandAssets.iconNotificationInfo.map(Image.init(uiImage:))
    }

    static var closeButtonBlackSmallIcon: Image {
        Image(uiImage: MisticaConfig.currentBrandAssets.closeButtonBlackSmallIcon)
    }
}
