//
//  CalloutMessagesContent.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// CalloutMessagesContent is a custom UIStackView where we will have the messages section
class CalloutMessagesContent: UIStackView {
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

extension CalloutMessagesContent {
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue

            if titleLabel.text == nil {
                titleLabel.removeFromSuperview()
            } else if titleLabel.superview == nil {
                insertArrangedSubview(titleLabel, at: 0)
            }
        }
    }
    
    var calloutDescription: String {
        get {
            descriptionLabel.text!
        }
        set {
            descriptionLabel.text = newValue

            if descriptionLabel.text == nil {
                descriptionLabel.removeFromSuperview()
            } else if descriptionLabel.superview == nil {
                addArrangedSubview(descriptionLabel)
            }
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

    var titleIdentifier: String? {
        get {
            titleLabel.accessibilityIdentifier
        }
        set {
            titleLabel.accessibilityIdentifier = newValue
            if titleLabel.accessibilityIdentifier == nil {
                titleLabel.accessibilityIdentifier = CalloutAccessibilityIdentifiers.title.rawValue
            }
        }
    }

    var descriptionIdentifier: String? {
        get {
            descriptionLabel.accessibilityIdentifier
        }
        set {
            descriptionLabel.accessibilityIdentifier = newValue
            if descriptionLabel.accessibilityIdentifier == nil {
                descriptionLabel.accessibilityIdentifier = CalloutAccessibilityIdentifiers.description.rawValue
            }
        }
    }
}

// MARK: Private

private extension CalloutMessagesContent {
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
        backgroundColor = .backgroundAlternative

        titleLabel.font = .textPreset4(weight: .regular)
        titleLabel.textColor = .textPrimary
        titleLabel.minHeight = 24
        titleLabel.numberOfLines = 0
        titleLabel.topSpacing = 0
        titleLabel.accessibilityIdentifier = CalloutAccessibilityIdentifiers.title.rawValue

        descriptionLabel.font = .textPreset2(weight: .regular)
        descriptionLabel.textColor = .textSecondary
        descriptionLabel.minHeight = 20
        descriptionLabel.numberOfLines = 0
        descriptionLabel.topSpacing = 4
        descriptionLabel.accessibilityIdentifier = CalloutAccessibilityIdentifiers.description.rawValue
    }
}
