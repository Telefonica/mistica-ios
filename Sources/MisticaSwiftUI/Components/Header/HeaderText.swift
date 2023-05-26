//
//  HeaderText.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

public struct HeaderText {
    let text: String
    let lineLimit: Int
    let accessibilityLabel: String?
    let accessibilityIdentifier: String?

    public init(
        text: String,
        lineLimit: Int = 0,
        accessibilityLabel: String? = nil,
        accessibilityIdentifier: String? = nil
    ) {
        self.text = text
        self.lineLimit = lineLimit
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityIdentifier = accessibilityIdentifier
    }
}
