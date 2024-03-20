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
    public static var headline = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .tag)
    public static var title = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .title)
    public static var subtitle = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .subtitle)
    public static var description = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .description)
    public static var primaryButton = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .primaryButton)
    public static var linkButton = DefaultAccessibilityIdentifier(feature: .dataCard, section: .item, elementType: .linkButton)
}
