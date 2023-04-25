//
//  MisticaFontWeights.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI
import UIKit

public protocol MisticaFontWeights {
    var cardTitlePreset: MisticaFontWeightType { get }
    var textPreset5: MisticaFontWeightType { get }
    var textPreset6: MisticaFontWeightType { get }
    var textPreset7: MisticaFontWeightType { get }
    var textPreset8: MisticaFontWeightType { get }
    var textPreset9: MisticaFontWeightType { get }
    var textPreset10: MisticaFontWeightType { get }
}

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
