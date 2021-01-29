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
        static let cornerRadius = CGFloat(4)
        static let cardLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
        static let spacingAfterRichMediaView = CGFloat(8)
    }

    private var richMediaContainerView = UIView()
    private let baseCardView = CardBase()

    public var fragmentView: UIView? {
        didSet {
            baseCardView.fragmentView = fragmentView
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
    var primaryButtonState: Button.State {
        get {
            baseCardView.buttonsView.primaryButtonState
        }
        set {
            baseCardView.buttonsView.primaryButtonState = newValue
        }
    }

    var linkButtonState: Button.State {
        get {
            baseCardView.buttonsView.linkButtonState
        }
        set {
            baseCardView.buttonsView.linkButtonState = newValue
        }
    }
}

// MARK: Private

private extension MediaCard {
    func commomInit() {
        layoutViews()
        styleViews()
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
        backgroundColor = .background

        baseCardView.contentView.headlineTopSpacing = 8
        
        baseCardView.contentView.titleLabel.font = .textPreset8(weight: .regular)
        baseCardView.contentView.titleLabel.textColor = .textPrimary
        baseCardView.contentView.titleLabel.minHeight = 16
        baseCardView.contentView.titleLabel.numberOfLines = 0
        baseCardView.contentView.titleTopSpacing = 8

        baseCardView.contentView.subtitleLabel.font = .textPreset5(weight: .light)
        baseCardView.contentView.subtitleLabel.textColor = .textPrimary
        baseCardView.contentView.subtitleLabel.minHeight = 24
        baseCardView.contentView.subtitleLabel.numberOfLines = 0
        baseCardView.contentView.subtitleTopSpacing = 4

        baseCardView.contentView.descriptionLabel.font = .textPreset7(weight: .regular)
        baseCardView.contentView.descriptionLabel.textColor = .textSecondary
        baseCardView.contentView.descriptionLabel.minHeight = 20
        baseCardView.contentView.descriptionLabel.numberOfLines = 0
        baseCardView.contentView.descriptionTitleTopSpacing = 8
        
        richMediaContainerView.clipsToBounds = true
        
        addBorder()
    }

    func configure(with configuration: MediaCardConfiguration) {
        richMediaContainerView.subviews.first?.removeFromSuperview()

        richMediaContainerView.addSubview(withDefaultConstraints: configuration.richMedia)

        baseCardView.headline = configuration.headline
        baseCardView.title = configuration.pretitle?.uppercased()
        baseCardView.subtitle = configuration.title
        baseCardView.descriptionTitle = configuration.descriptionTitle

        baseCardView.configureButtons(primaryButton: configuration.button, linkButton: configuration.link)
    }
}

private extension MediaCardConfiguration {
    static let emptyConfiguration = MediaCardConfiguration(richMedia: UIView(), descriptionTitle: "")
}
