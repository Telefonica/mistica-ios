//
//  DataCardAccessibilityIdentifiers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

private extension DefaultAccessibilityIdentifier.Feature {
    static let dataCard = DefaultAccessibilityIdentifier.Feature("dataCard")
}

public enum DataCardAccessibilityIdentifiers {
    public static let headline = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .tag)
    public static let title = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .title)
    public static let subtitle = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .subtitle)
    public static let description = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .description)
    public static let primaryButton = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .primaryButton)
    public static let linkButton = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .linkButton)
}
