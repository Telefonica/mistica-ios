//
//  CardCommonContent.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// CardCommonContent is a custom view which contains the texts shared between DataCard and MediaCard
class CardCommonContent: UIStackView {
    let headlineTagView = CardContentItem<TagView>(topSpacing: 8)
    let titleLabel = CardContentItem<IntrinsictHeightLabel>(topSpacing: 4)
    let subtitleLabel = CardContentItem<IntrinsictHeightLabel>(topSpacing: 4)
    let descriptionLabel = CardContentItem<IntrinsictHeightLabel>(topSpacing: 8)

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

extension CardCommonContent {
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
                let titlePosition = headlineTagView.superview == nil ? 1 : 0
                insertArrangedSubview(titleLabel, at: titlePosition)
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
                if let descriptionTitlePosition = arrangedSubviews.firstIndex(of: descriptionLabel) {
                    insertArrangedSubview(subtitleLabel, at: descriptionTitlePosition)
                } else {
                    addArrangedSubview(subtitleLabel)
                }
            }
        }
    }

    var descriptionTitle: String? {
        get {
            descriptionLabel.text
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

    var headlineTopSpacing: CGFloat {
        get {
            headlineTagView.topSpacing
        }
        set {
            headlineTagView.topSpacing = newValue
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

    var subtitleTopSpacing: CGFloat {
        get {
            subtitleLabel.topSpacing
        }
        set {
            subtitleLabel.topSpacing = newValue
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

private extension CardCommonContent {
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
        backgroundColor = .background
    }
}
