//
//  AssetToolkit+Image.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public extension Image {
    static var arrowRight: Image {
        Image(uiImage: .arrowRight)
    }

    static var chevron: Image {
        Image(uiImage: .chevron)
    }

    static var checkmarkIcon: Image {
        Image(uiImage: .checkmarkIcon)
    }

    static var eyeEnabled: Image {
        Image(uiImage: .eyeEnabled)
    }

    static var eyeDisabled: Image {
        Image(uiImage: .eyeDisabled)
    }

    static var arrowDown: Image {
        Image(uiImage: .arrowDown)
    }

    static var search: Image {
        Image(uiImage: .search)
    }

    static var calendar: Image {
        Image(uiImage: .calendar)
    }

    static var iconNotificationInfo: Image? {
        MisticaConfig.currentBrandAssets.iconNotificationInfo.map(Image.init(uiImage:))
    }

    static var closeButtonBlackSmallIcon: Image {
        Image(uiImage: .closeButtonBlackSmallIcon)
    }
}
