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
    public static var icon = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .icon)
    public static var title = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .title)
    public static var description = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .description)
    public static var primaryButton = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .primaryButton)
    public static var secondaryButton = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .secondaryButton)
    public static var linkButton = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .linkButton)
    public static var slot = DefaultAccessibilityIdentifier(feature: .feedback, section: .item, elementType: .slot)
}
