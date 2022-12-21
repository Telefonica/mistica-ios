//
//  MediaCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

// MARK: MediaCardConfiguration

public struct MediaCardConfiguration {
    let richMedia: UIView
    let headline: String?
    let title: String?
    let pretitle: String?
    let descriptionTitle: String
    let button: CardButton?
    let link: CardLinkButton?

    public init(
        richMedia: UIView,
        headline: String? = nil,
        title: String? = nil,
        pretitle: String? = nil,
        descriptionTitle: String,
        button: CardButton? = nil,
        link: CardLinkButton? = nil
    ) {
        self.richMedia = richMedia
        self.headline = headline
        self.title = title
        self.pretitle = pretitle
        self.descriptionTitle = descriptionTitle
        self.button = button
        self.link = link
    }
}

// MARK: MediaCard

public class MediaCard: UIView {
    private enum Constants {
        static let cornerRadius = CGFloat(8)
        static let cardLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
        static let spacingAfterRichMediaView = CGFloat(8)
    }

    private lazy var cardAccessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
    private var richMediaContainerView = UIView()
    private let baseCardView = CardBase()

    public var fragmentView: UIView? {
        didSet {
            baseCardView.fragmentView = fragmentView
        }
    }

    override public var accessibilityElements: [Any]? {
        get {
            cardAccessibilityElement.accessibilityFrameInContainerSpace = bounds
            return [
                cardAccessibilityElement,
                fragmentView as Any,
                baseCardView.buttonsView
            ].compactMap { $0 }
        }
        set {}
    }
    
    public var reachMediaAccessibilityIdentifier: String? {
        get {
            richMediaContainerView.accessibilityIdentifier
        }
        set {
            richMediaContainerView.accessibilityIdentifier = newValue
        }
    }

    public var headlineAccessibilityIdentifier: String? {
        get {
            baseCardView.contentView.headlineAccessibilityIdentifier
        }
        set {
            baseCardView.contentView.headlineAccessibilityIdentifier = newValue
        }
    }

    public var pretitleAccessibilityIdentifier: String? {
        get {
            baseCardView.contentView.titleAccessibilityIdentifier
        }
        set {
            baseCardView.contentView.titleAccessibilityIdentifier = newValue
        }
    }

    public var titleAccessibilityIdentifier: String? {
        get {
            baseCardView.contentView.subtitleAccessibilityIdentifier
        }
        set {
            baseCardView.contentView.subtitleAccessibilityIdentifier = newValue
        }
    }

    public var descriptionAccessibilityIdentifier: String? {
        get {
            baseCardView.contentView.descriptionAccessibilityIdentifier
        }
        set {
            baseCardView.contentView.descriptionAccessibilityIdentifier = newValue
        }
    }

    public var primaryButtonAccessibilityIdentifier: String? {
        get {
            baseCardView.buttonsView.primaryButtonAccessibilityIdentifier
        }
        set {
            baseCardView.buttonsView.primaryButtonAccessibilityIdentifier = newValue
        }
    }

    public var linkButtonAccessibilityIdentifier: String? {
        get {
            baseCardView.buttonsView.linkButtonAccessibilityIdentifier
        }
        set {
            baseCardView.buttonsView.linkButtonAccessibilityIdentifier = newValue
        }
    }

    public var contentConfiguration: MediaCardConfiguration? {
        didSet {
            if let contentConfiguration = contentConfiguration {
                configure(with: contentConfiguration)
            } else {
                configure(with: .emptyConfiguration)
            }
        }
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
        makeRounded(cornerRadius: Constants.cornerRadius)
    }
}

// MARK: Public

public extension MediaCard {
    var primaryButton: Button {
        baseCardView.buttonsView.primaryButton
    }

    var linkButton: Button {
        baseCardView.buttonsView.linkButton
    }

    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            cardAccessibilityElement.accessibilityTraits
        }
        set {
            cardAccessibilityElement.accessibilityTraits = newValue
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        addBorder(color: .border)
    }
}

// MARK: Private

