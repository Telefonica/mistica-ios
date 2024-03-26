//
//  DataCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

// MARK: DataCardConfiguration

public struct DataCardConfiguration {
    @frozen
    public enum Buttons {
        case link(CardLinkButton)
        case primary(CardButton)
        case primaryAndLink(primary: CardButton, link: CardLinkButton)
    }

    @frozen
    public enum AssetType: Equatable {
        case none
        case image(UIImage)
        case icon(UIImage, backgroundColor: UIColor)
    }

    let asset: AssetType
    let headline: String?
    let title: String?
    let subtitle: String?
    let descriptionTitle: String?
    let buttons: Buttons?

    public init(
        asset: AssetType = .none,
        backgroundIcon: UIImage? = nil,
        headline: String? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        descriptionTitle: String? = nil,
        buttons: Buttons? = nil
    ) {
        self.asset = asset
        self.headline = headline
        self.title = title
        self.subtitle = subtitle
        self.descriptionTitle = descriptionTitle
        self.buttons = buttons
    }
}

// MARK: DataCard

public class DataCard: UIView {
    private enum Constants {
        static let spacingAfterIconView = CGFloat(0)
        static let cardLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: 16)
        static let iconLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        static let imageSize = CGFloat(40)
        static let largeIconSize = CGFloat(24)
    }

    private lazy var cardAccessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
    private let iconContainerView = UIView()
    private var iconImageView = DataCardAsset()
    private let cardBaseView = CardBase()

    public var fragmentView: UIView? {
        didSet {
            cardBaseView.fragmentView = fragmentView
        }
    }

    public var contentConfiguration: DataCardConfiguration? {
        didSet {
            if let contentConfiguration = contentConfiguration {
                configure(with: contentConfiguration)
            } else {
                configure(with: .emptyConfiguration)
            }
        }
    }

    override public var accessibilityElements: [Any]? {
        get {
            // We must set the frame and be sure it is already calculated.
            cardAccessibilityElement.accessibilityFrameInContainerSpace = bounds
            return [
                cardAccessibilityElement,
                cardBaseView
            ].compactMap { $0 }
        }
        set {}
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        setMisticaRadius(.container)
        clipsToBounds = true
    }

    override public var intrinsicContentSize: CGSize {
        cardBaseView.intrinsicContentSize
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        addBorder(color: .border)
    }
}

// MARK: Public

public extension DataCard {
    var iconContentMode: UIView.ContentMode {
        get {
            iconImageView.contentMode
        }
        set {
            iconImageView.contentMode = newValue
        }
    }

    var primaryButton: Button {
        cardBaseView.buttonsView.primaryButton
    }

    var linkButton: Button {
        cardBaseView.buttonsView.linkButton
    }

    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            cardAccessibilityElement.accessibilityTraits
        }
        set {
            cardAccessibilityElement.accessibilityTraits = newValue
        }
    }

    var headlineIdentifier: String? {
        get {
            cardBaseView.contentView.headlineIdentifier
        }
        set {
            cardBaseView.contentView.headlineIdentifier = newValue == nil ? DataCardAccessibilityIdentifiers.headline.rawValue : newValue
            if newValue == nil {
                cardBaseView.contentView.headlineIdentifier = DataCardAccessibilityIdentifiers.headline.rawValue
            }
        }
    }

    var titleIdentifier: String? {
        get {
            cardBaseView.contentView.titleIdentifier
        }
        set {
            cardBaseView.contentView.titleIdentifier = newValue == nil ? DataCardAccessibilityIdentifiers.title.rawValue : newValue
            if newValue == nil {
                cardBaseView.contentView.titleIdentifier = DataCardAccessibilityIdentifiers.title.rawValue
            }
        }
    }

    var subtitleIdentifier: String? {
        get {
            cardBaseView.contentView.subtitleIdentifier
        }
        set {
            cardBaseView.contentView.subtitleIdentifier = newValue == nil ? DataCardAccessibilityIdentifiers.subtitle.rawValue : newValue
            if newValue == nil {
                cardBaseView.contentView.subtitleIdentifier = DataCardAccessibilityIdentifiers.subtitle.rawValue
            }
        }
    }

    var descriptionIdentifier: String? {
        get {
            cardBaseView.contentView.descriptionIdentifier
        }
        set {
            cardBaseView.contentView.descriptionIdentifier = newValue == nil ? DataCardAccessibilityIdentifiers.description.rawValue : newValue
            if newValue == nil {
                cardBaseView.contentView.descriptionIdentifier = DataCardAccessibilityIdentifiers.description.rawValue
            }
        }
    }
}

