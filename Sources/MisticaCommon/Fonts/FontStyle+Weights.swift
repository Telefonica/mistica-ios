//
//  FontStyle+Weights.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI
import UIKit

public extension FontStyle {
    enum TextPreset1Weight {
        case regular, medium

        var value: MisticaFontWeightType {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    enum TextPreset2Weight {
        case regular, medium

        var value: MisticaFontWeightType {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    enum TextPreset3Weight {
        case light, regular, medium

        var value: MisticaFontWeightType {
            switch self {
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    enum TextPreset4Weight {
        case light, regular, medium, branded

        var value: MisticaFontWeightType {
            switch self {
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .branded: return MisticaConfig.currentFontWeights.textPreset4
            }
        }
    }
}

struct MovistarFontWeights: MisticaFontWeights {
    public var textPreset4: MisticaFontWeightType = .bold
    public var textPreset5: MisticaFontWeightType = .bold
    public var textPreset6: MisticaFontWeightType = .bold
    public var textPreset7: MisticaFontWeightType = .bold
    public var textPreset8: MisticaFontWeightType = .bold
    public var textPreset9: MisticaFontWeightType = .bold
    public var textPreset10: MisticaFontWeightType = .bold
}

struct O2FontWeights: MisticaFontWeights {
    public var textPreset4: MisticaFontWeightType = .regular
    public var textPreset5: MisticaFontWeightType = .light
    public var textPreset6: MisticaFontWeightType = .light
    public var textPreset7: MisticaFontWeightType = .light
    public var textPreset8: MisticaFontWeightType = .light
    public var textPreset9: MisticaFontWeightType = .light
    public var textPreset10: MisticaFontWeightType = .light
}

struct BlauFontWeights: MisticaFontWeights {
    public var textPreset4: MisticaFontWeightType = .regular
    public var textPreset5: MisticaFontWeightType = .light
    public var textPreset6: MisticaFontWeightType = .light
    public var textPreset7: MisticaFontWeightType = .light
    public var textPreset8: MisticaFontWeightType = .light
    public var textPreset9: MisticaFontWeightType = .light
    public var textPreset10: MisticaFontWeightType = .light
}

struct VivoFontWeights: MisticaFontWeights {
    public var textPreset4: MisticaFontWeightType = .regular
    public var textPreset5: MisticaFontWeightType = .regular
    public var textPreset6: MisticaFontWeightType = .regular
    public var textPreset7: MisticaFontWeightType = .regular
    public var textPreset8: MisticaFontWeightType = .regular
    public var textPreset9: MisticaFontWeightType = .regular
    public var textPreset10: MisticaFontWeightType = .regular
}
