//
//  CalloutButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct CalloutButton {
    public let title: String
    public let loadingTitle: String?
    public let tapHandler: (() -> Void)?

    public init(title: String,
                loadingTitle: String?,
                tapHandler: (() -> Void)?) {
        self.title = title
        self.loadingTitle = loadingTitle
        self.tapHandler = tapHandler
    }
}

public struct CalloutLinkButton {
    public let title: String
    public let tapHandler: (() -> Void)?

    public init(title: String,
                tapHandler: (() -> Void)?) {
        self.title = title
        self.tapHandler = tapHandler
    }
}
