//
//  DataCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public enum DataCardAssetType {
    case none
    case icon(image: Image, foregroundColor: Color?, backgroundColor: Color?)
    case image(image: Image)
}

public struct DataCardColorsConfiguration {
    var primaryTextColor: Color
    var secondaryTextColor: Color
    var backgroundColor: Color
    var borderColor: Color
    var dismissColor: Color
    
    public init(
        primaryTextColor: Color = .textPrimary,
        secondaryTextColor: Color = .textSecondary,
        backgroundColor: Color = .backgroundContainer,
        borderColor: Color = .border,
        dismissColor: Color = .neutralHigh
    ) {
        self.primaryTextColor = primaryTextColor
        self.secondaryTextColor = secondaryTextColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.dismissColor = dismissColor
    }
}

public struct DataCard<Headline: View, Fragment: View, PrimaryButton: View, LinkButton: View>: View {
    private let assetType: DataCardAssetType
    private let headline: Headline?
    private let title: String?
    private let subtitle: String?
    private let description: String?
    private let dismissAction: (() -> Void)?
    private let fragmentView: Fragment
    private let primaryButton: PrimaryButton
    private let linkButton: LinkButton

    private var colorsConfiguration: DataCardColorsConfiguration
    private var titleLineLimit: Int? = 1
    private var subtitleLineLimit: Int? = 2
    private var descriptionLineLimit: Int? = 3
    private var fixedVerticalContentSize = true
    private var assetAccessibilityLabel: String?
    private var assetAccessibilityIdentifier: String?
    private var headlineAccessibilityLabel: String?
    private var headlineAccessibilityIdentifier: String?
    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var subtitleAccessibilityLabel: String?
    private var subtitleAccessibilityIdentifier: String?
    private var descriptionAccessibilityLabel: String?
    private var descriptionAccessibilityIdentifier: String?

