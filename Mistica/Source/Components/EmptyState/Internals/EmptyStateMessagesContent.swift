//
//  EmptyStateMessagesContent.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

private enum Constants {
    static let titleTopSpacingDefault: CGFloat = 24.0
    static let titleTopSpacingCard: CGFloat = 16.0
    static let descriptionTopSpacingCard: CGFloat = 8.0
    static let descriptionTopSpacingDefault: CGFloat = 16.0
}

/// EmptyStateMessagesContent is a custom UIStackView where we will have the message section
class EmptyStateMessagesContent: UIStackView {
    let titleLabel = StackViewContentItem<IntrinsictHeightLabel>(topSpacing: 0)
    let descriptionLabel = StackViewContentItem<IntrinsictHeightLabel>(topSpacing: 0)

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
}

// MARK: Internal

extension EmptyStateMessagesContent {
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
            titleLabel.isHidden = titleLabel.text == nil
        }
    }

    var descriptionTitle: String? {
        get {
            descriptionLabel.text
        }
        set {
            descriptionLabel.text = newValue
            descriptionLabel.isHidden = descriptionLabel.text == nil
        }
    }

    var titleTopSpacing: CGFloat {
        get {
            titleLabel.topSpacing
        }
        set {
            titleLabel.topSpacing = newValue
        }
    }

    var descriptionTitleTopSpacing: CGFloat {
        get {
            descriptionLabel.topSpacing
        }
        set {
            descriptionLabel.topSpacing = newValue
        }
    }

    var titleAccessibilityIdentifier: String? {
        get {
            titleLabel.item.accessibilityIdentifier
        }
        set {
            titleLabel.item.accessibilityIdentifier = newValue
        }
    }

    var descriptionAccessibilityIdentifier: String? {
        get {
            descriptionLabel.item.accessibilityIdentifier
        }
        set {
            descriptionLabel.item.accessibilityIdentifier = newValue
        }
    }

    func configure(withConfiguration configuration: EmptyStateConfiguration) {
        title = configuration.title
        descriptionTitle = configuration.description
        let isCard: Bool = configuration.isInCard()
        let titleSpacing: CGFloat = isCard ? Constants.titleTopSpacingCard : Constants.titleTopSpacingDefault
        titleTopSpacing = titleSpacing
        let descriptionSpacing: CGFloat = isCard ? Constants.descriptionTopSpacingCard : Constants.descriptionTopSpacingDefault
        descriptionTitleTopSpacing = descriptionSpacing
		titleLabel.font = isCard ? .textPreset4(weight: .regular) : .textPreset6()
		descriptionLabel.font = isCard ? .textPreset2(weight: .regular) : .textPreset3(weight: .regular)
    }
}

// MARK: Private

private extension EmptyStateMessagesContent {
    func commomInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        axis = .vertical
        alignment = .leading

        addArrangedSubview(titleLabel)
        addArrangedSubview(descriptionLabel)
    }

    func styleViews() {
        titleLabel.font = .textPreset6()
        titleLabel.textColor = .textPrimary
        titleLabel.minHeight = 32
        titleLabel.numberOfLines = 0
        titleLabel.topSpacing = 24

        descriptionLabel.font = .textPreset3(weight: .regular)
        descriptionLabel.textColor = .textSecondary
        descriptionLabel.minHeight = 18
        descriptionLabel.numberOfLines = 0
        descriptionLabel.topSpacing = 16
    }
}
