//
//  CardButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct CardButton: Sendable {
    public let title: String
    public let accessibilityIdentifier: String?
    public let loadingTitle: String?
    public let tapHandler: (@Sendable() -> Void)?

    public init(title: String,
                loadingTitle: String?,
                accessibilityIdentifier: String? = nil,
                tapHandler: (@Sendable() -> Void)?) {
        self.title = title
        self.loadingTitle = loadingTitle
        self.accessibilityIdentifier = accessibilityIdentifier ?? MediaCardAccessibilityIdentifiers.primaryButton
        self.tapHandler = tapHandler
    }
}

public struct CardLinkButton: Sendable {
    public let title: String
    public let accessibilityIdentifier: String?
    public let tapHandler: (@Sendable() -> Void)?

    public init(title: String,
                accessibilityIdentifier: String? = nil,
                tapHandler: (@Sendable() -> Void)?) {
        self.title = title
        self.accessibilityIdentifier = accessibilityIdentifier ?? MediaCardAccessibilityIdentifiers.linkButton
        self.tapHandler = tapHandler
    }
}
