//
//  ListAccessibilityIdentifiers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

private extension DefaultAccessibilityIdentifier.Feature {
    static let list = DefaultAccessibilityIdentifier.Feature("list")
}

public enum ListAccessibilityIdentifiers {
    public static let icon = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .icon)
    public static let tag = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .tag)
    public static let title = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .title)
    public static let subtitle = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .subtitle)
    public static let description = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .description)
    public static let slot = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .slot)
    public static let action = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .action)
    public static let chevron = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .chevron)
}
