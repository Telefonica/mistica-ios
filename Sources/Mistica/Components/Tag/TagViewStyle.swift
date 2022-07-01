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
            return .tagBackgroundPromo
        case .active:
            return .tagBackgroundActive
        case .inactive:
            return .tagBackgroundInactive
        case .success:
            return .tagBackgroundSuccess
        case .warning:
            return .tagBackgroundWarning
        case .error:
            return .tagBackgroundError
        case .inverse:
            return .inverse
        }
    }

    var textColor: UIColor {
        switch self {
        case .promo:
            return .textTagPromo
        case .active:
            return .textTagActive
        case .inactive:
            return .textTagInactive
        case .success:
            return .textTagSuccess
        case .warning:
            return .textTagWarning
        case .error:
            return .textTagError
        case .inverse:
            return .textTagActive
        }
    }
}
