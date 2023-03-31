//
//  MisticaFontWeights.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit
import SwiftUI

public protocol MisticaFontWeights {
    var textPreset4: FontWeightTypable { get }
    var textPreset5: FontWeightTypable { get }
    var textPreset6: FontWeightTypable { get }
    var textPreset7: FontWeightTypable { get }
    var textPreset8: FontWeightTypable { get }
    var textPreset9: FontWeightTypable { get }
    var textPreset10: FontWeightTypable { get }
}

public enum FontWeightTypable {
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




