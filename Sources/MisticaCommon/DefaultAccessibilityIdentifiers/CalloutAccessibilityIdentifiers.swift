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
    public static let title = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .title)
    public static let description = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .description)
    public static let primaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .primaryButton)
    public static let secondaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .secondaryButton)
    public static let linkButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .linkButton)
    public static let closeButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .closeButton)
}
