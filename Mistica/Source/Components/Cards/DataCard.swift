//
//  DataCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

public struct DataCardConfiguration {
    let icon: UIImage?
    let headline: String?
    let title: String
    let subtitle: String?
    let descriptionTitle: String
    let button: CardAction?
    let link: CardAction?

    public init(
        icon: UIImage? = nil,
        headline: String? = nil,
        title: String,
        subtitle: String? = nil,
        descriptionTitle: String,
        button: CardAction? = nil,
        link: CardAction? = nil
    ) {
        self.icon = icon
        self.headline = headline
        self.title = title
        self.subtitle = subtitle
        self.descriptionTitle = descriptionTitle
        self.button = button
        self.link = link
    }
}

public class DataCard: UIView {
    var iconImageView = IntrinsictImageView()
    let iconContainerView = UIView()
    let baseCardView = BaseCard()

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
        makeRounded(cornerRadius: 4)
    }
}

// MARK: Public

public extension DataCard {
    func configure(with configuration: DataCardConfiguration) {
        if let icon = configuration.icon {
            if iconContainerView.superview == nil {
                baseCardView.insertArrangedSubview(iconContainerView, at: 0)
                baseCardView.setCustomSpacing(0, after: iconContainerView)
            }
            iconImageView.image = icon
        } else {
            iconContainerView.removeFromSuperview()
            iconImageView.image = nil
        }

        baseCardView.headline = configuration.headline
        baseCardView.title = configuration.title
        baseCardView.subtitle = configuration.subtitle
        baseCardView.descriptionTitle = configuration.descriptionTitle

        baseCardView.configureActions(primaryAction: configuration.button, linkAction: configuration.link)
    }

    var iconContentMode: UIView.ContentMode {
        get {
            iconImageView.contentMode
        }
        set {
            iconImageView.contentMode = newValue
        }
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

private extension DataCard {
    func commomInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: 16)
        insetsLayoutMarginsFromSafeArea = false

        addSubview(constrainedToLayoutMarginsGuideOf: baseCardView)

        iconContainerView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        iconContainerView.insetsLayoutMarginsFromSafeArea = false

        iconContainerView.addSubview(iconImageView, constraints: [
            iconImageView.topAnchor.constraint(equalTo: iconContainerView.layoutMarginsGuide.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: iconContainerView.layoutMarginsGuide.leadingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: iconContainerView.layoutMarginsGuide.bottomAnchor)
        ])

        iconImageView.intrinsicWidth = 40
        iconImageView.intrinsicHeight = 40
    }

    func styleViews() {
        backgroundColor = .background
    }
}
