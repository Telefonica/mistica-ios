//
//  Segment.swift
//  Mistica
//
//  Created by cestebanez on 29/10/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public struct Segment: Equatable {
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
