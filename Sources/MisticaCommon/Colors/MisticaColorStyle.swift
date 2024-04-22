//
//  MisticaColorStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public enum MisticaColorStyle {
    case color(UIColor)
    case gradient(MisticaGradient)
}

public extension MisticaColorStyle {
    static var backgroundBrand: MisticaColorStyle {
        MisticaConfig.currentColors.backgroundBrand
    }

    static var backgroundContainerBrand: MisticaColorStyle {
        MisticaConfig.currentColors.backgroundContainerBrand
    }
}
