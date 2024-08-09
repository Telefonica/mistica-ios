//
//  FullCellAccessibilityConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct FullCellAccessibilityConfig {
    public var accessibilityLabel: String
    public let activationAction: (() -> Void)?

    public init(accessibilityLabel: String, activationAction: (() -> Void)? = nil) {
        self.accessibilityLabel = accessibilityLabel
        self.activationAction = activationAction
    }
}
