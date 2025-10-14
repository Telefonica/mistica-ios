//
//  BrandStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

@frozen
public enum BrandStyle {
    case movistar
    case movistarNew
    case o2New
    case blau
    case vivoNew
    case telefonica
    case tu
    case custom(MisticaColors, MisticaBrandAssets, MisticaFontWeights, MisticaCornerRadius, MisticaFontSizes, MisticaThemeVariants)

    public var id: String {
        switch self {
        case .movistar:
            return "movistar"
        case .movistarNew:
            return "movistarNew"
        case .o2New:
            return "o2New"
        case .blau:
            return "blau"
        case .vivoNew:
            return "vivoNew"
        case .telefonica:
            return "telefonica"
        case .tu:
            return "tu"
        case .custom:
            return "custom"
        }
    }

    public var name: String {
        switch self {
        case .movistar:
            return "Movistar"
        case .movistarNew:
            return "MovistarNew"
        case .o2New:
            return "O2New"
        case .blau:
            return "Blau"
        case .vivoNew:
            return "VivoNew"
        case .telefonica:
            return "Telefonica"
        case .tu:
            return "TU"
        case .custom:
            return "Custom"
        }
    }

    public static var allCases: [BrandStyle] {
        [.movistar, .movistarNew, .o2New, .blau, .vivoNew, .telefonica, .tu]
    }
}
