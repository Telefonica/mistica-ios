//
//  Header.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import SwiftUI

public struct Header: View {
    private enum Constants {
        static let marginLeft = 16.0
        static let marginRight = 32.0
        static let marginTop = 32.0
        static let marginBottom = 24.0
        static let verticalSpacing = 8.0
    }

    private let pretitle: HeaderText?
    private let title: HeaderText?
    private let description: HeaderText?
    private let style: HeaderViewStyle
    private let style2: HeaderViewStyle? = nil

    public init(
        pretitle: HeaderText? = nil,
        title: HeaderText? = nil,
        description: HeaderText? = nil,
        style: HeaderViewStyle = .normal
    ) {
        self.pretitle = pretitle
        self.title = title
        self.description = description
        self.style = style
    }

    public var body: some View {
        VStack {
            VStack(spacing: Constants.verticalSpacing) {
                if let pretitleText = pretitle?.text, let lineLimit = pretitle?.lineLimit {
                    text(
                        pretitleText,
                        font: .textPreset3(weight: .regular),
                        foregroundColor: pretitleColor,
                        lineLimit: lineLimit,
                        accessibilityLabel: pretitle?.accessibilityLabel,
                        accessibilityIdentifier: pretitle?.accessibilityIdentifier
                    )
                }
                if let titleText = title?.text, let lineLimit = title?.lineLimit {
                    text(
                        titleText,
                        font: titleFont,
                        foregroundColor: titleColor,
                        lineLimit: lineLimit,
                        accessibilityLabel: title?.accessibilityLabel,
                        accessibilityIdentifier: title?.accessibilityIdentifier
                    )
                }
                if let descriptionText = description?.text, let lineLimit = description?.lineLimit {
                    text(
                        descriptionText,
                        font: descriptionFont,
                        foregroundColor: descriptionColor,
                        lineLimit: lineLimit,
                        accessibilityLabel: description?.accessibilityLabel,
                        accessibilityIdentifier: description?.accessibilityIdentifier
                    )
                }
            }.padding(
                EdgeInsets(
                    top: Constants.marginTop,
                    leading: Constants.marginLeft,
                    bottom: Constants.marginBottom,
                    trailing: Constants.marginRight
                )
            )
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .background(misticaColorStyle(backgroundColor))
        Spacer()
    }

    @ViewBuilder
    private func text(_ textValue: String,
                      font: Font,
                      foregroundColor: Color,
                      lineLimit: Int,
                      accessibilityLabel: String?,
                      accessibilityIdentifier: String?) -> some View {
        Text(textValue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(font)
            .foregroundColor(foregroundColor)
            .lineLimit(lineLimit)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityIdentifier(accessibilityIdentifier)
    }

    var backgroundColor: MisticaColorStyle {
        switch style {
        case .normal, .normalSmall:
            return .color(.background)
        case .inverse, .inverseSmall:
            return .backgroundBrand
        }
    }

    var pretitleColor: Color {
        switch style {
        case .normal, .normalSmall:
            return .textPrimary
        case .inverse, .inverseSmall:
            return .textPrimaryInverse
        }
    }

    var titleColor: Color {
        switch style {
        case .normal, .normalSmall:
            return .textPrimary
        case .inverse, .inverseSmall:
            return .textPrimaryInverse
        }
    }

    var titleFont: Font {
        switch style {
        case .normal, .inverse:
            return .textPreset6()
        case .normalSmall, .inverseSmall:
            return .textPreset4(weight: .regular)
        }
    }

    var descriptionColor: Color {
        switch style {
        case .normal, .normalSmall:
            return .textSecondary
        case .inverse, .inverseSmall:
            return .textSecondaryInverse
        }
    }

    var descriptionFont: Font {
        switch style {
        case .normal, .inverse:
            return .textPreset3(weight: .regular)
        case .normalSmall, .inverseSmall:
            return .textPreset2(weight: .regular)
        }
    }
}

// MARK: Previews

#if DEBUG
    struct Header_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                Header(
                    pretitle: HeaderText(text: "The pretitle"),
                    title: HeaderText(text: "The title"),
                    description: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                )
                Header(
                    pretitle: HeaderText(text: "The pretitle"),
                    title: HeaderText(text: "The title"),
                    description: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                    style: .inverse
                )
            }
            .previewLayout(.sizeThatFits)
        }
    }
#endif
