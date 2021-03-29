//
//  PopoverMessageView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

class PopoverMessageView: UIStackView {
    private lazy var titleLabel = IntrinsictHeightLabel()
    private lazy var subtitleLabel = IntrinsictHeightLabel()

    init() {
        super.init(frame: .zero)

        commonInit()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }
}

extension PopoverMessageView {
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue

            if newValue != nil && titleLabel.superview == nil {
                addArrangedSubview(titleLabel)
            } else if newValue == nil {
                titleLabel.removeFromSuperview()
            }
        }
    }

    var subtitle: String? {
        get {
            subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue

            if newValue != nil && subtitleLabel.superview == nil {
                addArrangedSubview(subtitleLabel)
            } else if newValue == nil {
                subtitleLabel.removeFromSuperview()
            }
        }
    }
}

// MARK: Custom Accessibilities

extension PopoverMessageView {
    var titleAccessibilityLabel: String? {
        get {
            titleLabel.accessibilityLabel
        }
        set {
            titleLabel.accessibilityLabel = newValue
        }
    }

    var titleAccessibilityIdentifier: String? {
        get {
            titleLabel.accessibilityIdentifier
        }
        set {
            titleLabel.accessibilityIdentifier = newValue
        }
    }

    var subtitleAccessibilityLabel: String? {
        get {
            subtitleLabel.accessibilityLabel
        }
        set {
            subtitleLabel.accessibilityLabel = newValue
        }
    }

    var subtitleAccessibilityIdentifier: String? {
        get {
            subtitleLabel.accessibilityIdentifier
        }
        set {
            subtitleLabel.accessibilityIdentifier = newValue
        }
    }
}

private extension PopoverMessageView {
    func commonInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        axis = .vertical
        alignment = .leading
        spacing = 4
    }

    func styleViews() {
        titleLabel.numberOfLines = 0
        titleLabel.minHeight = 25
        titleLabel.font = .textPreset3(weight: .regular)
        titleLabel.textColor = .textPrimary
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .vertical)

        subtitleLabel.numberOfLines = 0
        subtitleLabel.minHeight = 20
        subtitleLabel.font = .textPreset2(weight: .regular)
        subtitleLabel.textColor = .textSecondary
        subtitleLabel.lineBreakMode = .byWordWrapping
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentHuggingPriority(.required, for: .vertical)
    }
}
