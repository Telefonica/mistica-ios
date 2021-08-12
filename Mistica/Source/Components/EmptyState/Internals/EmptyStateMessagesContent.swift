//
//  EmptyStateMessagesContent.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

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
        titleLabel.font = .textPreset6(weight: .light)
        titleLabel.textColor = .textPrimary
        titleLabel.minHeight = 32
        titleLabel.numberOfLines = 1
        titleLabel.topSpacing = 32

        descriptionLabel.font = .textPreset4(weight: .light)
        descriptionLabel.textColor = .textSecondary
        descriptionLabel.minHeight = 18
        descriptionLabel.numberOfLines = 0
        descriptionLabel.topSpacing = 16
    }
}
