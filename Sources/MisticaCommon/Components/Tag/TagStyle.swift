//
//  TagStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

@frozen
public enum TagStyle: String, CaseIterable {
    case promo,
         active,
         inactive,
         success,
         warning,
         error
}

public extension TagStyle {
    func backgroundColor(_ isInverse: Bool) -> UIColor {
        if isInverse {
            return inverseBackgroundColor
        } else {
            return defaultBackgroundColor
        }
    }

    func textColor(_ isInverse: Bool) -> UIColor {
        if isInverse {
            return inverseTextColor
        } else {
            return defaultTextColor
        }
    }
}

private extension TagStyle {
    var defaultBackgroundColor: UIColor {
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
        }
    }

    var defaultTextColor: UIColor {
        switch self {
        case .promo:
            return .tagTextPromo
        case .active:
            return .tagTextActive
        case .inactive:
            return .tagTextInactive
        case .success:
            return .tagTextSuccess
        case .warning:
            return .tagTextWarning
        case .error:
            return .tagTextError
        }
    }

    var inverseBackgroundColor: UIColor {
        switch self {
        case .promo:
            return .tagBackgroundPromoInverse
        case .active:
            return .tagBackgroundActiveInverse
        case .inactive:
            return .tagBackgroundInactiveInverse
        case .success:
            return .tagBackgroundSuccessInverse
        case .warning:
            return .tagBackgroundWarningInverse
        case .error:
            return .tagBackgroundErrorInverse
        }
    }

    var inverseTextColor: UIColor {
        switch self {
        case .promo:
            return .tagTextPromoInverse
        case .active:
            return .tagTextActiveInverse
        case .inactive:
            return .tagTextInactiveInverse
        case .success:
            return .tagTextSuccessInverse
        case .warning:
            return .tagTextWarningInverse
        case .error:
            return .tagTextErrorInverse
        }
    }
}
