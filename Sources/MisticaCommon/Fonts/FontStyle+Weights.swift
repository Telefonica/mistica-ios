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
        
        var value: FontWeightTypable {
            switch self {
                case .regular: return .regular
                case .medium: return .medium
            }
        }
    }

    enum TextPreset2Weight {
        case regular, medium
        
        var value: FontWeightTypable {
            switch self {
                case .regular: return .regular
                case .medium: return .medium
            }
        }
    }

    enum TextPreset3Weight {
        case light, regular, medium
        
        var value: FontWeightTypable {
            switch self {
                case .light: return .light
                case .regular: return .regular
                case .medium: return .medium
            }
        }
    }

    enum TextPreset4Weight {
        case light, regular, medium, branded

        var value: FontWeightTypable {
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
    public var textPreset4: FontWeightTypable = .bold
    public var textPreset5: FontWeightTypable = .bold
    public var textPreset6: FontWeightTypable = .bold
    public var textPreset7: FontWeightTypable = .bold
    public var textPreset8: FontWeightTypable = .bold
    public var textPreset9: FontWeightTypable = .bold
    public var textPreset10: FontWeightTypable = .bold
}

struct O2FontWeights: MisticaFontWeights {
    public var textPreset4: FontWeightTypable = .regular
    public var textPreset5: FontWeightTypable = .light
    public var textPreset6: FontWeightTypable = .light
    public var textPreset7: FontWeightTypable = .light
    public var textPreset8: FontWeightTypable = .light
    public var textPreset9: FontWeightTypable = .light
    public var textPreset10: FontWeightTypable = .light
}

struct BlauFontWeights: MisticaFontWeights {
    public var textPreset4: FontWeightTypable = .regular
    public var textPreset5: FontWeightTypable = .light
    public var textPreset6: FontWeightTypable = .light
    public var textPreset7: FontWeightTypable = .light
    public var textPreset8: FontWeightTypable = .light
    public var textPreset9: FontWeightTypable = .light
    public var textPreset10: FontWeightTypable = .light
}

struct VivoFontWeights: MisticaFontWeights {
    public var textPreset4: FontWeightTypable = .regular
    public var textPreset5: FontWeightTypable = .regular
    public var textPreset6: FontWeightTypable = .regular
    public var textPreset7: FontWeightTypable = .regular
    public var textPreset8: FontWeightTypable = .regular
    public var textPreset9: FontWeightTypable = .regular
    public var textPreset10: FontWeightTypable = .regular
}

