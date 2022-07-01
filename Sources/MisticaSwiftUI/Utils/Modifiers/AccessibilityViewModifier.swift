import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func accessibilityIdentifier(_ identifier: String?) -> some View {
        modifier(OptionalAccessibilityIdentifier(identifier: identifier))
    }

    func accessibilityLabel(_ label: String?) -> some View {
        modifier(OptionalAccessibilityLabel(label: label))
    }
}

@available(iOS 13.0, *)
struct OptionalAccessibilityIdentifier: ViewModifier {
    var identifier: String?

    func body(content: Content) -> some View {
        if let identifier = identifier {
            content.accessibilityIdentifier(identifier)
        } else {
            content
        }
    }
}

@available(iOS 13.0, *)
struct OptionalAccessibilityLabel: ViewModifier {
    var label: String?

    func body(content: Content) -> some View {
        if let label = label {
            content.misticaBackport.accessibilityLabel(Text(label))
        } else {
            content
        }
    }
}
