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
    case vivo
    case o2
    case blau
    case vivoNew
    case custom(MisticaColors, MisticaBrandAssets, MisticaFontWeights, MisticaCornerRadius, MisticaFontSizes)

    public var id: String {
        switch self {
        case .movistar:
            return "movistar"
        case .vivo:
            return "vivo"
        case .o2:
            return "o2"
        case .blau:
            return "blau"
        case .vivoNew:
            return "vivoNew"
        case .custom:
            return "custom"
        }
    }

    public var name: String {
        switch self {
        case .movistar:
            return "Movistar"
        case .vivo:
            return "Vivo"
        case .o2:
            return "O2"
        case .blau:
            return "Blau"
        case .vivoNew:
            return "VivoNew"
        case .custom:
            return "Custom"
        }
    }

    public static var allCases: [BrandStyle] {
        [.movistar, .vivo, .o2, .blau, .vivoNew]
    }
}
