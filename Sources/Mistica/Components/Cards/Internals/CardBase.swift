//
//  CardBase.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

/// CardBase is a custom view which contain the shared views between DataCard and MediaCard
class CardBase: UIStackView {
    let contentView = CardCommonContent(frame: .zero)
    let buttonsView = CardButtons()

    public var fragmentView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = fragmentView {
                if let buttonsViewIndex = arrangedSubviews.firstIndex(of: buttonsView) {
                    insertArrangedSubview(view, at: buttonsViewIndex)
                } else {
                    addArrangedSubview(view)
                }
            }
        }
    }

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

extension CardBase {
    var title: String? {
        get {
            contentView.title
        }
        set {
            contentView.title = newValue
        }
    }

    var headline: String? {
        get {
            contentView.headline
        }
        set {
            contentView.headline = newValue
        }
    }

    var subtitle: String? {
        get {
            contentView.subtitle
        }
        set {
            contentView.subtitle = newValue
        }
    }

    var descriptionTitle: String? {
        get {
            contentView.descriptionTitle
        }
        set {
            contentView.descriptionTitle = newValue
        }
    }

    override var accessibilityElements: [Any]? {
        get {
            [
                buttonsView,
                fragmentView as Any
            ].compactMap { $0 }
        }
        set {}
    }

    func configureButtons(primaryButton: CardButton?, linkButton: CardLinkButton?) {
        buttonsView.configureButtons(primaryButton: primaryButton, linkButton: linkButton)

        if buttonsView.arrangedSubviews.isEmpty {
            buttonsView.removeFromSuperview()
        } else if buttonsView.superview == nil {
            addArrangedSubview(buttonsView)
        }
    }

    func configureTagStyle(_ style: TagStyle) {
        contentView.headlineTagView.item.style = style
    }
}

// MARK: Private

private extension CardBase {
    func commomInit() {
        layoutViews()
    }

    func layoutViews() {
        addArrangedSubview(contentView)
        axis = .vertical
        spacing = 16
    }
}
