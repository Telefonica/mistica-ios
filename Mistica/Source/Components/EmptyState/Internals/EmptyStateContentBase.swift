//
//  EmptyStateContentBase.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

private enum Constants {
    static let contentLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: 16)
    static let fullWidthMargin: CGFloat = 24.0
    static let iconWidthMargin: CGFloat = 24.0
    static let smallImageHeight: CGFloat = 112.0
    static let actionsHeight: CGFloat = 48.0
}

/// EmptyStateContentBase is a horizontal stackview where we will have the image - message&buttons - close button
class EmptyStateContentBase: UIStackView {
    let emptyStateMessages = EmptyStateMessagesContent()
    let emptyStateButtons = EmptyStateButtons()

    private let messageActionsSeparator = SpacerView(axis: .vertical, amount: 24)
    private let actionsBottomSeparator = SpacerView(axis: .vertical, amount: 24)

    private var iconContainerView = UIView()
    private var iconImage = UIImageView()

    init() {
        super.init(frame: .zero)

        commomInit()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Internal

extension EmptyStateContentBase {
    var title: String? {
        get {
            emptyStateMessages.title
        }
        set {
            emptyStateMessages.title = newValue
        }
    }

    var descriptionTitle: String? {
        get {
            emptyStateMessages.descriptionTitle
        }
        set {
            emptyStateMessages.descriptionTitle = newValue
        }
    }

    override var accessibilityElements: [Any]? {
        get {
            [
                emptyStateButtons
            ].compactMap { $0 }
        }
        set {}
    }

    var iconContentMode: UIView.ContentMode {
        get {
            iconImage.contentMode
        }
        set {
            iconImage.contentMode = newValue
        }
    }

    func configure(withConfiguration configuration: EmptyStateConfiguration) {
        emptyStateMessages.title = configuration.title
        emptyStateMessages.descriptionTitle = configuration.description

        var hideButtons = false
        switch configuration.actions {
        case let .primary(primaryButton):
            emptyStateButtons.configureButtons(primaryButton: primaryButton)
        case let .primaryAndLink(primaryButton, linkButton):
            emptyStateButtons.configureButtons(primaryButton: primaryButton, linkButton: linkButton)
        case let .secondary(secondaryButton):
            emptyStateButtons.configureButtons(secondaryButton: secondaryButton)
        case let .secondaryAndLink(secondaryButton, linkButton):
            emptyStateButtons.configureButtons(secondaryButton: secondaryButton, linkButton: linkButton)
        case .empty, .none:
            hideButtons = true
            emptyStateButtons.configureButtons()
        }
        // Asset is mandatory
        configureImageViewContainer(configuration: configuration)
        if configuration.isInCard() && !hideButtons {
            addArrangedSubview(actionsBottomSeparator)
        } else {
            actionsBottomSeparator.removeFromSuperview()
        }
    }
}

// MARK: Private

private extension EmptyStateContentBase {
    func commomInit() {
        layoutViews()
    }

    func layoutViews() {
        addArrangedSubview(emptyStateMessages)
        addArrangedSubview(messageActionsSeparator)
        addArrangedSubview(emptyStateButtons)

        axis = .vertical
        spacing = 0

        directionalLayoutMargins = Constants.contentLayoutMargins
        insetsLayoutMarginsFromSafeArea = false
    }

    func configureImageViewContainer(configuration: EmptyStateConfiguration) {
        switch configuration.type {
        case .card(let cardAsset):
            switch cardAsset {
            case .icon(let image):
                configureIconContainer(image: image)
            case .smallImage(let image):
                configureSmallContainer(image: image)
            }
        case .default(let defaultAsset):
            switch defaultAsset {
            case .fullWidthImage(let image):
                configureFullWidthImage(image: image)
            case .smallImage(let image):
                configureSmallContainer(image: image)
            case .icon(let image):
                configureIconContainer(image: image)
            }
        }
        iconContainerView.backgroundColor = .clear
        insertArrangedSubview(iconContainerView, at: 0)
    }

    func configureFullWidthImage(image: UIImage) {
        iconImage.image = image
        iconImage.contentMode = .scaleToFill
        let heightRatioFullWidth = calculateHeightForFullWidthRatio()
        iconContainerView.heightAnchor.constraint(equalToConstant: heightRatioFullWidth).isActive = true
        iconContainerView.addSubview(iconImage, constraints: [
            iconImage.topAnchor.constraint(equalTo: iconContainerView.topAnchor),
            iconImage.leadingAnchor.constraint(equalTo: iconContainerView.leadingAnchor),
            iconImage.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor),
            iconImage.trailingAnchor.constraint(equalTo: iconContainerView.trailingAnchor)
        ])
    }

    func configureIconContainer(image: UIImage) {
        iconContainerView.heightAnchor.constraint(equalToConstant: Constants.iconWidthMargin).isActive = true
        iconImage.image = image
        iconImage.contentMode = .scaleToFill
        iconContainerView.addSubview(iconImage, constraints: [
            iconImage.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: Constants.iconWidthMargin),
            iconImage.heightAnchor.constraint(equalToConstant: Constants.iconWidthMargin)
        ])
    }

    func configureSmallContainer(image: UIImage) {
        iconImage.image = image
        iconImage.contentMode = .scaleToFill
        iconContainerView.heightAnchor.constraint(equalToConstant: Constants.smallImageHeight).isActive = true
        let widthRatio = calculateWidthForSmallImages(withImage: image)
        iconContainerView.addSubview(iconImage, constraints: [
            iconImage.topAnchor.constraint(equalTo: iconContainerView.topAnchor),
            iconImage.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: widthRatio)
        ])
    }

    func calculateHeightForFullWidthRatio() -> CGFloat {
        let ratio: CGFloat = 16.0 / 9.0
        let fullWidthMinusMargins = UIScreen.main.bounds.width - (Constants.fullWidthMargin * 2.0)
        return fullWidthMinusMargins / ratio
    }

    func calculateWidthForSmallImages(withImage image: UIImage) -> CGFloat {
        let fixedHeight: CGFloat = Constants.smallImageHeight
        let ratio = image.size.width / image.size.height
        return ratio * fixedHeight
    }
}
