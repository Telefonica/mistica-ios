//
//  DefaultAccessibilityIdentifiers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public struct DefaultAccessibilityIdentifier {
    public struct Feature {
        let description: String
        public init(_ description: String) {
            self.description = description
        }
    }

    public struct Section {
        let description: String
        public init(_ description: String) {
            self.description = description
        }
    }

    public struct ElementType {
        let description: String
        public init(_ description: String) {
            self.description = description
        }
    }

    let feature: String
    let section: String?
    let elementType: String

    public init(
        feature: DefaultAccessibilityIdentifier.Feature,
        section: DefaultAccessibilityIdentifier.Section?,
        elementType: DefaultAccessibilityIdentifier.ElementType
    ) {
        self.feature = feature.description
        self.section = section?.description
        self.elementType = elementType.description
    }

    public var rawValue: String {
        [feature, section, elementType]
            .compactMap { $0 }
            .joined(separator: "_")
    }
}

public extension DefaultAccessibilityIdentifier.Section {
    static let item = DefaultAccessibilityIdentifier.Section("item")
}

public extension DefaultAccessibilityIdentifier.ElementType {
    static let chevron = DefaultAccessibilityIdentifier.ElementType("chevron")
    static let icon = DefaultAccessibilityIdentifier.ElementType("icon")
    static let title = DefaultAccessibilityIdentifier.ElementType("title")
    static let subtitle = DefaultAccessibilityIdentifier.ElementType("subtitle")
    static let errorLabel = DefaultAccessibilityIdentifier.ElementType("error_reference")
    static let primaryButton = DefaultAccessibilityIdentifier.ElementType("primary_button")
    static let secondaryButton = DefaultAccessibilityIdentifier.ElementType("secondary_button")
    static let linkButton = DefaultAccessibilityIdentifier.ElementType("link_button")
    static let closeButton = DefaultAccessibilityIdentifier.ElementType("close_button")
    static let slot = DefaultAccessibilityIdentifier.ElementType("slot")
    static let description = DefaultAccessibilityIdentifier.ElementType("description")
    static let tag = DefaultAccessibilityIdentifier.ElementType("tag")
    static let action = DefaultAccessibilityIdentifier.ElementType("action")
}
