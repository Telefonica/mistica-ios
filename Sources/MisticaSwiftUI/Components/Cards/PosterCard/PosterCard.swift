//
//  PosterCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

private enum Constants {
    static let minVideoPlayerDurationToShowControls = 5.0
    static let minScrollVisibilityChangeThresholdToPlayVideo = 0.55
    static let gradientHeightPercentage: CGFloat = 0.6
    static let gradientMinHeight: CGFloat = 196
    static let topActionIconSize: CGFloat = 32
    static let assetTypeImageSize: CGFloat = 40
    static let assetTypeIcontSize: CGFloat = 24
    static let defaultLineLimit: Int = 1
    static let longerLineLimit: Int = 2
    static let spacing: CGFloat = 8
    static let topSpacingToContent: CGFloat = 40
    static let topActionDefaultBackgroundOpacity: CGFloat = 0.7
    static let topActionPressedBackgroundOpacity: CGFloat = 1.0
    static let topActionAnimationDuration: CGFloat = 0.2
    static let posterCardPressedBackgroundOpacity: CGFloat = 0.35
    static let posterCardDefaultBackgroundOpacity: CGFloat = 0
    static let posterCardAnimationDuration: CGFloat = 0.15
}

public enum PosterCardThemeVariant {
    case none
    case inverse
    case overInverse
    case overAlternative
}

public enum PosterCardSkinColors {
    case none
    case promo
    case success
    case warning
    case error
}

/// A versatile card view supporting media content like images or videos, additional fragments, and action buttons.
///
/// - Note: This card automatically adapts its layout based on the provided parameters.
/// - Generic `Slot`: A customizable subview included in the card.
public struct PosterCard<Slot>: View where Slot: View {
    // MARK: - Public Properties

    /// The media content type displayed on the card (e.g., image, video, or color).
    public let mediaType: PosterCardMediaType

    /// The theme variant of the card
    private var themeVariant: PosterCardThemeVariant

    /// The aspect ratio of the card's media content.
    public let aspectRatio: PosterCardAspectRatio

    /// An asset type (e.g., image or icon) displayed in the header.
    public let assetType: PosterCardAssetType

    /// An optional Tag view
    public let tag: Tag?

    /// Optional pre-title text displayed above the main title.
    public let preTitle: String?

    /// The main title of the card.
    public let title: String

    /// Optional subtitle text displayed below the title.
    public let subTitle: String?

    /// Optional description text displayed below the subtitle.
    public let description: String?

    /// A customizable slot view displayed at the bottom of the card.
    public let slot: Slot

    private let action: PosterCardCallback

    private var assetAccessibilityLabel: String?
    private var assetAccessibilityIdentifier: String?
    private var tagAccessibilityLabel: String?
    private var tagAccessibilityIdentifier: String?
    private var preTitleAccessibilityLabel: String?
    private var preTitleAccessibilityIdentifier: String?
    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var subtitleAccessibilityLabel: String?
    private var subtitleAccessibilityIdentifier: String?
    private var descriptionAccessibilityLabel: String?
    private var descriptionAccessibilityIdentifier: String?

    // MARK: - Private State

    /// Tracks the current status of the video player.
    @State private var videoPlayerStatus: PosterCardVideoPlayer.Status = .unknown

    /// Stores the total duration of the video being played.
    @State private var videoPlayerDuration: Float64 = .zero

    // MARK: - Initializer

