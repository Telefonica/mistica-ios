//
//  CardAction.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation

public struct CardAction {
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
