//
//  SnapCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

private enum Constants {
    static let spacing = 16.0
    static let shortSpacing = 4.0
    static let minHeight = 80.0
    static let assetTypeImageSize: CGFloat = 40
    static let assetTypeIcontSize: CGFloat = 24
    static let buttonAnimationDuration: CGFloat = 0.1
}

/// Snap Cards are quick content-minimal elements. Their aim is to be used to read content quickly, which acts
/// as an entry point to more detailed information.
/// - Generic `Slot`: A customizable subview included in the card.
@available(iOS 13.0, macOS 10.15, tvOS 16.0, watchOS 6.0, *)
public struct SnapCard<Slot>: View where Slot: View {
    /// The theme variant of the card
    private var themeVariant: SnapCardThemeVariant

    /// The aspect ratio of the card's media content.
    public let aspectRatio: SnapCardAspectRatio

    /// An asset type (e.g., image or icon)
    public let assetType: SnapCardAssetType

    /// A short and clear label that states the card's main message. It should not exceed 2 lines.
    private let title: String

    /// Title complementary info, it should be brief and should not exceed 2 lines.
    private let subTitle: String?

    /// Optional description text displayed below the subtitle.
    private let description: String?

    /// A customizable slot view displayed at the bottom of the card.
    public let slot: Slot

    private let action: SnapCardCallback

    public var titleLineLimit: Int?
    public var subTitleLineLimit: Int?
    public var descriptionLineLimit: Int?

    private var assetAccessibilityLabel: String?
    private var assetAccessibilityIdentifier: String?
    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var subTitleAccessibilityLabel: String?
    private var subTitleAccessibilityIdentifier: String?
    private var descriptionAccessibilityLabel: String?
    private var descriptionAccessibilityIdentifier: String?

    // MARK: - Initializer

    /// Creates an instance of `SnapCard`.
    ///
    /// - Parameters:
    ///   - themeVariant: Theme variant
    ///   - aspectRatio: The aspect ratio of the card.
    ///   - assetType: An optional asset type for the header.
    ///   - title: Title of the card.
    ///   - titleLineLimit: Line limit of the title of the card.
    ///   - subTitle: Subtitle text.
    ///   - subTitleLineLimit: Line limit of the subtitle text.
    ///   - description: Description text.
    ///   - descriptionLineLimit: Line limit of the description text.
    ///   - slot: A customizable slot view.
    ///   - action: An action to handle tap action
    public init(
        themeVariant: SnapCardThemeVariant = .none,
        aspectRatio: SnapCardAspectRatio = .ratio7to10,
        assetType: SnapCardAssetType,
        title: String,
        titleLineLimit: Int? = nil,
        subTitle: String? = nil,
        subTitleLineLimit: Int? = nil,
        description: String? = nil,
        descriptionLineLimit: Int? = nil,
        @ViewBuilder slot: () -> Slot = { EmptyView() },
        action: @escaping SnapCardCallback = {}
    ) {
        self.themeVariant = themeVariant
        self.aspectRatio = aspectRatio
        self.assetType = assetType
        self.title = title
        self.titleLineLimit = titleLineLimit
        self.subTitle = subTitle
        self.subTitleLineLimit = subTitleLineLimit
        self.description = description
        self.descriptionLineLimit = descriptionLineLimit
        self.slot = slot()
        self.action = action
    }

    // MARK: - View Body