    /// Creates an instance of `PosterCard`.
    ///
    /// - Parameters:
    ///   - mediaType: The media content type to display on the card.
    ///   - themeVariant: Theme variant
    ///   - aspectRatio: The aspect ratio of the card.
    ///   - assetType: An optional asset type for the header.
    ///   - tag: An optional Tag view
    ///   - preTitle: Optional pre-title text.
    ///   - title: The main title of the card.
    ///   - subTitle: Optional subtitle text.
    ///   - description: Optional description text.
    ///   - slot: A customizable slot view.
    ///   - action: An action to handle tap action
    public init(
        mediaType: PosterCardMediaType,
        themeVariant: PosterCardThemeVariant = .none,
        aspectRatio: PosterCardAspectRatio = .ratio7to10,
        assetType: PosterCardAssetType = .none,
        tag: Tag? = nil,
        preTitle: String? = nil,
        title: String,
        subTitle: String? = nil,
        description: String? = nil,
        @ViewBuilder slot: () -> Slot = { EmptyView() },
        action: @escaping PosterCardCallback = {}
    ) {
        self.mediaType = mediaType
        self.themeVariant = themeVariant
        self.aspectRatio = aspectRatio
        self.assetType = assetType
        self.tag = tag
        self.preTitle = preTitle
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.slot = slot()
        self.action = action
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

    var assetColor: Color {
        switch themeVariant {
        case .none:
            return .neutralMedium
        case .inverse:
            return .textPrimary
        case .overAlternative:
            return .textPrimary
        case .overInverse:
            return .textPrimaryInverse
        }
    }

    var borderColor: Color {
        switch themeVariant {
        case .none:
            return .border
        case .inverse,
             .overInverse,
             .overAlternative:
            return .clear
        }
    }

    var borderWidth: CGFloat {
        switch themeVariant {
        case .none:
            return 1.0
        case .inverse,
             .overInverse,
             .overAlternative:
            return .zero
        }
    }

    // MARK: - View Body

    public var body: some View {
        Button(action: { action() }) {
            VStack(alignment: .leading, spacing: .zero) {
                HStack(alignment: .top, spacing: .zero) {
                    assetView
                        .padding(.top, Constants.spacing)
                        .accessibilityLabel(assetAccessibilityLabel)
                        .accessibilityIdentifier(assetAccessibilityIdentifier)
                    
                    Spacer()
                    
                    topActionsView
                }
                .padding(.top, Constants.spacing)
                .padding(.leading, Constants.spacing * 2)
                .padding(.trailing, Constants.spacing)

                Spacer()
                    .frame(maxHeight: .infinity)

                VStack(alignment: .leading, spacing: Constants.spacing) {
                    if let tag = tag {
                        tag
                            .inverse(true)
                            .padding(.bottom, Constants.spacing)
                            .accessibilityLabel(tagAccessibilityLabel)
                            .accessibilityIdentifier(tagAccessibilityIdentifier)
                    }

                    if let preTitle = preTitle {
                        Text(preTitle)
                            .font(.textPreset2(weight: .regular))
                            .foregroundColor(textPrimaryColor)
                            .padding(.bottom, -Constants.spacing)
                            .lineLimit(Constants.defaultLineLimit)
                            .fixedSize(horizontal: false, vertical: true)
                            .accessibilityLabel(preTitleAccessibilityLabel)
                            .accessibilityIdentifier(preTitleAccessibilityIdentifier)
                    }

                    Text(title)
                        .font(.textPreset4(weight: .regular))
                        .foregroundColor(textPrimaryColor)
                        .lineLimit(Constants.longerLineLimit)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityLabel(titleAccessibilityLabel)
                        .accessibilityIdentifier(titleAccessibilityIdentifier)

                    if let subTitle = subTitle {
                        Text(subTitle)
                            .font(.textPreset2(weight: .regular))
                            .foregroundColor(textPrimaryColor)
                            .lineLimit(Constants.defaultLineLimit)
                            .fixedSize(horizontal: false, vertical: true)
                            .accessibilityLabel(subtitleAccessibilityLabel)
                            .accessibilityIdentifier(subtitleAccessibilityIdentifier)
                    }
                    if let description = description {
                        Text(description)
                            .font(.textPreset2(weight: .regular))
                            .foregroundColor(textPrimaryColor)
                            .lineLimit(Constants.longerLineLimit)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .accessibilityLabel(descriptionAccessibilityLabel)
                            .accessibilityIdentifier(descriptionAccessibilityIdentifier)
                    }
                    if hasSlotView {
                        slot
                            .padding(.top, Constants.spacing * 2)
                    }
                }
                .padding(.top, Constants.spacing * 4)
                .padding(.horizontal, Constants.spacing * 2)
                .padding(.bottom, Constants.spacing * 3)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .aspectRatio(aspectRatio.value, contentMode: .fill)
            .background(
                ZStack(alignment: .center) {
                    mediaContent
                    mediaContentOverlay
                }
            )
            .fixedSize(horizontal: false, vertical: true)
            .border(borderColor, width: borderWidth)
            .round(radiusStyle: .container)
        }
        .buttonStyle(PosterCardButtonStyle())
    }
}

public extension PosterCard {
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

    func tagAccessibilityLabel(_ tagAccessibilityLabel: String?) -> Self {
        var view = self
        view.tagAccessibilityLabel = tagAccessibilityLabel
        return view
    }

    func tagAccessibilityIdentifier(_ tagAccessibilityIdentifier: String?) -> Self {
        var view = self
        view.tagAccessibilityIdentifier = tagAccessibilityIdentifier
        return view
    }

    func preTitleAccessibilityLabel(_ preTitleAccessibilityLabel: String?) -> Self {
        var view = self
        view.preTitleAccessibilityLabel = preTitleAccessibilityLabel
        return view
    }

    func preTitleAccessibilityIdentifier(_ preTitleAccessibilityIdentifier: String?) -> Self {
        var view = self
        view.preTitleAccessibilityIdentifier = preTitleAccessibilityIdentifier
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

    func subtitleAccessibilityLabel(_ subtitleAccessibilityLabel: String?) -> Self {
        var view = self
        view.subtitleAccessibilityLabel = subtitleAccessibilityLabel
        return view
    }

    func subtitleAccessibilityIdentifier(_ subtitleAccessibilityIdentifier: String?) -> Self {
        var view = self
        view.subtitleAccessibilityIdentifier = subtitleAccessibilityIdentifier
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

    func themeVariant(_ themeVariant: PosterCardThemeVariant) -> Self {
        var view = self
        view.themeVariant = themeVariant
        return view
    }
}

private extension PosterCard {
    var hasSlotView: Bool {
        !(slot is EmptyView)
    }

    /// Determines whether to display the poster image while the video loads.
    var shouldShowPosterImage: Bool {
        videoPlayerStatus == .unknown || videoPlayerStatus == .failed
    }

    /// Determines whether video controls should be shown based on autoplay and video duration.
    func shouldShowVideoControls(with parameters: PosterCardVideoPlayer.Parameters) -> Bool {
        parameters.autoplay && videoPlayerDuration >= Constants.minVideoPlayerDurationToShowControls
    }

    /// Provides the appropriate icon for the video player's top action.
    var videoPlayerTopActionIcon: String? {
        switch videoPlayerStatus {
        case .playing:
            return "pause"
        case .paused,
             .readyToPlay:
            return "play"
        case .unknown,
             .failed:
            return nil
        }
    }

    @ViewBuilder
    var mediaContent: some View {
        switch mediaType {
        case let .image(image, _):
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        case let .video(url, parameters):
            ZStack(alignment: .topLeading) {
                if let posterImage = parameters.posterImage, shouldShowPosterImage {
                    posterImage
                } else if videoPlayerStatus == .failed {
                    Color.backgroundSkeleton
                    Image(systemName: "video.slash")
                }
                PosterCardVideoPlayer(
                    url: url,
                    parameters: parameters,
                    playerStatus: $videoPlayerStatus,
                    playerDuration: $videoPlayerDuration
                )
                .misticaBackport.onScrollVisibilityChange(threshold: Constants.minScrollVisibilityChangeThresholdToPlayVideo) { isVisible in
                    if parameters.autoplay, isVisible {
                        videoPlayerStatus = .playing
                    } else if videoPlayerStatus == .playing {
                        videoPlayerStatus = .paused
                    }
                }
                .aspectRatio(parameters.aspectRatio, contentMode: parameters.contentMode)
            }
        case let .customColor(color, _):
            color
        case let .skinColor(skinColor, _):
            switch skinColor {
            case .none:
                if themeVariant == .inverse {
                    misticaColorView(.backgroundBrand)
                } else {
                    Color.backgroundContainer
                }
            case .promo:
                Color.promo
            case .success:
                Color.success
            case .warning:
                Color.warning
            case .error:
                Color.error
            }
        }
    }

    @ViewBuilder
    var mediaContentOverlay: some View {
        switch mediaType {
        case .image,
             .video:
            gradientView
        case .customColor,
             .skinColor:
            EmptyView()
        }
    }

    @ViewBuilder
    var topActionsView: some View {
        switch mediaType {
        case .video where videoPlayerStatus == .failed:
            EmptyView()
        case .video where videoPlayerStatus == .unknown:
            TopActionButton(type: .loading)
        case let .video(_, parameters):
            if shouldShowVideoControls(with: parameters), let videoPlayerTopActionIcon {
                TopActionButton(type: .action(.init(
                    icon: Image(systemName: videoPlayerTopActionIcon),
                    callback: {
                        if videoPlayerStatus != .playing {
                            videoPlayerStatus = .playing
                        } else {
                            videoPlayerStatus = .paused
                        }
                    }
                )))
            } else {
                EmptyView()
            }
        case let .image(_, topActions),
             let .customColor(_, topActions),
             let .skinColor(_, topActions):
            switch topActions {
            case .none:
                EmptyView()
            case let .dismiss(onDismiss):
                TopActionButton(type: .dismiss(onDismiss))
            case let .dismissAndAction(onDismiss, topAction):
                HStack(spacing: .zero) {
                    TopActionButton(type: .action(topAction))
                    TopActionButton(type: .dismiss(onDismiss))
                }
            case let .oneAction(topAction):
                TopActionButton(type: .action(topAction))
            case let .twoActions(firstTopAction, secondTopAction):
                HStack(spacing: .zero) {
                    TopActionButton(type: .action(firstTopAction))
                    TopActionButton(type: .action(secondTopAction))
                }
            }
        }
    }

    @ViewBuilder
    var assetView: some View {
        switch assetType {
        case let .image(image):
            image
                .resizable()
                .scaledToFit()
                .frame(width: Constants.assetTypeImageSize, height: Constants.assetTypeImageSize)

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

        case .none:
            EmptyView()
        }
    }

    var gradientView: some View {
        GeometryReader { proxy in
            VStack(spacing: .zero) {
                Spacer()
                    .frame(height: proxy.size.height * (1 - Constants.gradientHeightPercentage))

                misticaColorView(.cardContentOverlay)
                    .frame(minHeight: Constants.gradientMinHeight)
                    .frame(height: proxy.size.height * Constants.gradientHeightPercentage)
            }
        }
    }
}

// MARK: - Public Types

/// A callback type for handling user interactions on `PosterCard`.
public typealias PosterCardCallback = () -> Void

/// Represents the media type that can be displayed within a `PosterCard`.
public enum PosterCardMediaType {
    /// A static image with optional top actions.
    case image(Image, topActions: PosterCardTopActions = .none)

    /// A video with parameters for playback customization.
    case video(URL, parameters: PosterCardVideoPlayer.Parameters)

    /// A custom color block with optional top actions.
    case customColor(Color, topActions: PosterCardTopActions = .none)

    /// A themed skin color with optional top actions.
    case skinColor(PosterCardSkinColors, topActions: PosterCardTopActions = .none)
}

/// Represents top-level actions available for a `PosterCard`.
public enum PosterCardTopActions: Equatable {
    /// No actions.
    case none

    /// A dismiss action.
    case dismiss(PosterCardCallback)

    /// A dismiss action followed by another action.
    case dismissAndAction(PosterCardCallback, PosterCardAction)

    /// A single custom action.
    case oneAction(PosterCardAction)

    /// Two custom actions.
    case twoActions(PosterCardAction, PosterCardAction)

    public static func == (lhs: PosterCardTopActions, rhs: PosterCardTopActions) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.dismiss, .dismiss):
            return true // We cannot compare PosterCardCallback
        case let (.dismissAndAction(_, action1), .dismissAndAction(_, action2)):
            return action1 == action2 // Only compare PosterCardAction
        case let (.oneAction(action1), .oneAction(action2)):
            return action1 == action2
        case let (.twoActions(action1a, action1b), .twoActions(action2a, action2b)):
            return action1a == action2a && action1b == action2b
        default:
            return false
        }
    }
}

/// Represents an individual action on a `PosterCard`.
public struct PosterCardAction: Equatable {
    /// The icon associated with the action.
    let icon: Image

