//
//  CalloutContentBase.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaCommon
import UIKit

private enum Constants {
    static let spacingAfterIconView = CGFloat(16.0)
    static let contentLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: 24)
    static let iconLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    static let iconWidth = CGFloat(24)
}

/// CalloutContentBase is a horizontal stackview where we will have the image - message&buttons - close button
class CalloutContentBase: UIStackView {
    let calloutBaseView = CalloutTitleActions()

    private let iconContainerView = UIView()
    private var iconImageView = CalloutAsset()
    private let closeImageView = IntrinsictImageView()

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

extension CalloutContentBase {
    var title: String? {
        get {
            calloutBaseView.messagesView.title
        }
        set {
            calloutBaseView.messagesView.title = newValue
        }
    }

    var descriptionTitle: String {
        get {
            calloutBaseView.messagesView.description
        }
        set {
            calloutBaseView.messagesView.description = newValue
        }
    }

    override var accessibilityElements: [Any]? {
        get {
            [
                calloutBaseView.buttonsView
            ].compactMap { $0 }
        }
        set {}
    }

    var iconContentMode: UIView.ContentMode {
        get {
            iconImageView.contentMode
        }
        set {
            iconImageView.contentMode = newValue
        }
    }

    func configure(withConfiguration configuration: CalloutConfiguration) {
        if configuration.asset != .none {
            if iconContainerView.superview == nil {
                insertArrangedSubview(iconContainerView, at: 0)
                setCustomSpacing(Constants.spacingAfterIconView, after: iconContainerView)
            }
            iconImageView.assetType = configuration.asset
        } else {
            iconContainerView.removeFromSuperview()
            iconImageView.assetType = .none
        }

        calloutBaseView.title = configuration.title
        calloutBaseView.description = configuration.description

        switch configuration.actions {
        case let .primary(primaryButton):
            calloutBaseView.configureButtons(primaryButton: primaryButton)
        case let .primaryAndLink(primaryButton, linkButton):
            calloutBaseView.configureButtons(primaryButton: primaryButton, secondaryButton: nil, linkButton: linkButton)
        case let .primaryAndSecondary(primaryButton, secondaryButton):
            calloutBaseView.configureButtons(primaryButton: primaryButton, secondaryButton: secondaryButton, linkButton: nil)
        case let .secondary(secondaryButton):
            calloutBaseView.configureButtons(primaryButton: nil, secondaryButton: secondaryButton, linkButton: nil)
        case let .secondaryAndLink(secondaryButton, linkButton):
            calloutBaseView.configureButtons(primaryButton: nil, secondaryButton: secondaryButton, linkButton: linkButton)
        case let .link(linkButton):
            calloutBaseView.configureButtons(primaryButton: nil, secondaryButton: nil, linkButton: linkButton)
        case .empty:
            calloutBaseView.configureButtons()
        case .none:
            calloutBaseView.configureButtons()
        }
    }
}

// MARK: Private

private extension CalloutContentBase {
    func commomInit() {
        layoutViews()
        configureImageViewContainer()
    }

    func layoutViews() {
        addArrangedSubview(calloutBaseView)
        axis = .horizontal
        spacing = 16

        directionalLayoutMargins = Constants.contentLayoutMargins
        insetsLayoutMarginsFromSafeArea = false
    }

    func configureImageViewContainer() {
        iconContainerView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            iconContainerView.widthAnchor.constraint(equalToConstant: Constants.iconWidth)
        ])

        iconImageView.directionalLayoutMargins = Constants.iconLayoutMargins
        iconImageView.insetsLayoutMarginsFromSafeArea = false
        iconContainerView.addSubview(iconImageView, constraints: [
            iconImageView.topAnchor.constraint(lessThanOrEqualTo: iconContainerView.topAnchor),
            iconImageView.leadingAnchor.constraint(lessThanOrEqualTo: iconContainerView.leadingAnchor)
        ])
    }
}
