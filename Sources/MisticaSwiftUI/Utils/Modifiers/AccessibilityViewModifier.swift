//
//  AccessibilityViewModifier.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
    func accessibilityIdentifier(_ identifier: String?) -> some View {
        modifier(OptionalAccessibilityIdentifier(identifier: identifier))
    }

    func accessibilityLabel(_ label: String?) -> some View {
        modifier(OptionalAccessibilityLabel(label: label))
    }
}

struct OptionalAccessibilityIdentifier: ViewModifier {
    var identifier: String?

    func body(content: Content) -> some View {
        if let identifier = identifier {
            content.misticaBackport.accessibilityIdentifier(identifier)
        } else {
            content
        }
    }
}

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
