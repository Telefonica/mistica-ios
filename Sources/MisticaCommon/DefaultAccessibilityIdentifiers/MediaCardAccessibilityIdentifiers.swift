//
//  MediaCardAccessibilityIdentifiers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

private extension DefaultAccessibilityIdentifier.Feature {
    static let card = DefaultAccessibilityIdentifier.Feature("card")
}

public enum MediaCardAccessibilityIdentifiers {
    public static let richMedia = DefaultAccessibilityIdentifier(feature: .card, section: .item, elementType: .reachMedia)
    public static let headline = DefaultAccessibilityIdentifier(feature: .card, section: .item, elementType: .tag)
    public static let title = DefaultAccessibilityIdentifier(feature: .card, section: .item, elementType: .title)
    public static let pretitle = DefaultAccessibilityIdentifier(feature: .card, section: .item, elementType: .pretitle)
    public static let description = DefaultAccessibilityIdentifier(feature: .card, section: .item, elementType: .description)
    public static let primaryButton = DefaultAccessibilityIdentifier(feature: .card, section: .item, elementType: .primaryButton)
    public static let linkButton = DefaultAccessibilityIdentifier(feature: .card, section: .item, elementType: .linkButton)
}
