//
//  AccessibilityListCellInteractiveData.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct AccessibilityListCellInteractiveData {
    public let label: String?
    public let action: (() -> Void)?

    public init(label: String? = nil, action: (() -> Void)? = nil) {
        self.label = label
        self.action = action
    }

    public static var `default`: AccessibilityListCellInteractiveData = .init()
}
