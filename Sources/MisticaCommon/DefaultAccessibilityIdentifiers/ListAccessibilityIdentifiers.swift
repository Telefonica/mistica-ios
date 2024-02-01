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
    public static var icon = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .icon)
    public static var tag = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .tag)
    public static var title = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .title)
    public static var subtitle = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .subtitle)
    public static var description = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .description)
    public static var slot = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .slot)
    public static var action = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .action)
    public static var chevron = DefaultAccessibilityIdentifier(feature: .list, section: .item, elementType: .chevron)
}