    fileprivate init(
        assetType: DataCardAssetType,
        headline: Headline,
        title: String?,
        subtitle: String?,
        description: String?,
        dismissAction: (() -> Void)?,
        primaryButton: PrimaryButton,
        linkButton: LinkButton,
        fragmentView: Fragment,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) {
        self.assetType = assetType
        self.headline = headline
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.dismissAction = dismissAction
        self.primaryButton = primaryButton
        self.linkButton = linkButton
        self.fragmentView = fragmentView
        self.colorsConfiguration = colorsConfiguration
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            assetView
                .accessibilityLabel(assetAccessibilityLabel)
                .accessibilityIdentifier(assetAccessibilityIdentifier)

            if let headline = headline {
                headline
                    .padding(.top, 8)
            }

            if let title = title {
                Text(title)
                    .padding(.top, 8)
                    .lineLimit(titleLineLimit)
                    .font(.textPreset4(weight: .cardTitle))
                    .foregroundColor(colorsConfiguration.primaryTextColor)
                    .accessibilityLabel(titleAccessibilityLabel)
                    .accessibilityIdentifier(titleAccessibilityIdentifier)
                    .fixedSize(horizontal: false, vertical: true)
            }

            if let subtitle = subtitle {
                Text(subtitle)
                    .padding(.top, 4)
                    .lineLimit(subtitleLineLimit)
                    .font(.textPreset2(weight: .regular))
                    .foregroundColor(colorsConfiguration.primaryTextColor)
                    .accessibilityLabel(subtitleAccessibilityLabel)
                    .accessibilityIdentifier(subtitleAccessibilityIdentifier)
                    .fixedSize(horizontal: false, vertical: true)
            }

            if let description = description {
                Text(description)
                    .padding(.top, 8)
                    .lineLimit(descriptionLineLimit)
                    .font(.textPreset2(weight: .regular))
                    .foregroundColor(colorsConfiguration.secondaryTextColor)
                    .accessibilityLabel(descriptionAccessibilityLabel)
                    .accessibilityIdentifier(descriptionAccessibilityIdentifier)
                    .fixedSize(horizontal: false, vertical: true)
            }

            if hasFragmentView {
                fragmentView
                    .padding(.top, 16)
            }

            // This spacer along with `fixedVerticalContentSize = true` makes the content of the card to expand.
            Spacer()

            if hasPrimaryButton || hasLinkButton {
                HStack(spacing: 24) {
                    primaryButton
                        .buttonStyle(.misticaPrimary(small: true))

                    linkButton
                        .buttonStyle(
                            .misticaLink(
                                small: true,
                                bleedingAlignment: hasPrimaryButton ? .none : .leading
                            )
                        )
                }
                .padding(.top, 16)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        .padding(.bottom, 24)
        .expandHorizontally(alignment: .leading)
        .background(colorsConfiguration.backgroundColor)
        .border(radiusStyle: .container, borderColor: colorsConfiguration.borderColor, lineWidth: 1)
        .fixedSize(horizontal: false, vertical: fixedVerticalContentSize)
        .overlay(dismissView)
    }

    @ViewBuilder
    private var dismissView: some View {
        if let dismissAction = dismissAction {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismissAction()
                    } label: {
                        Image.closeButtonBlackSmallIcon
                            .renderingMode(.template)
                            .frame(width: 40, height: 40)
                            .foregroundColor(colorsConfiguration.dismissColor)
                    }
                }
                Spacer()
            }
        }
    }

    @ViewBuilder
    private var assetView: some View {
        switch assetType {
        case let .image(image):
            image
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
        case let .icon(image, foregroundColor, backgroundColor):
            ZStack {
                if let backgroundColor = backgroundColor {
                    Circle().fill(backgroundColor)
                        .frame(width: 40, height: 40)
                }

                image
                    .resizable()
                    .foregroundColor(foregroundColor)
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .padding(.vertical, 8)
        case .none:
            EmptyView()
        }
    }

    private var hasFragmentView: Bool {
        Fragment.self != EmptyView.self
    }

    private var hasPrimaryButton: Bool {
        PrimaryButton.self != EmptyView.self
    }

    private var hasLinkButton: Bool {
        LinkButton.self != EmptyView.self
    }
}

// MARK: Modifiers

public extension DataCard {
    func fixedVerticalContentSize(_ fixedVerticalContentSize: Bool) -> DataCard {
        var dataCard = self
        dataCard.fixedVerticalContentSize = fixedVerticalContentSize
        return dataCard
    }

    func titleLineLimit(_ titleLineLimit: Int?) -> DataCard {
        var dataCard = self
        dataCard.titleLineLimit = titleLineLimit
        return dataCard
    }

    func subtitleLineLimit(_ subtitleLineLimit: Int?) -> DataCard {
        var dataCard = self
        dataCard.subtitleLineLimit = subtitleLineLimit
        return dataCard
    }

    func descriptionLineLimit(_ descriptionLineLimit: Int?) -> DataCard {
        var dataCard = self
        dataCard.descriptionLineLimit = descriptionLineLimit
        return dataCard
    }

    func assetAccessibilityLabel(_ assetAccessibilityLabel: String?) -> DataCard {
        var dataCard = self
        dataCard.assetAccessibilityLabel = assetAccessibilityLabel
        return dataCard
    }

    func assetAccessibilityIdentifier(_ assetAccessibilityIdentifier: String?) -> DataCard {
        var dataCard = self
        dataCard.assetAccessibilityIdentifier = assetAccessibilityIdentifier
        return dataCard
    }

    func headlineAccessibilityLabel(_ headlineAccessibilityLabel: String?) -> DataCard {
        var dataCard = self
        dataCard.headlineAccessibilityLabel = headlineAccessibilityLabel
        return dataCard
    }

    func headlineAccessibilityIdentifier(_ headlineAccessibilityIdentifier: String?) -> DataCard {
        var dataCard = self
        dataCard.headlineAccessibilityIdentifier = headlineAccessibilityIdentifier
        return dataCard
    }

