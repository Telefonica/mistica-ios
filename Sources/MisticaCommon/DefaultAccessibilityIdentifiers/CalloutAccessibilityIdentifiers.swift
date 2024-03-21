//
//  CalloutAccessibilityIdentifiers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

private extension DefaultAccessibilityIdentifier.Feature {
    static let callout = DefaultAccessibilityIdentifier.Feature("callout")
}

public enum CalloutAccessibilityIdentifiers {
    public static var title = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .title)
    public static var description = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .description)
    public static var primaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .primaryButton)
    public static var secondaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .secondaryButton)
    public static var linkButton = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .linkButton)
}
