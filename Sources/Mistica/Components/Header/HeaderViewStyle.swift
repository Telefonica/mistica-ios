//
//  HeaderViewStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

@frozen
public enum HeaderViewStyle {
    case normal
    case inverse
}

extension HeaderViewStyle {
    var backgroundColor: UIColor {
        switch self {
        case .normal:
            return .background
        case .inverse:
            return .navigationBarBackground
        }
    }

    var primaryButton: Button.Style {
        switch self {
        case .normal:
            return .primary
        case .inverse:
            return .primaryInverse
        }
    }

    var secondaryButton: Button.Style {
        switch self {
        case .normal:
            return .secondary
        case .inverse:
            return .secondaryInverse
        }
    }

    var textPrimaryColor: UIColor {
        switch self {
        case .normal:
            return .textPrimary
        case .inverse:
            return .textPrimaryInverse
        }
    }

    var textSecondaryColor: UIColor {
        switch self {
        case .normal:
            return .textSecondary
        case .inverse:
            return .textSecondaryInverse
        }
    }
}
