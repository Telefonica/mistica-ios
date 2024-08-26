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
        case regular, medium, cardTitle, title1, indicator

        var value: MisticaFontWeightType {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            case .cardTitle: return MisticaConfig.currentFontWeights.cardTitle
            case .title1: return MisticaConfig.currentFontWeights.title1
            case .indicator: return MisticaConfig.currentFontWeights.indicator
            }
        }
    }

    enum TextPreset2Weight: CaseIterable {
        case regular, medium, button, indicator, link, tabsLabel

        var value: MisticaFontWeightType {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            case .button: return MisticaConfig.currentFontWeights.button
            case .indicator: return MisticaConfig.currentFontWeights.indicator
            case .link: return MisticaConfig.currentFontWeights.link
            case .tabsLabel: return MisticaConfig.currentFontWeights.tabsLabel
            }
        }
    }

    enum TextPreset3Weight: CaseIterable {
        case light, regular, medium, button, link, title2, title3

        var value: MisticaFontWeightType {
            switch self {
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .button: return MisticaConfig.currentFontWeights.button
            case .link: return MisticaConfig.currentFontWeights.link
            case .title2: return MisticaConfig.currentFontWeights.title2
            case .title3: return MisticaConfig.currentFontWeights.title3
            }
        }
    }

    enum TextPreset4Weight: CaseIterable {
        case light, regular, medium, cardTitle, navigationBar

        var value: MisticaFontWeightType {
            switch self {
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .cardTitle: return MisticaConfig.currentFontWeights.cardTitle
            case .navigationBar: return MisticaConfig.currentFontWeights.navigationBar
            }
        }
    }
}
