
// Generated using Make
// DO NOT EDIT

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
    static var cardContentOverlay: MisticaColor {
        MisticaConfig.currentColors.cardContentOverlay
    }
}
