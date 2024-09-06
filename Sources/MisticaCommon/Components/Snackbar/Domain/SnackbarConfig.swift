//
//  SnackbarConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct SnackbarAction {
    public let title: String
    public let accessibilityTitleLabel: String?
    public let handler: () -> Void

    public init(title: String, accessibilityTitleLabel: String? = nil, handler: @escaping () -> Void) {
        self.title = title
        self.handler = handler
        self.accessibilityTitleLabel = accessibilityTitleLabel
    }
}

public enum SnackbarDismissInterval: Equatable {
    case fiveSeconds
    case tenSeconds(SnackbarAction)
    case infinite(SnackbarAction?)

    public var timeInterval: TimeInterval? {
        switch self {
        case .fiveSeconds:
            return 5
        case .tenSeconds:
            return 10
        case .infinite:
            return nil
        }
    }

    public var action: SnackbarAction? {
        switch self {
        case .fiveSeconds:
            return nil
        case .tenSeconds(let action):
            return action
        case .infinite(let action):
            return action
        }
    }

    public var isInfinity: Bool {
        switch self {
        case .fiveSeconds, .tenSeconds:
            return false
        case .infinite:
            return true
        }
    }

    public static func == (lhs: SnackbarDismissInterval, rhs: SnackbarDismissInterval) -> Bool {
        switch (lhs, rhs) {
        case (.fiveSeconds, .fiveSeconds):
            return true
        case (.tenSeconds(_), .tenSeconds(_)):
            return true
        case (.infinite(_), .infinite(_)):
            return true
        default:
            return false
        }
    }
}

public struct SnackbarConfig {
    public let title: String
    public let titleAccessibilityLabel: String?
    public let titleAccessibilityIdentifier: String?
    public let dismissInterval: SnackbarDismissInterval
    public let forceDismiss: Bool

    public init(title: String,
                titleAccessibilityLabel: String? = nil,
                titleAccessibilityIdentifier: String? = nil,
                dismissInterval: SnackbarDismissInterval,
                forceDismiss: Bool = false) {
        self.title = title
        self.titleAccessibilityLabel = titleAccessibilityLabel
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        self.dismissInterval = dismissInterval
        self.forceDismiss = forceDismiss
    }
}
