//
//  MediaCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
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
    let button: CardAction?
    let link: CardAction?

    public init(
        richMedia: UIView,
        headline: String? = nil,
        title: String? = nil,
        pretitle: String? = nil,
        descriptionTitle: String,
        button: CardAction? = nil,
        link: CardAction? = nil
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
    func configure(with configuration: MediaCardConfiguration) {
        richMediaContainerView.subviews.first?.removeFromSuperview()

        richMediaContainerView.addSubview(withDefaultConstraints: configuration.richMedia)

        baseCardView.headline = configuration.headline
        baseCardView.title = configuration.pretitle?.uppercased()
        baseCardView.subtitle = configuration.title
        baseCardView.descriptionTitle = configuration.descriptionTitle

        baseCardView.configureActions(primaryAction: configuration.button, linkAction: configuration.link)
    }

    var primaryActionState: Button.State {
        get {
            baseCardView.actionsView.buttonState
        }
        set {
            baseCardView.actionsView.buttonState = newValue
        }
    }

    var linkActionState: Button.State {
        get {
            baseCardView.actionsView.linkState
        }
        set {
            baseCardView.actionsView.linkState = newValue
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

        baseCardView.contentView.titleLabel.font = .textPreset8(weight: .regular)
        baseCardView.contentView.titleLabel.textColor = .textPrimary
        baseCardView.contentView.titleLabel.minHeight = 16
        baseCardView.contentView.titleLabel.numberOfLines = 0

        baseCardView.contentView.subtitleLabel.font = .textPreset5(weight: .light)
        baseCardView.contentView.subtitleLabel.textColor = .textPrimary
        baseCardView.contentView.subtitleLabel.minHeight = 24
        baseCardView.contentView.subtitleLabel.numberOfLines = 0

        baseCardView.contentView.descriptionLabel.font = .textPreset7(weight: .regular)
        baseCardView.contentView.descriptionLabel.textColor = .textSecondary
        baseCardView.contentView.descriptionLabel.minHeight = 20
        baseCardView.contentView.descriptionLabel.numberOfLines = 0
    }
}
