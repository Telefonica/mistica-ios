//
//  AccessibilityListCellInteractiveData.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct AccessibilityListCellInteractiveData: Sendable {
    public let label: String?
    public let action: (@Sendable () -> Void)?

    public init(label: String? = nil, action: (@Sendable () -> Void)? = nil) {
        self.label = label
        self.action = action
    }

    public static let `default`: AccessibilityListCellInteractiveData = .init()
}