    func titleAccessibilityLabel(_ titleAccessibilityLabel: String?) -> DataCard {
        var dataCard = self
        dataCard.titleAccessibilityLabel = titleAccessibilityLabel
        return dataCard
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> DataCard {
        var dataCard = self
        dataCard.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return dataCard
    }

    func subtitleAccessibilityLabel(_ subtitleAccessibilityLabel: String?) -> DataCard {
        var dataCard = self
        dataCard.subtitleAccessibilityLabel = subtitleAccessibilityLabel
        return dataCard
    }

    func subtitleAccessibilityIdentifier(_ subtitleAccessibilityIdentifier: String?) -> DataCard {
        var dataCard = self
        dataCard.subtitleAccessibilityIdentifier = subtitleAccessibilityIdentifier
        return dataCard
    }

    func descriptionAccessibilityLabel(_ descriptionAccessibilityLabel: String?) -> DataCard {
        var dataCard = self
        dataCard.subtitleAccessibilityIdentifier = subtitleAccessibilityIdentifier
        return dataCard
    }

    func descriptionAccessibilityIdentifier(_ descriptionAccessibilityIdentifier: String?) -> DataCard {
        var dataCard = self
        dataCard.descriptionAccessibilityIdentifier = descriptionAccessibilityIdentifier
        return dataCard
    }
}

// MARK: - Initialisers

public extension DataCard {
    // MARK: Headline & Buttons

