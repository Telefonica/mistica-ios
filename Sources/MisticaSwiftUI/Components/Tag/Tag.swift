//
//  Tag.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

private enum Constants {
    static let horizontalInset: CGFloat = 8
    static let horizontalInsetWithIcon: CGFloat = 5
    static let verticalInset: CGFloat = 4
    static let minWidth: CGFloat = 48
    static let minHeight: CGFloat = 20
    static let iconSize: CGFloat = 16
}

public struct Tag: View {
    public enum Style: CaseIterable {
        case promo
        case active
        case inactive
        case success
        case warning
        case error
    }

    private let style: Style
    private let text: String
    private let icon: Image?
    private var isInverse = false
    private var textAccessibilityIdentifier: String?
    private var iconAccessibilityIdentifier: String? {
        guard let textAccessibilityIdentifier = textAccessibilityIdentifier else {
            return nil
        }
        return textAccessibilityIdentifier + "-icon"
    }

    public init(
        style: Style,
        text: String,
        icon: Image? = nil
    ) {
        self.style = style
        self.text = text
        self.icon = icon
    }

    public var body: some View {
        HStack(
            spacing: self.icon != nil ? Constants.horizontalInsetWithIcon : Constants.horizontalInset
        ) {
            self.icon?
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.iconSize, height: Constants.iconSize)
                .foregroundColor(foregroundColor)
                .accessibilityIdentifier(iconAccessibilityIdentifier)
            Text(text)
                .foregroundColor(foregroundColor)
                .font(.textPreset2(weight: .medium))
        }
        .padding(.horizontal, Constants.horizontalInset)
        .padding(.vertical, Constants.verticalInset)
        .frame(minWidth: Constants.minWidth, minHeight: Constants.minHeight, alignment: .center)
        .background(backgroundColor)
        .accessibilityIdentifier(textAccessibilityIdentifier)
        .round(radiusStyle: .indicator)
    }

    private var backgroundColor: Color {
        if isInverse {
            return .inverse
        }

        switch style {
        case .promo:
            return .promoLow
        case .success:
            return .successLow
        case .active:
            return .brandLow
        case .inactive:
            return .divider
        case .warning:
            return .warningLow
        case .error:
            return .errorLow
        }
    }

    private var foregroundColor: Color {
        switch style {
        case .promo:
            return .promoHigh
        case .success:
            return .successHigh
        case .active:
            return .brand
        case .inactive:
            return .neutralMedium
        case .warning:
            return .warningHigh
        case .error:
            return .errorHigh
        }
    }
}

// MARK: Modifiers

public extension Tag {
    func inverse(_ isInverse: Bool) -> Tag {
        var tag = self
        tag.isInverse = isInverse
        return tag
    }

    func textAccessibilityIdentifier(_ textAccessibilityIdentifier: String?) -> Tag {
        var tag = self
        tag.textAccessibilityIdentifier = textAccessibilityIdentifier
        return tag
    }
}

// MARK: Previews

#if DEBUG
    struct Tag_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                VStack {
                    ForEach(0 ..< Tag.Style.allCases.count, id: \.self) { index in
                        Tag(
                            style: Tag.Style.allCases[index],
                            text: "TAG WITH ICON",
                            icon: Image(systemName: "star.fill")
                        )
                    }
                    ForEach(0 ..< Tag.Style.allCases.count, id: \.self) { index in
                        Tag(style: Tag.Style.allCases[index], text: "TAG CONTENT")
                    }
                    ForEach(0 ..< Tag.Style.allCases.count, id: \.self) { index in
                        Tag(style: Tag.Style.allCases[index], text: "INVERSE TAG")
                            .inverse(true)
                    }
                }
            }
            .padding()
            .background(Color.backgroundBrand)
        }
    }
#endif