    public var body: some View {
        Button(action: { action() }) {
            VStack(alignment: .leading, spacing: .zero) {
                VStack(alignment: .leading, spacing: .zero) {
                    assetView
                        .accessibilityLabel(assetAccessibilityLabel)
                        .accessibilityIdentifier(assetAccessibilityIdentifier)

                    VStack(alignment: .leading, spacing: Constants.shortSpacing) {
                        Text(title)
                            .font(.textPreset2(weight: .medium))
                            .foregroundColor(textPrimaryColor)
                            .lineLimit(titleLineLimit)
                            .accessibilityLabel(titleAccessibilityLabel)
                            .accessibilityIdentifier(titleAccessibilityIdentifier)
                            .fixedSize(horizontal: false, vertical: true)

                        if let subTitle {
                            Text(subTitle)
                                .font(.textPreset2(weight: .regular))
                                .foregroundColor(textPrimaryColor)
                                .lineLimit(subTitleLineLimit)
                                .accessibilityLabel(subTitleAccessibilityLabel)
                                .accessibilityIdentifier(subTitleAccessibilityIdentifier)
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        if let description {
                            Text(description)
                                .font(.textPreset2(weight: .regular))
                                .foregroundColor(textSecondaryColor)
                                .lineLimit(descriptionLineLimit)
                                .multilineTextAlignment(.leading)
                                .accessibilityLabel(subTitleAccessibilityLabel)
                                .accessibilityIdentifier(subTitleAccessibilityIdentifier)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }

                    Spacer()

                    if hasSlotView {
                        slot
                            .padding(.top, Constants.spacing)
                    }
                }
                .padding(Constants.spacing)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .aspectRatio(aspectRatio.value, contentMode: .fill)
            .frame(minHeight: Constants.minHeight)
            .background(backgroundView)
            .fixedSize(horizontal: false, vertical: true)
            .border(radiusStyle: .container, borderColor: borderColor, lineWidth: borderLineWidth)
        }
        .buttonStyle(SnapCardButtonStyle(backgroundPressedColor: backgroundPressedColor))
    }

    @ViewBuilder
    private var assetView: some View {
        switch assetType {
        case let .avatar(image, borderColor, lineWidth):
            image
                .resizable()
                .scaledToFill()
                .frame(width: Constants.assetTypeImageSize, height: Constants.assetTypeImageSize)
                .border(radiusStyle: .avatar, borderColor: borderColor, lineWidth: lineWidth)
                .round(radiusStyle: .avatar)
                .padding(.bottom, Constants.spacing)

        case let .icon(image, foregroundColor, backgroundColor):
            ZStack {
                if let backgroundColor = backgroundColor {
                    Circle().fill(backgroundColor)
                        .frame(width: Constants.assetTypeImageSize, height: Constants.assetTypeImageSize)
                }

                image
                    .resizable()
                    .foregroundColor(foregroundColor)
                    .scaledToFit()
                    .frame(width: Constants.assetTypeIcontSize, height: Constants.assetTypeIcontSize)
            }
            .padding(.bottom, Constants.spacing)

        case .none:
            EmptyView()
        }
    }
}

private extension SnapCard {
    var hasSlotView: Bool {
        !(slot is EmptyView)
    }

    var textPrimaryColor: Color {
        switch themeVariant {
        case .none,
             .overAlternative:
            return .textPrimary
        case .inverse,
             .overInverse:
            return .textPrimaryInverse
        }
    }

    var textSecondaryColor: Color {
        switch themeVariant {
        case .none,
             .overAlternative:
            return .textSecondary
        case .inverse,
             .overInverse:
            return .textSecondaryInverse
        }
    }

    @ViewBuilder
    var backgroundView: some View {
        switch themeVariant {
        case .none,
             .overInverse,
             .overAlternative:
            Color.backgroundContainer
        case .inverse:
            misticaColorView(.backgroundContainerBrand)
        }
    }

    var backgroundPressedColor: Color {
        switch themeVariant {
        case .none,
             .overInverse,
             .overAlternative:
            return .backgroundContainerPressed
        case .inverse:
            return .backgroundContainerBrandPressed
        }
    }

    var borderColor: Color {
        switch themeVariant {
        case .none,
             .overAlternative:
            return .border
        case .inverse,
             .overInverse:
            return .clear
        }
    }

    var borderLineWidth: CGFloat {
        switch themeVariant {
        case .none,
             .overAlternative:
            return 1.0
        case .inverse,
             .overInverse:
            return .zero
        }
    }
}

public extension SnapCard {
    func assetAccessibilityLabel(_ assetAccessibilityLabel: String?) -> Self {
        var view = self
        view.assetAccessibilityLabel = assetAccessibilityLabel
        return view
    }

    func assetAccessibilityIdentifier(_ assetAccessibilityIdentifier: String?) -> Self {
        var view = self
        view.assetAccessibilityIdentifier = assetAccessibilityIdentifier
        return view
    }

    func titleAccessibilityLabel(_ titleAccessibilityLabel: String?) -> Self {
        var view = self
        view.titleAccessibilityLabel = titleAccessibilityLabel
        return view
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> Self {
        var view = self
        view.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return view
    }

    func subTitleAccessibilityLabel(_ subTitleAccessibilityLabel: String?) -> Self {
        var view = self
        view.subTitleAccessibilityLabel = subTitleAccessibilityLabel
        return view
    }

    func subTitleAccessibilityIdentifier(_ subTitleAccessibilityIdentifier: String?) -> Self {
        var view = self
        view.subTitleAccessibilityIdentifier = subTitleAccessibilityIdentifier
        return view
    }

    func descriptionAccessibilityLabel(_ descriptionAccessibilityLabel: String?) -> Self {
        var view = self
        view.descriptionAccessibilityLabel = descriptionAccessibilityLabel
        return view
    }

    func descriptionAccessibilityIdentifier(_ descriptionAccessibilityIdentifier: String?) -> Self {
        var view = self
        view.descriptionAccessibilityIdentifier = descriptionAccessibilityIdentifier
        return view
    }
}

// MARK: - Public Types

/// A callback type for handling user interactions on `SnapCard`.
public typealias SnapCardCallback = () -> Void

public enum SnapCardThemeVariant {
    case none
    case inverse
    case overInverse
    case overAlternative
}

/// Defines aspect ratio options for the `PosterCard`.
public enum SnapCardAspectRatio {
    /// A 1:1 aspect ratio.
    case ratio1to1

    /// A 7:10 aspect ratio.
    case ratio7to10

    /// A 9:10 aspect ratio.
    case ratio9to10

    /// A 16:9 aspect ratio.
    case ratio16to9

    /// A custom aspect ratio.
    case custom(CGFloat)

    /// Returns the numerical value of the aspect ratio.
    public var value: CGFloat {
        switch self {
        case .ratio1to1:
            return 1
        case .ratio7to10:
            return 7.0 / 10.0
        case .ratio9to10:
            return 9.0 / 10.0
        case .ratio16to9:
            return 16.0 / 9.0
        case let .custom(ratio):
            return ratio
        }
    }
}

/// Represents the asset type in a `SnapCard`.
public enum SnapCardAssetType {
    /// No asset.
    case none

    /// An icon with optional foreground and background colors.
    case icon(image: Image, foregroundColor: Color? = nil, backgroundColor: Color? = nil)

    /// A standalone avatar image.
    case avatar(Image, borderColor: Color = .border, borderSize: CGFloat = 1.0)
}

// MARK: - Private Extensions

private struct SnapCardButtonStyle: ButtonStyle {
    let backgroundPressedColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .snapCardButtonStyle(
                shouldAnimate: configuration.isPressed,
                backgroundColor: configuration.isPressed ? backgroundPressedColor : .clear
            )
    }
}

private extension View {
    func snapCardButtonStyle(
        shouldAnimate: Bool,
        backgroundColor: Color
    ) -> some View {
        overlay(
            backgroundColor
                .round(radiusStyle: .container)
        )
        .animation(.easeInOut(duration: Constants.buttonAnimationDuration), value: shouldAnimate)
    }

    @ViewBuilder
    func conditionalModifier<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
