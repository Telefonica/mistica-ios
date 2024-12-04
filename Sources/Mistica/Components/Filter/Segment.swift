//
//  Segment.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct Segment: Equatable, Sendable {
    public let id: String
    public let title: String
    public let accessibilityIdentifier: String?

    public init(id: String, title: String, accessibilityIdentifier: String? = nil) {
        self.id = id
        self.title = title
        self.accessibilityIdentifier = accessibilityIdentifier
    }

    public static func == (lhs: Segment, rhs: Segment) -> Bool {
        lhs.id == rhs.id
    }
}
