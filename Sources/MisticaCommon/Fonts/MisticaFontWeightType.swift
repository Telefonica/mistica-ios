//
//  MisticaFontWeightType.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

/// Available font weights in Mistica
public enum MisticaFontWeightType {
    case light
    case regular
    case medium
    case bold

    var systemWeight: Font.Weight {
        switch self {
        case .light:
            return .light
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .bold:
            return .bold
        }
    }

    var systemUIFontWeight: UIFont.Weight {
        switch self {
        case .light:
            return .light
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .bold:
            return .bold
        }
    }
}
