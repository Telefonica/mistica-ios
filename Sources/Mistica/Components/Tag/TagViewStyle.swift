//
//  TagViewStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit
import Shared

@frozen
public enum TagViewStyle: String, CaseIterable {
    case promo,
         active,
         inactive,
         success,
         warning,
         error,
         inverse
}

extension TagViewStyle {
    var backgroundColor: UIColor {
        switch self {
        case .promo:
            return .promoLow
        case .active:
            return .brandLow
        case .inactive:
            return .neutralLow
        case .success:
            return .successLow
        case .warning:
            return .warningLow
        case .error:
            return .errorLow
        case .inverse:
            return .inverse
        }
    }

    var textColor: UIColor {
        switch self {
        case .promo:
            return .promoHigh
        case .active:
            return .brand
        case .inactive:
            return .neutralMedium
        case .success:
            return .successHigh
        case .warning:
            return .warningHigh
        case .error:
            return .errorHigh
        case .inverse:
            return .brand
        }
    }
}
