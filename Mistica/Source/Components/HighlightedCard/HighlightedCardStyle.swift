//
//  HighlightedCardStyle.swift
//  Mistica
//
//  Created by Jose Maria Puerta on 18/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

public enum HighlightedCardStyle {
    case normal
    case inverse
}

extension HighlightedCardStyle {
    var backgroundColor: UIColor {
        switch self {
        case .normal:
            return .background
        case .inverse:
            return .navigationBarBackground
        }
    }

    var primaryButtonStyle: Button.Style {
        switch self {
        case .normal:
            return .primary
        case .inverse:
            return .primaryInverse
        }
    }

    var secondaryButtonStyle: Button.Style {
        switch self {
        case .normal:
            return .secondary
        case .inverse:
            return .secondaryInverse
        }
    }

    var linkButtonStyle: Button.Style {
        switch self {
        case .normal:
            return .link
        case .inverse:
            return .linkInverse
        }
    }

    var titleColor: UIColor {
        switch self {
        case .normal:
            return .textPrimary
        case .inverse:
            return .textPrimaryInverse
        }
    }

    var subtitleColor: UIColor {
        switch self {
        case .normal:
            return .textSecondary
        case .inverse:
            return .textPrimaryInverse
        }
    }
}
