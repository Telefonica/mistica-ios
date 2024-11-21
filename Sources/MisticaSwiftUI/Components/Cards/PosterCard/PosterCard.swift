//
//  DataCard.swift
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
    static let lineLimit: Int = 2
    static let spacing: CGFloat = 8
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
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: .zero) {
                assetView
                    .accessibilityLabel(assetAccessibilityLabel)
                    .accessibilityIdentifier(assetAccessibilityIdentifier)
                
                Spacer()
                    .frame(minHeight: Constants.spacing * 5)
                
                if let tag = tag {
                    tag
                        .inverse(true)
                        .padding(.bottom, Constants.spacing * 2)
                        .accessibilityLabel(tagAccessibilityLabel)
                        .accessibilityIdentifier(tagAccessibilityIdentifier)
                }
                
                if let preTitle = preTitle {
                    Text(preTitle)
                        .font(.textPreset2(weight: .regular))
                        .foregroundColor(textPrimaryColor)
                        .padding(.bottom, Constants.spacing / 2)
                        .fixedSize(horizontal: true, vertical: false)
                        .accessibilityLabel(preTitleAccessibilityLabel)
                        .accessibilityIdentifier(preTitleAccessibilityIdentifier)
                }
                
                Text(title)
                    .font(.textPreset4(weight: .regular))
                    .foregroundColor(textPrimaryColor)
                    .lineLimit(Constants.lineLimit)
                    .padding(.bottom, Constants.spacing)
                    .fixedSize(horizontal: true, vertical: false)
                    .accessibilityLabel(titleAccessibilityLabel)
                    .accessibilityIdentifier(titleAccessibilityIdentifier)
                
                if let subTitle = subTitle {
                    Text(subTitle)
                        .font(.textPreset2(weight: .regular))
                        .foregroundColor(textPrimaryColor)
                        .fixedSize(horizontal: true, vertical: false)
                        .accessibilityLabel(subtitleAccessibilityLabel)
                        .accessibilityIdentifier(subtitleAccessibilityIdentifier)
                }
                if let description = description {
                    Text(description)
                        .font(.textPreset2(weight: .regular))
                        .foregroundColor(textPrimaryColor)
                        .lineLimit(Constants.lineLimit)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityLabel(descriptionAccessibilityLabel)
                        .accessibilityIdentifier(descriptionAccessibilityIdentifier)
                }
                if hasSlotView {
                    slot
                        .padding(.top, Constants.spacing * 2)
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .leading)
        }
        .padding(.horizontal, Constants.spacing * 2)
        .padding(.bottom, Constants.spacing * 3)
        .aspectRatio(aspectRatio.value, contentMode: .fill)
        .background(
            ZStack(alignment: .center) {
                mediaContent
                mediaContentOverlay
            }.onTapGesture(perform: action ?? {})
        )
        .fixedSize(horizontal: false, vertical: true)
        .border(borderColor, width: borderWidth)
        .round(radiusStyle: .container)
        .overlay(
            VStack(alignment: .trailing, spacing: .zero) {
                HStack(alignment: .top, spacing: .zero) {
                    Spacer()
                    topActionsView
                }
                Spacer()
            }
        )
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
            TopActionLoadingButton()
        case let .video(_, parameters):
            if shouldShowVideoControls(with: parameters), let videoPlayerTopActionIcon {
                TopActionButton(.init(
                    icon: Image(systemName: videoPlayerTopActionIcon),
                    callback: {
                        if videoPlayerStatus != .playing {
                            videoPlayerStatus = .playing
                        } else {
                            videoPlayerStatus = .paused
                        }
                    }
                ))
            } else {
                EmptyView()
            }
        case let .image(_, topActions),
             let .customColor(_, topActions),
             let .skinColor(_, topActions):
            Group {
                switch topActions {
                case .none:
                    EmptyView()
                case let .dismiss(onDismiss):
                    TopActionDismissButton(dismissAction: onDismiss)
                case let .dismissAndAction(onDismiss, topAction):
                    HStack(spacing: Constants.spacing * 2) {
                        TopActionButton(topAction)
                        TopActionDismissButton(dismissAction: onDismiss)
                    }
                case let .oneAction(topAction):
                    TopActionButton(topAction)
                case let .twoActions(firstTopAction, secondTopAction):
                    HStack(spacing: Constants.spacing * 2) {
                        TopActionButton(firstTopAction)
                        TopActionButton(secondTopAction)
                    }
                }
            }
            .padding(Constants.spacing * 2)
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
            .padding(.vertical, Constants.spacing)
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
public enum PosterCardTopActions {
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
}

/// Represents an individual action on a `PosterCard`.
public struct PosterCardAction {
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
}

/// Represents the header asset type in a `PosterCard`.
public enum PosterCardAssetType {
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

/// A button used for top actions in the `PosterCard`.
private struct TopActionButton: View {
    /// The top action associated with this button.
    let topAction: PosterCardAction
    
    /// Initializes the button with a specific action.
    ///
    /// - Parameter topAction: The action to associate with the button.
    init(_ topAction: PosterCardAction) {
        self.topAction = topAction
    }
    
    /// Defines the body of the button.
    var body: some View {
        Button(action: topAction.callback) {
            topAction.icon
                .renderingMode(.template)
                .topActionIconStyle()
        }
    }
}

/// A loading button for displaying progress in top actions.
private struct TopActionLoadingButton: View {
    var body: some View {
        Button(action: {}) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .neutralHigh))
                .topActionIconStyle()
        }
    }
}

/// A dismiss button for top actions in the `PosterCard`.
private struct TopActionDismissButton: View {
    /// The dismiss action callback.
    let dismissAction: PosterCardCallback?
    
    /// Defines the body of the dismiss button.
    var body: some View {
        Button(action: { dismissAction?() }) {
            Image(systemName: "xmark")
                .renderingMode(.template)
                .topActionIconStyle()
        }
    }
}

// MARK: - Private Extensions

private extension View {
    /// Applies a standard style to top action icons.
    func topActionIconStyle() -> some View {
        frame(width: Constants.topActionIconSize, height: Constants.topActionIconSize, alignment: .center)
            .foregroundColor(.neutralHigh)
            .background(Color.backgroundContainer)
            .clipShape(Circle())
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
            aspectRatio: .custom(4.0/3.0),
            title: "Airpods"
        )
        
        PosterCard(
            mediaType: .image(Image(.airpods), topActions: .dismiss({})),
            aspectRatio: .custom(4.0/3.0),
            title: "Airpods"
        )
    }
    .padding()
}
