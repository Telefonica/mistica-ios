//
//  CellStyle+Toolkit.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

extension ListCellContentView.CellStyle {
    var cornerRadius: CGFloat {
        switch self {
        case .fullWidth:
            return 0
        case .boxed, .boxedInverse:
            return MisticaConfig.currentCornerRadius.container
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .fullWidth, .boxedInverse:
            return 0
        case .boxed:
            return 1
        }
    }

    var borderColor: CGColor? {
        switch self {
        case .fullWidth, .boxedInverse:
            return nil
        case .boxed:
            return UIColor.border.cgColor
        }
    }

    var cellSeparatorIsHidden: Bool {
        switch self {
        case .fullWidth:
            return false
        case .boxed, .boxedInverse:
            return true
        }
    }

    var minHeight: CGFloat {
        switch self {
        case .fullWidth:
            return 72.0
        case .boxed, .boxedInverse:
            return 92.0
        }
    }

    var contentViewLayoutMargins: NSDirectionalEdgeInsets {
        switch self {
        case .fullWidth:
            return .zero
        case .boxed, .boxedInverse:
            return NSDirectionalEdgeInsets(
                top: 8,
                leading: 16,
                bottom: 8,
                trailing: 16
            )
        }
    }

    var mainStackViewLayoutMargins: NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 16
        )
    }

    var backgroundColor: UIColor {
        switch self {
        case .fullWidth:
            return .background
        case .boxed:
            return .backgroundContainer
        case .boxedInverse:
            return .backgroundContainerBrand
        }
    }

    var titleTextColor: UIColor {
        switch self {
        case .fullWidth, .boxed:
            return .textPrimary
        case .boxedInverse:
            return .textPrimaryInverse
        }
    }
    
    var subtitleTextColor: UIColor {
        switch self {
        case .fullWidth, .boxed:
            return .textPrimary
        case .boxedInverse:
            return .textPrimaryInverse
        }
    }
    
    var detailTextColor: UIColor {
        switch self {
        case .fullWidth, .boxed:
            return .textSecondary
        case .boxedInverse:
            return .textSecondaryInverse
        }
    }
}
