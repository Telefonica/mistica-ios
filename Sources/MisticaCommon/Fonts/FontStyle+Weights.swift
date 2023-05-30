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
    enum TextPreset1Weight: CaseIterable {
        case regular, medium

        var value: MisticaFontWeightType {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    enum TextPreset2Weight: CaseIterable {
        case regular, medium

        var value: MisticaFontWeightType {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    enum TextPreset3Weight: CaseIterable {
        case light, regular, medium

        var value: MisticaFontWeightType {
            switch self {
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            }
        }
    }

    enum TextPreset4Weight: CaseIterable {
        case light, regular, medium, cardTitle

        var value: MisticaFontWeightType {
            switch self {
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .cardTitle: return MisticaConfig.currentFontWeights.cardTitle
            }
        }
    }
}
