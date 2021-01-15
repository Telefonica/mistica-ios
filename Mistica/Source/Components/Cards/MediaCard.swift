//
//  File.swift
//  
//
//  Created by Jose Miguel Brocal on 14/1/21.
//

import Foundation
import UIKit

public struct MediaCardConfiguration {
    let icon: UIImage
    let headline: String?
    let title: String?
    let pretitle: String?
    let descriptionTitle: String
    let button: CardAction?
    let link: CardAction?

    public init(
        icon: UIImage,
        headline: String? = nil,
        title: String? = nil,
        pretitle: String? = nil,
        descriptionTitle: String,
        button: CardAction? = nil,
        link: CardAction? = nil
    ) {
        self.icon = icon
        self.headline = headline
        self.title = title
        self.pretitle = pretitle
        self.descriptionTitle = descriptionTitle
        self.button = button
        self.link = link
    }
}

public struct MediaCardAction {
    public let title: String
    public let loadingTitle: String?
    public let tapHandler: (() -> Void)?

    public init(title: String,
                loadingTitle: String?,
                tapHandler: (() -> Void)?) {
        self.title = title
        self.loadingTitle = loadingTitle
        self.tapHandler = tapHandler
    }
}

public class MediaCard: UIView {
    var iconImageView = IntrinsictImageView()
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

public extension MediaCard {
    func configure(with configuration: MediaCardConfiguration) {
        iconImageView.image = configuration.icon

        baseCardView.headline = configuration.headline
        baseCardView.title = configuration.pretitle?.uppercased()
        baseCardView.subtitle = configuration.title
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

private extension MediaCard {
    func commomInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
        insetsLayoutMarginsFromSafeArea = false
        
        addSubview(iconImageView, constraints: [
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        addSubview(baseCardView, constraints: [
            baseCardView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            baseCardView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            baseCardView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            baseCardView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
        ])
    }

    func styleViews() {
        backgroundColor = .background
        
        iconImageView.intrinsicHeight = 200
        
        baseCardView.contentView.titleLabel.font = .textPreset8(weight: .regular)
        baseCardView.contentView.titleLabel.textColor = .textPrimary
        baseCardView.contentView.titleLabel.minHeight = 16
        baseCardView.contentView.titleLabel.numberOfLines = 0

        baseCardView.contentView.subtitleLabel.font = .textPreset5(weight: .light)
        baseCardView.contentView.subtitleLabel.textColor = .textPrimary
        baseCardView.contentView.subtitleLabel.minHeight = 24
        baseCardView.contentView.subtitleLabel.numberOfLines = 0

        baseCardView.contentView.detailLabel.font = .textPreset7(weight: .regular)
        baseCardView.contentView.detailLabel.textColor = .textSecondary
        baseCardView.contentView.detailLabel.minHeight = 20
        baseCardView.contentView.detailLabel.numberOfLines = 0
    }
}
