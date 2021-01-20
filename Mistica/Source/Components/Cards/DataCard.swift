//
//  DataCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
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
        case image(UIImage)
        case icon(UIImage, backgroundColor: UIColor)
    }

    let asset: AssetType?
    let headline: String?
    let title: String
    let subtitle: String?
    let descriptionTitle: String
    let buttons: Buttons

    public init(
        asset: AssetType? = nil,
        backgroundIcon: UIImage? = nil,
        headline: String? = nil,
        title: String,
        subtitle: String? = nil,
        descriptionTitle: String,
        buttons: Buttons
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
        static let cornerRadius = CGFloat(4)
        static let cardLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: 16)
        static let iconLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        static let imageSize = CGFloat(40)
        static let largeIconSize = CGFloat(24)
    }

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

    override public var intrinsicContentSize: CGSize {
        cardBaseView.intrinsicContentSize
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

    var primaryButtonState: Button.State {
        get {
            cardBaseView.buttonsView.primaryButtonState
        }
        set {
            cardBaseView.buttonsView.primaryButtonState = newValue
        }
    }

    var linkButtonState: Button.State {
        get {
            cardBaseView.buttonsView.linkButtonState
        }
        set {
            cardBaseView.buttonsView.linkButtonState = newValue
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
        backgroundColor = .background

        cardBaseView.contentView.titleLabel.font = .textPreset5(weight: .light)
        cardBaseView.contentView.titleLabel.textColor = .textPrimary
        cardBaseView.contentView.titleLabel.minHeight = 24
        cardBaseView.contentView.titleLabel.numberOfLines = 0

        cardBaseView.contentView.subtitleLabel.font = .textPreset7(weight: .regular)
        cardBaseView.contentView.subtitleLabel.textColor = .textPrimary
        cardBaseView.contentView.subtitleLabel.minHeight = 20
        cardBaseView.contentView.subtitleLabel.numberOfLines = 0

        cardBaseView.contentView.descriptionLabel.font = .textPreset7(weight: .regular)
        cardBaseView.contentView.descriptionLabel.textColor = .textSecondary
        cardBaseView.contentView.descriptionLabel.minHeight = 20
        cardBaseView.contentView.descriptionLabel.numberOfLines = 0
    }
    func configure(with configuration: DataCardConfiguration) {
        if let icon = configuration.asset {
            if iconContainerView.superview == nil {
                cardBaseView.insertArrangedSubview(iconContainerView, at: 0)
                cardBaseView.setCustomSpacing(Constants.spacingAfterIconView, after: iconContainerView)
            }
            iconImageView.assetType = icon
        } else {
            iconContainerView.removeFromSuperview()
            iconImageView.assetType = nil
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
        }
    }
}

private extension DataCardConfiguration {
    static let emptyConfiguration = DataCardConfiguration(
        title: "",
        descriptionTitle: "",
        buttons: .link(
            CardLinkButton(title: "", tapHandler: nil)
        )
    )
}
