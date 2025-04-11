//
//  FeedbackAccessibilityIdentifiers.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

private extension DefaultAccessibilityIdentifier.Feature {
    static let feedback = DefaultAccessibilityIdentifier.Feature("feedback")
}

public enum FeedbackAccessibilityIdentifiers {
    public static let icon = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .icon)
    public static let title = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .title)
    public static let description = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .description)
    public static let primaryButton = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .primaryButton)
    public static let secondaryButton = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .secondaryButton)
    public static let linkButton = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .linkButton)
    public static let slot = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .slot)
}
