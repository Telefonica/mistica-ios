//
//  CardButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct CardButton {
    public let title: String
    public let accessibilityIdentifier: String?
    public let loadingTitle: String?
    public let tapHandler: (() -> Void)?

    public init(title: String,
                loadingTitle: String?,
                accessibilityIdentifier: String?,
                tapHandler: (() -> Void)?) {
        self.title = title
        self.loadingTitle = loadingTitle
        self.accessibilityIdentifier = accessibilityIdentifier
        self.tapHandler = tapHandler
    }
}

public struct CardLinkButton {
    public let title: String
    public let accessibilityIdentifier: String?
    public let tapHandler: (() -> Void)?

    public init(title: String,
                accessibilityIdentifier: String?,
                tapHandler: (() -> Void)?) {
        self.title = title
        self.accessibilityIdentifier = accessibilityIdentifier
        self.tapHandler = tapHandler
    }
}