    init(
        assetType: DataCardAssetType = .none,
        @ViewBuilder headline: () -> Headline,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder linkButton: () -> LinkButton,
        @ViewBuilder fragmentView: () -> Fragment,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) {
        self.init(
            assetType: assetType,
            headline: headline(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: primaryButton(),
            linkButton: linkButton(),
            fragmentView: fragmentView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    init(
        assetType: DataCardAssetType = .none,
        @ViewBuilder headline: () -> Headline,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder linkButton: () -> LinkButton,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where Fragment == EmptyView {
        self.init(
            assetType: assetType,
            headline: headline(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: primaryButton(),
            linkButton: linkButton(),
            fragmentView: EmptyView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    init(
        assetType: DataCardAssetType = .none,
        @ViewBuilder headline: () -> Headline,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder linkButton: () -> LinkButton,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where PrimaryButton == EmptyView, Fragment == EmptyView {
        self.init(
            assetType: assetType,
            headline: headline(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: EmptyView(),
            linkButton: linkButton(),
            fragmentView: EmptyView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    init(
        assetType: DataCardAssetType = .none,
        @ViewBuilder headline: () -> Headline,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder fragmentView: () -> Fragment,
        @ViewBuilder linkButton: () -> LinkButton,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where PrimaryButton == EmptyView, LinkButton == EmptyView {
        self.init(
            assetType: assetType,
            headline: headline(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: EmptyView(),
            linkButton: linkButton(),
            fragmentView: fragmentView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    init(
        assetType: DataCardAssetType = .none,
        @ViewBuilder headline: () -> Headline,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where LinkButton == EmptyView, PrimaryButton == EmptyView, Fragment == EmptyView {
        self.init(
            assetType: assetType,
            headline: headline(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: EmptyView(),
            linkButton: EmptyView(),
            fragmentView: EmptyView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    // MARK: No Headline & Buttons

    init(
        assetType: DataCardAssetType = .none,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder linkButton: () -> LinkButton,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where Fragment == EmptyView, Headline == EmptyView {
        self.init(
            assetType: assetType,
            headline: EmptyView(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: primaryButton(),
            linkButton: linkButton(),
            fragmentView: EmptyView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    init(
        assetType: DataCardAssetType = .none,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder linkButton: () -> LinkButton,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where PrimaryButton == EmptyView, Fragment == EmptyView, Headline == EmptyView {
        self.init(
            assetType: assetType,
            headline: EmptyView(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: EmptyView(),
            linkButton: linkButton(),
            fragmentView: EmptyView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    init(
        assetType: DataCardAssetType = .none,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        @ViewBuilder fragmentView: () -> Fragment,
        @ViewBuilder linkButton: () -> LinkButton,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where PrimaryButton == EmptyView, LinkButton == EmptyView, Headline == EmptyView {
        self.init(
            assetType: assetType,
            headline: EmptyView(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: EmptyView(),
            linkButton: linkButton(),
            fragmentView: fragmentView(),
            colorsConfiguration: colorsConfiguration
        )
    }

    init(
        assetType: DataCardAssetType = .none,
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        dismissAction: (() -> Void)? = nil,
        colorsConfiguration: DataCardColorsConfiguration = .init()
    ) where PrimaryButton == EmptyView, LinkButton == EmptyView, Fragment == EmptyView, Headline == EmptyView {
        self.init(
            assetType: assetType,
            headline: EmptyView(),
            title: title,
            subtitle: subtitle,
            description: description,
            dismissAction: dismissAction,
            primaryButton: EmptyView(),
            linkButton: EmptyView(),
            fragmentView: EmptyView(),
            colorsConfiguration: colorsConfiguration
        )
    }
}

// MARK: Previews

#if DEBUG

    struct DataCard_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                DataCard(
                    assetType: .icon(
                        image: Image(systemName: "plus"),
                        foregroundColor: .neutralMedium,
                        backgroundColor: .neutralLow
                    ),
                    title: "title",
                    subtitle: "subtitle",
                    description: nil,
                    dismissAction: {},
                    colorsConfiguration: .init(
                        primaryTextColor: .textPrimaryInverse,
                        secondaryTextColor: .textSecondaryInverse,
                        backgroundColor: .backgroundBrand,
                        borderColor: .border,
                        dismissColor: .neutralLow
                    )
                )
                .frame(width: 350)
                .previewDisplayName("Colors")

                DataCard(
                    assetType: .image(image: Image(systemName: "photo")),
                    headline: { Tag(style: .promo, text: "headline") },
                    title: "title",
                    subtitle: "subtitle",
                    description: "description",
                    primaryButton: { Button(action: {}, label: { Text("Primary") }) },
                    linkButton: { Button(action: {}, label: { Text("Link") }) }
                )
                .frame(width: 350)

                DataCard(
                    assetType: .image(image: Image(systemName: "photo")),
                    headline: { Tag(style: .promo, text: "headline") },
                    title: "title",
                    subtitle: "subtitle",
                    description: "description",
                    linkButton: { Button(action: {}, label: { Text("Link") }) }
                )
                .frame(width: 350)

                DataCard(
                    assetType: .image(image: Image(systemName: "photo")),
                    headline: { Tag(style: .promo, text: "headline") },
                    title: "title",
                    subtitle: "subtitle",
                    description: "description",
                    linkButton: { Button("Link") {} }
                )
                .titleLineLimit(2)
                .subtitleLineLimit(1)

                DataCard(
                    assetType: .image(image: Image(systemName: "photo")),
                    headline: { Tag(style: .promo, text: "headline") },
                    title: "title",
                    subtitle: "subtitle",
                    description: "description",
                    primaryButton: {
                        Button(action: {}, label: { Text("Primary") })
                    }, linkButton: {
                        Button(action: {}, label: { Text("Link") })
                    }, fragmentView: {
                        VStack(alignment: .leading) {
                            Text("Top Description")
                                .font(.textPreset2(weight: .regular))
                                .foregroundColor(.textSecondary)
                                .expandHorizontally(alignment: .leading)
                            Text("00,00 €")
                                .font(.textPreset6())
                                .foregroundColor(.textPrimary)
                                .expandHorizontally(alignment: .leading)
                            Text("Bottom description")
                                .font(.textPreset2(weight: .regular))
                                .foregroundColor(.textSecondary)
                                .expandHorizontally(alignment: .leading)
                        }
                        .frame(width: 250)
                    }
                )
            }
            .previewLayout(.sizeThatFits)
        }
    }

#endif
