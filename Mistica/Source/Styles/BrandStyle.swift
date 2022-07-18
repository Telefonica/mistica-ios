//
//  BrandStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

@frozen
public enum BrandStyle: String, CaseIterable {
    case movistar
    case vivo
    case o2
    case o2Classic
    case blau
}

extension BrandStyle {
    var usesBoldForTextPreset5AndAbove: Bool {
        switch self {
        case .movistar:
            return true
        case .vivo, .o2, .o2Classic, .blau:
            return false
        }
    }
}
