//
//  EmptyStateButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct EmptyStateButton: Sendable {
    public let title: String
    public let loadingTitle: String?
    public let tapHandler: (@Sendable () -> Void)?

    public init(title: String,
                loadingTitle: String?,
                tapHandler: (@Sendable () -> Void)?) {
        self.title = title
        self.loadingTitle = loadingTitle
        self.tapHandler = tapHandler
    }
}

public struct EmptyStateLinkButton: Sendable {
    public let title: String
    public let tapHandler: (@Sendable () -> Void)?

    public init(title: String,
                tapHandler: (@Sendable () -> Void)?) {
        self.title = title
        self.tapHandler = tapHandler
    }
}
