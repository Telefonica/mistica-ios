//
//  Tag.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

private enum Constants {
    static let cornerRadius: CGFloat = 50
    static let horizontalInset: CGFloat = 8
    static let verticalInset: CGFloat = 4
    static let minWidth: CGFloat = 48
    static let minHeight: CGFloat = 20
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
    private var isInverse = false

    public init(
        style: Style,
        text: String
    ) {
        self.style = style
        self.text = text
    }

    public var body: some View {
        Text(text)
            .padding(.horizontal, Constants.horizontalInset)
            .padding(.vertical, Constants.verticalInset)
            .frame(minWidth: Constants.minWidth, minHeight: Constants.minHeight, alignment: .center)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .font(.textPreset2(weight: .medium))
            .round(cornerRadius: Constants.cornerRadius)
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
            return .neutralLow
        case .warning:
            return .warningLow
        case .error:
            return .errorLow
        }
    }

    private var foregroundColor: Color {
        switch style {
        case .promo:
            return .promo
        case .success:
            return .success
        case .active:
            return .brand
        case .inactive:
            return .neutralMedium
        case .warning:
            return .warning
        case .error:
            return .error
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
}

// MARK: Previews

#if DEBUG
    struct Tag_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                VStack {
                    ForEach(0 ..< Tag.Style.allCases.count) { index in
                        Tag(style: Tag.Style.allCases[index], text: "TAG CONTENT")
                    }

                    ForEach(0 ..< Tag.Style.allCases.count) { index in
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
