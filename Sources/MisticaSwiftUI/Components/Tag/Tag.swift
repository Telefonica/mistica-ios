//
//  Tag.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
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
    private let style: TagStyle
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
        style: TagStyle,
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
                .foregroundColor(Color(style.textColor(isInverse)))
                .accessibilityIdentifier(iconAccessibilityIdentifier)
            Text(text)
                .foregroundColor(Color(style.textColor(isInverse)))
                .font(.textPreset2(weight: .indicator))
        }
        .padding(.horizontal, Constants.horizontalInset)
        .padding(.vertical, Constants.verticalInset)
        .frame(minWidth: Constants.minWidth, minHeight: Constants.minHeight, alignment: .center)
        .background(Color(style.backgroundColor(isInverse)))
        .accessibilityIdentifier(textAccessibilityIdentifier)
        .round(radiusStyle: .tag)
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
                    ForEach(0 ..< TagStyle.allCases.count, id: \.self) { index in
                        Tag(
                            style: TagStyle.allCases[index],
                            text: "TAG WITH ICON",
                            icon: Image(systemName: "star.fill")
                        )
                    }
                    ForEach(0 ..< TagStyle.allCases.count, id: \.self) { index in
                        Tag(style: TagStyle.allCases[index], text: "TAG CONTENT")
                    }
                    ForEach(0 ..< TagStyle.allCases.count, id: \.self) { index in
                        Tag(style: TagStyle.allCases[index], text: "INVERSE TAG")
                            .inverse(true)
                    }
                }
            }
            .padding()
            .background(Color.brand)
        }
    }
#endif
