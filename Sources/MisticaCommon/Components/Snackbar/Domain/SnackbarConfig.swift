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
    public let handler: () -> Void

    public init(title: String, handler: @escaping () -> Void) {
        self.title = title
        self.handler = handler
    }
}

public enum SnackbarDismissInterval {
    case fiveSeconds
    case tenSeconds(SnackbarAction)
    case infinity(SnackbarAction)
    case infinityWithClose(SnackbarAction?)

    public var timeInterval: TimeInterval? {
        switch self {
        case .fiveSeconds:
            return 5
        case .tenSeconds:
            return 10
        case .infinity(_), .infinityWithClose:
            return nil
        }
    }

    public var action: SnackbarAction? {
        switch self {
        case .fiveSeconds:
            return nil
        case .tenSeconds(let action):
            return action
        case .infinity(let action):
            return action
        case .infinityWithClose(let action):
            return action
        }
    }

    public var isInfinity: Bool {
        switch self {
        case .fiveSeconds, .tenSeconds:
            return false
        case .infinity(_), .infinityWithClose:
            return true
        }
    }
}

public struct SnackbarConfig {
    public let title: String
    public let dismissInterval: SnackbarDismissInterval

    public init(title: String, dismissInterval: SnackbarDismissInterval) {
        self.title = title
        self.dismissInterval = dismissInterval
    }
}
