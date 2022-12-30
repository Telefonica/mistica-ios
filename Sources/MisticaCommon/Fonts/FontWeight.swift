//
//  FontWeight.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI
import UIKit

protocol FontWeightConvertible: CaseIterable {
    var systemWeight: Font.Weight { get }
    var systemUIFontWeight: UIFont.Weight { get }
}

public protocol FontWeightBrandable: CaseIterable {
    static var light: Self { get }
    static var bold: Self { get }
}

public extension FontWeightBrandable {
    static var `default`: Self {
        if MisticaConfig.brandStyle.usesBoldForTextPreset5AndAbove {
            return .bold
        } else {
            return .light
        }
    }
}

public extension FontStyle {
    enum TextPreset1Weight: String, FontWeightConvertible {
        case regular, medium
    }

    enum TextPreset2Weight: String, FontWeightConvertible {
        case regular, medium
    }

    enum TextPreset3Weight: String, FontWeightConvertible {
        case light, regular, medium
    }

    enum TextPreset4Weight: String, FontWeightConvertible {
        case light, regular, medium
    }

    enum TextPreset5Weight: String, FontWeightConvertible, FontWeightBrandable {
        case light, bold
    }

    enum TextPreset6Weight: String, FontWeightConvertible, FontWeightBrandable {
        case light, bold
    }

    enum TextPreset7Weight: String, FontWeightConvertible, FontWeightBrandable {
        case light, bold
    }

    enum TextPreset8Weight: String, FontWeightConvertible, FontWeightBrandable {
        case light, bold
    }

    enum TextPreset9Weight: String, FontWeightConvertible, FontWeightBrandable {
        case light, bold
    }

    enum TextPreset10Weight: String, FontWeightConvertible, FontWeightBrandable {
        case light, bold
    }
}

extension RawRepresentable where RawValue == String {
    var systemWeight: Font.Weight {
        switch rawValue {
        case "light":
            return .light
        case "regular":
            return .regular
        case "medium":
            return .medium
        case "bold":
            return .bold
        default:
            assertionFailure("TextPreset should be an instance of light, regular or medium")
            return .light
        }
    }

    var systemUIFontWeight: UIFont.Weight {
        switch rawValue {
        case "light":
            return .light
        case "regular":
            return .regular
        case "medium":
            return .medium
        case "bold":
            return .bold
        default:
            assertionFailure("TextPreset should be an instance of light, regular or medium")
            return .light
        }
    }
}
