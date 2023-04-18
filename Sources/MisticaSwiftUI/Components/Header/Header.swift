//
//  Header.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public struct Header: View {
    private let pretitle: String?
    private let title: String?
    private let description: String?
    
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
        descriptionAccessibilityIdentifier: String? = nil
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
    }

    public var body: some View {
        VStack(spacing: 8) {
            if let pretitle = pretitle {
                text(pretitle,
                     font: .textPreset3(weight: .regular),
                     foregroundColor: .textPrimary,
                     accessibilityLabel: pretitleAccessibilityLabel,
                     accessibilityIdentifier: pretitleAccessibilityIdentifier)
            }
            if let title = title {
                text(title,
                     font: .textPreset6(),
                     foregroundColor: .textPrimary,
                     accessibilityLabel: titleAccessibilityLabel,
                     accessibilityIdentifier: titleAccessibilityIdentifier)
            }
            if let description = description {
                text(description,
                     font: .textPreset3(weight: .regular),
                     foregroundColor: .textSecondary,
                     accessibilityLabel: descriptionAccessibilityLabel,
                     accessibilityIdentifier: descriptionAccessibilityIdentifier)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.leading, 16)
        .padding(.top, 32)
        .padding(.trailing, 16)
    }
    
    @ViewBuilder
    private func text(_ textValue: String,
                      font: Font,
                      foregroundColor: Color,
                      accessibilityLabel: String?,
                      accessibilityIdentifier: String?
    ) -> some View {
        Text(textValue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(font)
            .foregroundColor(foregroundColor)
            .lineLimit(1)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityIdentifier(accessibilityIdentifier)
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
            }
            .previewLayout(.sizeThatFits)
        }
    }
#endif
