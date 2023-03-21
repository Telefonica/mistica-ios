//
//  TabItem.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct TabItem: Equatable {
    public let text: String
    public let image: Image?

    public init(
        text: String,
        image: Image? = nil
    ) {
        self.text = text
        self.image = image
    }
}

public struct TabItemView: Equatable, View {
    private var tabItem: TabItem
    private var indexRow: Int
    @Binding private var selectedIndexRow: Int

    private var textAccessibilityLabel: String?
    private var textAccessibilityIdentifier: String?
    private var imageAccessibilityLabel: String?
    private var imageAccessibilityIdentifier: String?

    public init(
        tabItem: TabItem,
        indexRow: Int,
        selectedIndexRow: Binding<Int>
    ) {
        self.tabItem = tabItem
        self.indexRow = indexRow
        _selectedIndexRow = selectedIndexRow
    }

    public static func == (lhs: TabItemView, rhs: TabItemView) -> Bool {
        lhs.tabItem == rhs.tabItem && lhs.indexRow == rhs.indexRow
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            tabItem.image?
                .frame(width: 24, height: 24)
                .accessibilityIdentifier(imageAccessibilityIdentifier)
                .accessibilityLabel(imageAccessibilityLabel)
                .foregroundColor(iconForegroundColor())

            Text(tabItem.text)
                .lineLimit(1)
                .font(.textPreset2(weight: .regular))
                .foregroundColor(textForegroundColor())
                .accessibilityIdentifier(textAccessibilityIdentifier)
                .accessibilityLabel(textAccessibilityLabel)
        }
    }
}

// MARK: Modifiers

public extension TabItemView {
    private var isRowSelected: Bool {
        indexRow == selectedIndexRow
    }

    @ViewBuilder
    func iconForegroundColor() -> Color {
        isRowSelected ? Color.neutralHigh : Color.neutralMedium
    }

    @ViewBuilder
    func textForegroundColor() -> Color {
        isRowSelected ? Color.textPrimary : Color.textSecondary
    }

    func textAccessibilityLabel(_ textAccessibilityLabel: String?) -> Self {
        var tabItem = self
        tabItem.textAccessibilityLabel = textAccessibilityLabel
        return tabItem
    }

    func textAccessibilityIdentifier(_ textAccessibilityIdentifier: String?) -> Self {
        var tabItem = self
        tabItem.textAccessibilityIdentifier = textAccessibilityIdentifier
        return tabItem
    }

    func imageAccessibilityLabel(_ imageAccessibilityLabel: String?) -> Self {
        var tabItem = self
        tabItem.imageAccessibilityLabel = imageAccessibilityLabel
        return tabItem
    }

    func imageAccessibilityIdentifier(_ imageAccessibilityIdentifier: String?) -> Self {
        var tabItem = self
        tabItem.imageAccessibilityIdentifier = imageAccessibilityIdentifier
        return tabItem
    }
}
