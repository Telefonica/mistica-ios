//
//  TabItem.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct TabItem: View, Equatable {
    private let text: String
    private let image: Image?

    private var textAccessibilityLabel: String?
    private var textAccessibilityIdentifier: String?
    private var imageAccessibilityLabel: String?
    private var imageAccessibilityIdentifier: String?

    public init(
        text: String,
        image: Image? = nil
    ) {
        self.text = text
        self.image = image
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            image?
                .frame(width: 24, height: 24)
                .accessibilityIdentifier(imageAccessibilityIdentifier)
                .accessibilityLabel(imageAccessibilityLabel)

            Text(text)
                .lineLimit(1)
                .font(.textPreset2(weight: .regular))
                .foregroundColor(Color.textSecondary)
                .accessibilityIdentifier(textAccessibilityIdentifier)
                .accessibilityLabel(textAccessibilityLabel)
        }
    }
}

// MARK: Modifiers

public extension TabItem {
    func textAccessibilityLabel(_ textAccessibilityLabel: String?) -> TabItem {
        var tabItem = self
        tabItem.textAccessibilityLabel = textAccessibilityLabel
        return tabItem
    }

    func textAccessibilityIdentifier(_ textAccessibilityIdentifier: String?) -> TabItem {
        var tabItem = self
        tabItem.textAccessibilityIdentifier = textAccessibilityIdentifier
        return tabItem
    }

    func imageAccessibilityLabel(_ imageAccessibilityLabel: String?) -> TabItem {
        var tabItem = self
        tabItem.imageAccessibilityLabel = imageAccessibilityLabel
        return tabItem
    }

    func imageAccessibilityIdentifier(_ imageAccessibilityIdentifier: String?) -> TabItem {
        var tabItem = self
        tabItem.imageAccessibilityIdentifier = imageAccessibilityIdentifier
        return tabItem
    }
}
