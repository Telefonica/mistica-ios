//
//  CellContentView.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 19/05/2020.
//  Copyright © 2020 Jose Miguel Brocal. All rights reserved.
//

import UIKit

class CellCenterSectionView: UIStackView {
    var headlineView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = headlineView {
                insertArrangedSubview(view, at: 0)
                updateSpacing()
            }
        }
    }

    lazy var titleLabel = IntrinsictHeightLabel()
    lazy var subtitleLabel = IntrinsictHeightLabel()
    lazy var detailLabel = IntrinsictHeightLabel()

    var hasSubtitleText: Bool {
        subtitleLabel.text != nil || subtitleLabel.attributedText != nil
    }

    var hasDetailText: Bool {
        detailLabel.text != nil || detailLabel.attributedText != nil
    }

    init() {
        super.init(frame: .zero)

        commonInit()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    override var isUserInteractionEnabled: Bool {
        didSet {
            titleLabel.textColor = isUserInteractionEnabled ? .textPrimary : .textDisabled
            detailLabel.textColor = isUserInteractionEnabled ? .textSecondary : .textDisabled
            subtitleLabel.textColor = isUserInteractionEnabled ? .textSecondary : .textDisabled
        }
    }

    func didSetTextToSubtitleLabel() {
        if !hasSubtitleText {
            subtitleLabel.removeFromSuperview()
            updateSpacing()
        } else if subtitleLabel.superview == nil {
            addArrangedSubview(subtitleLabel)
            updateSpacing()
        }
    }

    func didSetTexToDetailText() {
        if !hasDetailText {
            detailLabel.removeFromSuperview()
            updateSpacing()
        } else if detailLabel.superview == nil {
            addArrangedSubview(detailLabel)
            updateSpacing()
        }
    }
}

private extension CellCenterSectionView {
    func commonInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        axis = .vertical
        alignment = .leading

        addArrangedSubview(titleLabel)
    }

    func styleViews() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .textPreset6(weight: .light)
        titleLabel.textColor = .textPrimary
        titleLabel.minHeight = 24
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        detailLabel.numberOfLines = 0
        detailLabel.font = .textPreset7(weight: .regular)
        detailLabel.textColor = .textSecondary
        detailLabel.minHeight = 20
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        detailLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        detailLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .textPreset7(weight: .regular)
        subtitleLabel.textColor = .textSecondary
        subtitleLabel.minHeight = 20
        subtitleLabel.lineBreakMode = .byWordWrapping
        subtitleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
    }

    func updateSpacing() {
        if let view = headlineView, hasTitleText, hasSubtitleOrDescriptionLabels {
            setCustomSpacing(8, after: view)
        }

        if hasSubtitleOrDescriptionLabels {
            setCustomSpacing(2, after: titleLabel)
        }

        if hasSubtitleText && hasDetailText {
            setCustomSpacing(4, after: subtitleLabel)
        }
    }

    var hasTitleText: Bool {
        titleLabel.text != nil || titleLabel.attributedText != nil
    }

    var hasSubtitleOrDescriptionLabels: Bool {
        hasSubtitleText || hasDetailText
    }
}