// MARK: Private

private extension DataCard {
    func commomInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        directionalLayoutMargins = Constants.cardLayoutMargins
        insetsLayoutMarginsFromSafeArea = false

        addSubview(constrainedToLayoutMarginsGuideOf: cardBaseView)

        iconContainerView.directionalLayoutMargins = Constants.iconLayoutMargins
        iconContainerView.insetsLayoutMarginsFromSafeArea = false

        iconContainerView.addSubview(iconImageView, constraints: [
            iconImageView.topAnchor.constraint(equalTo: iconContainerView.layoutMarginsGuide.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: iconContainerView.layoutMarginsGuide.leadingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: iconContainerView.layoutMarginsGuide.bottomAnchor)
        ])
    }

    func styleViews() {
        backgroundColor = .backgroundContainer
        cardBaseView.contentView.backgroundColor = .backgroundContainer

        cardBaseView.contentView.headlineTopSpacing = 8
        cardBaseView.contentView.headlineTagView.accessibilityIdentifier = DataCardAccessibilityIdentifiers.headline.rawValue

        cardBaseView.contentView.titleLabel.font = .textPreset4(weight: .cardTitle)
        cardBaseView.contentView.titleLabel.textColor = .textPrimary
        cardBaseView.contentView.titleLabel.minHeight = 24
        cardBaseView.contentView.titleLabel.numberOfLines = 2
        cardBaseView.contentView.titleLabel.topSpacing = 4
        cardBaseView.contentView.titleLabel.accessibilityIdentifier = DataCardAccessibilityIdentifiers.title.rawValue

        cardBaseView.contentView.subtitleLabel.font = .textPreset2(weight: .regular)
        cardBaseView.contentView.subtitleLabel.textColor = .textPrimary
        cardBaseView.contentView.subtitleLabel.minHeight = 20
        cardBaseView.contentView.subtitleLabel.numberOfLines = 0
        cardBaseView.contentView.subtitleLabel.topSpacing = 4
        cardBaseView.contentView.subtitleLabel.accessibilityIdentifier = DataCardAccessibilityIdentifiers.subtitle.rawValue

        cardBaseView.contentView.descriptionLabel.font = .textPreset2(weight: .regular)
        cardBaseView.contentView.descriptionLabel.textColor = .textSecondary
        cardBaseView.contentView.descriptionLabel.minHeight = 20
        cardBaseView.contentView.descriptionLabel.numberOfLines = 3
        cardBaseView.contentView.descriptionLabel.topSpacing = 8
        cardBaseView.contentView.descriptionLabel.accessibilityIdentifier = DataCardAccessibilityIdentifiers.description.rawValue

        addBorder(color: .border)
    }

    func configure(with configuration: DataCardConfiguration) {
        if configuration.asset != .none {
            if iconContainerView.superview == nil {
                cardBaseView.insertArrangedSubview(iconContainerView, at: 0)
                cardBaseView.setCustomSpacing(Constants.spacingAfterIconView, after: iconContainerView)
            }
            iconImageView.assetType = configuration.asset
        } else {
            iconContainerView.removeFromSuperview()
            iconImageView.assetType = .none
        }

        cardBaseView.headline = configuration.headline
        cardBaseView.title = configuration.title
        cardBaseView.subtitle = configuration.subtitle
        cardBaseView.descriptionTitle = configuration.descriptionTitle

        switch configuration.buttons {
        case .link(let linkButton):
            cardBaseView.configureButtons(primaryButton: nil, linkButton: linkButton)
        case .primary(let primaryButton):
            cardBaseView.configureButtons(primaryButton: primaryButton, linkButton: nil)
        case .primaryAndLink(let primaryButton, let linkButton):
            cardBaseView.configureButtons(primaryButton: primaryButton, linkButton: linkButton)
        case .none:
            cardBaseView.configureButtons(primaryButton: nil, linkButton: nil)
        }

        cardAccessibilityElement.accessibilityLabel = [
            configuration.headline,
            configuration.title,
            configuration.subtitle,
            configuration.descriptionTitle
        ].compactMap { $0 }.joined(separator: " ")
    }
}

private extension DataCardConfiguration {
    static let emptyConfiguration = DataCardConfiguration(
        title: "",
        descriptionTitle: "",
        buttons: .link(
            CardLinkButton(title: "", accessibilityIdentifier: nil, tapHandler: nil)
        )
    )
}
