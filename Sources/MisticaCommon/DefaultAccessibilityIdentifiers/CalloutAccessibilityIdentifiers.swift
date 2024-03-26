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
    public static var title = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .title)
    public static var description = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .description)
    public static var primaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .primaryButton)
    public static var secondaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .secondaryButton)
    public static var linkButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .linkButton)
    public static var closeButton = DefaultAccessibilityIdentifier(feature: .callout, section: nil, elementType: .closeButton)
}
