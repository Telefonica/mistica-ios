//
//  CalloutAccessibilityIdentifiers.swift
//
//
//  Created by Celia Maria Barrera Comendador on 20/3/24.
//

import Foundation

private extension DefaultAccessibilityIdentifier.Feature {
    static let callout = DefaultAccessibilityIdentifier.Feature("callout")
}

public enum CalloutAccessibilityIdentifiers {
    public static var primaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .primaryButton)
    public static var secondaryButton = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .secondaryButton)
    public static var linkButton = DefaultAccessibilityIdentifier(feature: .callout, section: .item, elementType: .linkButton)
}
