//
//  CellCenterSectionView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

@MainActor
protocol ListCellContentViewDelegate: AnyObject {
    func accessibilityChanged()
}

class CellCenterSectionView: UIStackView {
    var accessibilityActivationAction: (() -> Void)?

    var headlineView: AccessibleTextualView? {
        didSet {
            if let oldValue {
                oldValue.removeFromSuperview()
                removeArrangedSubview(oldValue)
            }

            if let view = headlineView {
                insertArrangedSubview(view, at: 0)
                updateSpacing()
            }

            listCellContentViewDelegate?.accessibilityChanged()
        }
    }

    lazy var titleLabel = IntrinsictHeightLabel()
    lazy var subtitleLabel = IntrinsictHeightLabel()
    lazy var detailLabel = IntrinsictHeightLabel()

    weak var listCellContentViewDelegate: ListCellContentViewDelegate?

    var titleTextColor: UIColor = .textPrimary {
        didSet {
            titleLabel.textColor = titleTextColor
        }
    }

    var subtitleTextColor: UIColor = .textPrimary {
        didSet {
            subtitleLabel.textColor = subtitleTextColor
        }
    }

    var detailTextColor: UIColor = .textSecondary {
        didSet {
            detailLabel.textColor = detailTextColor
        }
    }

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
            titleLabel.alpha = isUserInteractionEnabled ? 1 : 0.5
            detailLabel.alpha = isUserInteractionEnabled ? 1 : 0.5
            subtitleLabel.alpha = isUserInteractionEnabled ? 1 : 0.5
        }
    }

    override public func accessibilityActivate() -> Bool {
        guard let accessibilityActivationAction else {
            return false
        }

        accessibilityActivationAction()
        return true
    }

    func didSetTextToSubtitleLabel() {
        if !hasSubtitleText {
            removeArrangedSubview(subtitleLabel)
            subtitleLabel.removeFromSuperview()
            updateSpacing()
        } else if subtitleLabel.superview == nil {
            addArrangedSubview(subtitleLabel)
            updateSpacing()
        }
    }

    func didSetTexToDetailText() {
        if !hasDetailText {
            removeArrangedSubview(detailLabel)
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
        titleLabel.font = .textPreset3(weight: .rowTitle)
        titleLabel.textColor = titleTextColor
        titleLabel.minHeight = 24
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        detailLabel.numberOfLines = 0
        detailLabel.font = .textPreset2(weight: .regular)
        detailLabel.textColor = .textSecondary
        detailLabel.minHeight = 20
        detailLabel.lineBreakMode = .byTruncatingTail
        detailLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        detailLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        detailLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .textPreset2(weight: .regular)
        subtitleLabel.textColor = .textSecondary
        subtitleLabel.minHeight = 20
        subtitleLabel.lineBreakMode = .byTruncatingTail
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
