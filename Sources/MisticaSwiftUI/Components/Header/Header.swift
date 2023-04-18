//
//  Header.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public struct Header: View {
    public enum HeaderStyle {
        case normal
        case inverse
    }
    
    private enum Constants {
        static let marginLeftAndRight = 16.0
        static let marginTop = 32.0
        static let marginBottom = 24.0
    }

    private let pretitle: String?
    private let title: String?
    private let description: String?
    private let style: HeaderStyle

    private var pretitleAccessibilityLabel: String?
    private var pretitleAccessibilityIdentifier: String?
    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var descriptionAccessibilityLabel: String?
    private var descriptionAccessibilityIdentifier: String?

    public init(
        pretitle: String? = nil,
        pretitleAccessibilityLabel: String? = nil,
        pretitleAccessibilityIdentifier: String? = nil,
        title: String? = nil,
        titleAccessibilityLabel: String? = nil,
        titleAccessibilityIdentifier: String? = nil,
        description: String? = nil,
        descriptionAccessibilityLabel: String? = nil,
        descriptionAccessibilityIdentifier: String? = nil,
        style: HeaderStyle = .normal
    ) {
        self.pretitle = pretitle
        self.pretitleAccessibilityLabel = pretitleAccessibilityLabel
        self.pretitleAccessibilityIdentifier = pretitleAccessibilityIdentifier
        self.title = title
        self.titleAccessibilityLabel = titleAccessibilityLabel
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        self.description = description
        self.descriptionAccessibilityLabel = descriptionAccessibilityLabel
        self.descriptionAccessibilityIdentifier = descriptionAccessibilityIdentifier
        self.style = style
    }

    public var body: some View {
        VStack {
            VStack(spacing: 8) {
                if let pretitle = pretitle {
                    text(
                        pretitle,
                        font: .textPreset3(weight: .regular),
                        foregroundColor: pretitleColor,
                        accessibilityLabel: pretitleAccessibilityLabel,
                        accessibilityIdentifier: pretitleAccessibilityIdentifier
                    )
                }
                if let title = title {
                    text(
                        title,
                        font: .textPreset6(),
                        foregroundColor: titleColor,
                        accessibilityLabel: titleAccessibilityLabel,
                        accessibilityIdentifier: titleAccessibilityIdentifier
                    )
                }
                if let description = description {
                    text(
                        description,
                        font: .textPreset3(weight: .regular),
                        foregroundColor: descriptionColor,
                        accessibilityLabel: descriptionAccessibilityLabel,
                        accessibilityIdentifier: descriptionAccessibilityIdentifier
                    )
                }
            }.padding(EdgeInsets(
                top: Constants.marginTop,
                leading: Constants.marginLeftAndRight,
                bottom: Constants.marginBottom,
                trailing: Constants.marginLeftAndRight)
            )
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .background(backgroundColor)
        .padding(0)
        Spacer()
    }

    @ViewBuilder
    private func text(_ textValue: String,
                      font: Font,
                      foregroundColor: Color,
                      accessibilityLabel: String?,
                      accessibilityIdentifier: String?) -> some View {
        Text(textValue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(font)
            .foregroundColor(foregroundColor)
            .lineLimit(1)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityIdentifier(accessibilityIdentifier)
    }

    var backgroundColor: Color {
        switch style {
        case .normal:
            return .background
        case .inverse:
            return .backgroundBrand
        }
    }

    var pretitleColor: Color {
        switch style {
        case .normal:
            return .textPrimary
        case .inverse:
            return .textPrimaryInverse
        }
    }
    
    var titleColor: Color {
        switch style {
        case .normal:
            return .textPrimary
        case .inverse:
            return .textPrimaryInverse
        }
    }

    var descriptionColor: Color {
        switch style {
        case .normal:
            return .textPrimary
        case .inverse:
            return .textPrimaryInverse
        }
    }

}

// MARK: Previews

#if DEBUG
    struct Header_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                Header(
                    pretitle: "The pretitle",
                    title: "The title",
                    description: "The description value, con un valor muy largo que ocupa muchas lineas..."
                )
                Header(
                    pretitle: "The pretitle",
                    title: "The title",
                    description: "The description value, con un valor muy largo que ocupa muchas lineas...",
                    style: .inverse
                )
            }
            .previewLayout(.sizeThatFits)
        }
    }
#endif
