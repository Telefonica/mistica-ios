//
//  Chip.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public struct Chip: View {
    public enum Style {
        case normal
        case inverse
    }

    private enum Constants {
        // General
        static let minHeight = 32.0
        static let minWidth = 58.0
        static let verticalPadding = 6.0
        static let horizontalPadding = 8.0
        static let strokeWidth = 1.0
        // Text
        static let horizontalTextPadding = 4.0
        static let lineLimit = 1
        // Icons
        static let iconSize = 16.0
        // Right button
        static let leadingRightButtonPadding = 4.0
    }

    private let style: Style
    private let text: String
    private let icon: Image?
    @Binding private var isSelected: Bool
    private let onDismiss: (() -> Void)?

    /// Creates a `Chip` which can be selected or not, depending on
    /// tapping in the view.
    public init(
        style: Style = .normal,
        text: String,
        icon: Image? = nil,
        isSelected: Binding<Bool>
    ) {
        self.style = style
        self.text = text
        self.icon = icon
        _isSelected = isSelected
        onDismiss = nil
    }

    /// Creates a `Chip` which can be dismissed showing a close action in
    /// the right side.
    public init(
        style: Style = .normal,
        text: String,
        icon: Image? = nil,
        onDismiss: @escaping () -> Void
    ) {
        self.style = style
        self.text = text
        self.icon = icon
        _isSelected = .constant(false)
        self.onDismiss = onDismiss
    }

    public var body: some View {
        if shouldShowDismissButton {
            coreView
        } else {
            Button {
                isSelected.toggle()
            } label: {
                coreView
            }
        }
    }
}

// MARK: Private methods

private extension Chip {
    var shouldShowDismissButton: Bool { onDismiss != nil }

    @ViewBuilder
    var coreView: some View {
        HStack(spacing: 0) {
            icon?
                .resizable()
                .frame(
                    width: Constants.iconSize,
                    height: Constants.iconSize
                )
                .foregroundColor(iconColor(isSelected))
            Text(text.localizedCapitalized)
                .lineLimit(Constants.lineLimit)
                .font(.textPreset2(weight: .medium))
                .padding(.horizontal, Constants.horizontalTextPadding)
                .foregroundColor(foregroundColor(isSelected))
            trailingView
                .padding(.leading, Constants.leadingRightButtonPadding)
                .foregroundColor(iconColor(isSelected))
        }
        .padding(.vertical, Constants.verticalPadding)
        .padding(.horizontal, Constants.horizontalPadding)
        .frame(minWidth: Constants.minWidth, minHeight: Constants.minHeight)
        .background(
            Capsule()
                .strokeBorder(borderColor(isSelected), lineWidth: Constants.strokeWidth)
                .background(
                    Capsule()
                        .fill(backgroundColor(isSelected))
                )
        )
    }

    @ViewBuilder
    var trailingView: some View {
        if let onDismiss = onDismiss {
            Button(action: onDismiss) {
                Image.closeButtonBlackSmallIcon
                    .resizable()
                    .frame(
                        width: Constants.iconSize,
                        height: Constants.iconSize
                    )
            }
        } else {
            EmptyView()
        }
    }

    func backgroundColor(_ isSelected: Bool) -> Color {
        switch style {
        case .normal where isSelected:
            return .brandLow
        case .normal:
            return .backgroundContainer
        case .inverse where isSelected:
            return .backgroundContainer
        case .inverse:
            return .brandHigh
        }
    }

    func foregroundColor(_ isSelected: Bool) -> Color {
        switch style {
        case .normal where isSelected:
            return .controlActivated
        case .normal:
            return .textPrimary
        case .inverse where isSelected:
            return .textPrimary
        case .inverse:
            return .textPrimaryInverse
        }
    }

    func borderColor(_ isSelected: Bool) -> Color {
        switch style {
        case .normal where isSelected:
            return .controlActivated
        case .normal:
            return .border
        case .inverse:
            return .clear
        }
    }

    func iconColor(_ isSelected: Bool) -> Color {
        switch style {
        case .normal where isSelected:
            return .controlActivated
        case .normal:
            return .neutralMedium
        case .inverse where isSelected:
            return .neutralMedium
        case .inverse:
            return .textPrimaryInverse
        }
    }
}

// MARK: Previews

#if DEBUG
    struct Chip_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                styledPreviews(.normal)
                styledPreviews(.inverse)
                    .expandHorizontally()
                    .background(Color.backgroundBrand)
            }
        }

        private static func styledPreviews(_ style: Chip.Style) -> some View {
            let icon: Image = .search
            return VStack {
                Chip(
                    style: style,
                    text: "selected chip",
                    icon: nil,
                    isSelected: .constant(true)
                )
                Chip(
                    style: style,
                    text: "unselected chip",
                    icon: nil,
                    isSelected: .constant(false)
                )
                Chip(
                    style: style,
                    text: "selected chip",
                    icon: icon,
                    isSelected: .constant(true)
                )
                Chip(
                    style: style,
                    text: "unselected chip",
                    icon: icon,
                    isSelected: .constant(false)
                )
                Chip(
                    style: style,
                    text: "dismissible chip",
                    icon: nil,
                    onDismiss: {}
                )
                Chip(
                    style: style,
                    text: "dismissible chip",
                    icon: icon,
                    onDismiss: {}
                )
            }.padding()
        }
    }
#endif
