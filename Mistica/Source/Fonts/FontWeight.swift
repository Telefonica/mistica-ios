//
//  FontWeight.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

protocol FontWeightConvertible {
    var systemWeight: UIFont.Weight { get }
}

public extension FontStyle {
    enum TextPreset1Weight: String, FontWeightConvertible {
        case light
    }

    enum TextPreset2Weight: String, FontWeightConvertible {
        case light
    }

    enum TextPreset3Weight: String, FontWeightConvertible {
        case light
    }

    enum TextPreset4Weight: String, FontWeightConvertible {
        case light
    }

    enum TextPreset5Weight: String, FontWeightConvertible {
        case light, medium
    }

    enum TextPreset6Weight: String, FontWeightConvertible {
        case light, regular, medium
    }

    enum TextPreset7Weight: String, FontWeightConvertible {
        case regular, medium
    }

    enum TextPreset8Weight: String, FontWeightConvertible {
        case regular, medium
    }

    enum TextSystemWeight: String, FontWeightConvertible {
        case regular
    }
}

extension RawRepresentable where RawValue == String {
    var systemWeight: UIFont.Weight {
        switch rawValue {
        case "light":
            return .light
        case "regular":
            return .regular
        case "medium":
            return .medium
        default:
            assertionFailure("TextPreset should be an instance of light, regular or medium")
            return .light
        }
    }
}
