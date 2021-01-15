//
//  CommonCardContent.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

class CommonCardContent: UIStackView {
    let headlineTagView = CardContentItem<TagView>(topSpacing: 8)
    let titleLabel = CardContentItem<IntrinsictHeightLabel>(topSpacing: 4)
    let subtitleLabel = CardContentItem<IntrinsictHeightLabel>(topSpacing: 4)
    let detailLabel = CardContentItem<IntrinsictHeightLabel>(topSpacing: 8)

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
}

extension CommonCardContent {
    var headline: String? {
        get {
            headlineTagView.text
        }
        set {
            headlineTagView.text = newValue

            if newValue == nil {
                headlineTagView.removeFromSuperview()
            } else if headlineTagView.superview == nil {
                insertArrangedSubview(headlineTagView, at: 0)
            }
        }
    }

    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
            
            if titleLabel.text == nil {
                titleLabel.removeFromSuperview()
            } else if titleLabel.superview == nil {
                let subtitlePosition = titleLabel.superview == nil ? 1 : 0
                insertArrangedSubview(titleLabel, at: subtitlePosition)
            }
        }
    }

    var subtitle: String? {
        get {
            subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue

            if subtitleLabel.text == nil {
                subtitleLabel.removeFromSuperview()
            } else if subtitleLabel.superview == nil {
                let subtitlePosition = headlineTagView.superview == nil ? 1 : 2
                insertArrangedSubview(subtitleLabel, at: subtitlePosition)
            }
        }
    }

    var descriptionTitle: String? {
        get {
            detailLabel.text
        }
        set {
            detailLabel.text = newValue

            if detailLabel.text == nil {
                detailLabel.removeFromSuperview()
            } else if detailLabel.superview == nil {
                let detailPosition = subtitleLabel.superview == nil ? 3 : 2
                insertArrangedSubview(detailLabel, at: detailPosition)
            }
        }
    }
}

// MARK: Private

private extension CommonCardContent {
    func commomInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        axis = .vertical
        alignment = .leading

        addArrangedSubview(titleLabel)
        addArrangedSubview(detailLabel)
    }

    func styleViews() {
        backgroundColor = .background

        titleLabel.font = .textPreset5(weight: .light)
        titleLabel.textColor = .textPrimary
        titleLabel.minHeight = 24
        titleLabel.numberOfLines = 0

        subtitleLabel.font = .textPreset7(weight: .regular)
        subtitleLabel.textColor = .textPrimary
        subtitleLabel.minHeight = 20
        subtitleLabel.numberOfLines = 0

        detailLabel.font = .textPreset7(weight: .regular)
        detailLabel.textColor = .textSecondary
        detailLabel.minHeight = 20
        detailLabel.numberOfLines = 0
    }
}
