//
//  MisticaColorStyle.swift
//
//
//  Created by Alejandro Ruiz on 17/4/24.
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