private extension MediaCard {
    func commomInit() {
        layoutViews()
        styleViews()
        
        addDefaultAccessibilityIds()
    }

    func layoutViews() {
        directionalLayoutMargins = Constants.cardLayoutMargins
        insetsLayoutMarginsFromSafeArea = false

        addSubview(richMediaContainerView, constraints: [
            richMediaContainerView.topAnchor.constraint(equalTo: topAnchor),
            richMediaContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            richMediaContainerView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        addSubview(baseCardView, constraints: [
            baseCardView.topAnchor.constraint(equalTo: richMediaContainerView.bottomAnchor, constant: Constants.spacingAfterRichMediaView),
            baseCardView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            baseCardView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            baseCardView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor)
        ])
    }

    func styleViews() {
        backgroundColor = .backgroundContainer
        baseCardView.contentView.backgroundColor = .backgroundContainer

        baseCardView.contentView.headlineTopSpacing = 8

        baseCardView.contentView.titleLabel.font = .textPreset1(weight: .regular)
        baseCardView.contentView.titleLabel.textColor = .textPrimary
        baseCardView.contentView.titleLabel.minHeight = 16
        baseCardView.contentView.titleLabel.numberOfLines = 0
        baseCardView.contentView.titleTopSpacing = 8

        baseCardView.contentView.subtitleLabel.font = .textPreset4(weight: .regular)
        baseCardView.contentView.subtitleLabel.textColor = .textPrimary
        baseCardView.contentView.subtitleLabel.minHeight = 24
        baseCardView.contentView.subtitleLabel.numberOfLines = 0
        baseCardView.contentView.subtitleTopSpacing = 4

        baseCardView.contentView.descriptionLabel.font = .textPreset2(weight: .regular)
        baseCardView.contentView.descriptionLabel.textColor = .textSecondary
        baseCardView.contentView.descriptionLabel.minHeight = 20
        baseCardView.contentView.descriptionLabel.numberOfLines = 0
        baseCardView.contentView.descriptionTitleTopSpacing = 8

        richMediaContainerView.clipsToBounds = true

        addBorder(color: .border)
    }
    
    func addDefaultAccessibilityIds() {
        richMediaContainerView.isAccessibilityElement = true
        richMediaContainerView.accessibilityIdentifier = DefaultIdentifiers.MediaCard.asset
        baseCardView.contentView.headlineAccessibilityIdentifier = DefaultIdentifiers.MediaCard.headline
        baseCardView.contentView.titleAccessibilityIdentifier = DefaultIdentifiers.MediaCard.pretitle
        baseCardView.contentView.subtitleAccessibilityIdentifier = DefaultIdentifiers.MediaCard.title
        baseCardView.contentView.descriptionAccessibilityIdentifier = DefaultIdentifiers.MediaCard.description
        baseCardView.buttonsView.primaryButtonAccessibilityIdentifier = DefaultIdentifiers.MediaCard.primaryButton
        baseCardView.buttonsView.linkButtonAccessibilityIdentifier = DefaultIdentifiers.MediaCard.linkButton
    }

    func configure(with configuration: MediaCardConfiguration) {
        richMediaContainerView.subviews.first?.removeFromSuperview()

        richMediaContainerView.addSubview(withDefaultConstraints: configuration.richMedia)

        baseCardView.headline = configuration.headline
        baseCardView.title = configuration.pretitle?.uppercased()
        baseCardView.subtitle = configuration.title
        baseCardView.descriptionTitle = configuration.descriptionTitle

        baseCardView.configureButtons(primaryButton: configuration.button, linkButton: configuration.link)

        cardAccessibilityElement.accessibilityLabel = [
            baseCardView.headline,
            baseCardView.title,
            baseCardView.subtitle,
            baseCardView.descriptionTitle
        ].compactMap { $0 }.joined(separator: " ")
    }
}

private extension MediaCardConfiguration {
    static let emptyConfiguration = MediaCardConfiguration(richMedia: UIView(), descriptionTitle: "")
}
