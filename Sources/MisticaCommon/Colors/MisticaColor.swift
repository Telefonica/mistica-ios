//
//  MisticaColor.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public enum MisticaColor {
    case solid(UIColor)
    case gradient(MisticaGradient)
}

public extension MisticaColor {
    static var backgroundBrand: MisticaColor {
        MisticaConfig.currentColors.backgroundBrand
    }

    static var backgroundContainerBrand: MisticaColor {
        MisticaConfig.currentColors.backgroundContainerBrand
    }
}