    /// The callback invoked when the action is triggered.
    let callback: PosterCardCallback

    /// Initializes a `PosterCardAction` with an icon and a callback.
    ///
    /// - Parameters:
    ///   - icon: The icon to display for the action.
    ///   - callback: The callback to invoke when the action is selected.
    public init(icon: Image, callback: @escaping PosterCardCallback) {
        self.icon = icon
        self.callback = callback
    }

    public static func == (lhs: PosterCardAction, rhs: PosterCardAction) -> Bool {
        lhs.icon == rhs.icon // Compare only the `icon` property
    }
}

/// Represents the header asset type in a `PosterCard`.
public enum PosterCardAssetType: Equatable {
    /// No asset.
    case none

    /// An icon with optional foreground and background colors.
    case icon(image: Image, foregroundColor: Color? = nil, backgroundColor: Color? = nil)

    /// A standalone image.
    case image(Image)
}

/// Defines aspect ratio options for the `PosterCard`.
public enum PosterCardAspectRatio {
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

// MARK: - Private Components

/// Enum representing the type of top action button.
private enum TopActionType {
    case action(PosterCardAction)
    case loading
    case dismiss(PosterCardCallback?)
}

/// A versatile button for top actions in the `PosterCard`.
private struct TopActionButton: View {
    /// The type of action this button represents.
    let type: TopActionType

