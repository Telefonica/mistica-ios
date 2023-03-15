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
    case o2Classic
    case blau
    case custom(MisticaColors, MisticaBrandAssets)

    public var id: String {
        switch self {
        case .movistar:
            return "movistar"
        case .vivo:
            return "vivo"
        case .o2:
            return "o2"
        case .o2Classic:
            return "o2Classic"
        case .blau:
            return "blau"
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
        case .o2Classic:
            return "O2 Classic"
        case .blau:
            return "Blau"
        case .custom:
            return "Custom"
        }
    }

    public static var allCases: [BrandStyle] {
        [.movistar, .vivo, .o2, .o2Classic, .blau]
    }

    public var isMovistarBrand: Bool {
        switch self {
        case .movistar:
            return true
        case .vivo,
             .o2,
             .o2Classic,
             .blau,
             .custom:
            return false
        }
    }
}
