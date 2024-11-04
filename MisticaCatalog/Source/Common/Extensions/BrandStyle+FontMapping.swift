//
//  BrandStyle+FontMapping.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SwiftUI
import UIKit

extension BrandStyle {
    // A computed property that returns the corresponding FontMapping for the brand style.
    var fontMapping: FontMapping? {
        switch self {
        case .vivoNew:
            return FontMapping(
                lightFont: "VivoTypeLight",
                mediumFont: "VivoTypeMedium",
                boldFont: "VivoTypeBold",
                defaultFont: "VivoTypeRegular"
            )
        case .o2, .o2New, .movistar:
            return FontMapping(
                lightFont: "OnAir-Light",
                mediumFont: "OnAir",
                boldFont: "OnAir-Bold",
                defaultFont: "OnAir-Regular"
            )

        case .telefonica, .tu:
            return FontMapping(
                lightFont: "TeleSans-Light",
                mediumFont: "TeleSans-DemiBold",
                boldFont: "TeleSans-DemiBold",
                defaultFont: "TeleSans-Regular"
            )
        case .vivo, .blau, .custom:
            return nil
        }
    }
}

// A struct representing a mapping of font names to different font weights.
struct FontMapping {
    let lightFont: String
    let mediumFont: String
    let boldFont: String
    let defaultFont: String

    /// Returns the font name for the specified weight.
    ///
    /// Parameter weight: The `Font.Weight` for which to get the font name.
    /// Returns: The font name corresponding to the given weight.
    func fontName(for weight: Font.Weight) -> String {
        switch weight {
        case .light, .ultraLight, .thin:
            return lightFont
        case .medium:
            return mediumFont
        case .bold, .semibold, .black, .heavy:
            return boldFont
        default:
            return defaultFont
        }
    }

    /// Returns the font name for the specified weight.
    ///
    /// Parameter weight: The `UIFont.Weight` for which to get the font name.
    /// Returns: The font name corresponding to the given weight.
    func UIfontName(for weight: UIFont.Weight) -> String {
        switch weight {
        case .light, .ultraLight, .thin:
            return lightFont
        case .medium:
            return mediumFont
        case .bold, .semibold, .black, .heavy:
            return boldFont
        default:
            return defaultFont
        }
    }
}