    /// Defines the body of the button.
    var body: some View {
        Button(action: actionCallback) {
            content
        }
        .buttonStyle(TopActionButtonStyle())
    }

    /// Determines the button's content based on its type.
    @ViewBuilder
    private var content: some View {
        switch type {
        case .action(let action):
            action.icon.renderingMode(.template)
        case .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
        case .dismiss:
            Image(systemName: "xmark").renderingMode(.template)
        }
    }

    /// Determines the action callback based on the button type.
    private var actionCallback: () -> Void {
        switch type {
        case .action(let action):
            return action.callback
        case .dismiss(let dismissAction):
            return { dismissAction?() }
        case .loading:
            return {}
        }
    }
}

// MARK: - Private Extensions

private struct TopActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .topActionButtonStyle(isPressed: configuration.isPressed)
    }
}

private struct PosterCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .posterCardButtonStyle(isPressed: configuration.isPressed)
    }
}

private extension View {
    /// Applies a standard style to top action icons.
    func topActionButtonStyle(isPressed: Bool) -> some View {
        frame(width: Constants.topActionIconSize, height: Constants.topActionIconSize, alignment: .center)
            .foregroundColor(.neutralHigh)
            .background(Color.inverse.opacity(isPressed ? Constants.topActionPressedBackgroundOpacity : Constants.topActionDefaultBackgroundOpacity))
            .clipShape(Circle())
            .animation(.easeInOut(duration: Constants.topActionAnimationDuration), value: isPressed)
            .padding(Constants.spacing)
    }

    func posterCardButtonStyle(isPressed: Bool) -> some View {
        overlay(
            Color.coverBackgroundPressed
                .opacity(isPressed ? Constants.posterCardPressedBackgroundOpacity : Constants.posterCardDefaultBackgroundOpacity)
                .round(radiusStyle: .container)
        )
        .animation(.easeInOut(duration: Constants.posterCardAnimationDuration), value: isPressed)
    }
}

#Preview {
    ScrollView(showsIndicators: false) {
        PosterCard(
            mediaType: .video(
                URL(string: "https://www.apple.com/105/media/us/airpods/2024/b4e8e99e-af2c-413e-84d4-50a9a5ee4fe3/anim/airpods/large.mp4")!,
                parameters: .init(
                    loop: true,
                    muted: true,
                    autoplay: false,
                    posterImage: Image(.airpods)
                )
            ),
            aspectRatio: .custom(4.0 / 3.0),
            title: "Airpods"
        )

        PosterCard(
            mediaType: .image(Image(.airpods), topActions: .dismiss {}),
            aspectRatio: .custom(4.0 / 3.0),
            title: "Airpods"
        )
    }
    .padding()
}
