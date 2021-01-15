//
//  BaseCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

class BaseCard: UIStackView {
    let contentView = CommonCardContent(frame: .zero)
    let actionsView = CardActionsView()

    public var fragmentView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = fragmentView {
                
                
                if let actionsPosition = arrangedSubviews.firstIndex(of: actionsView) {
                    insertArrangedSubview(view, at: actionsPosition)
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

extension BaseCard {
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

    func configureActions(primaryAction: CardAction?, linkAction: CardAction?) {
        actionsView.configureActions(primaryAction: primaryAction, linkAction: linkAction)

        if actionsView.arrangedSubviews.isEmpty {
            actionsView.removeFromSuperview()
        } else if actionsView.superview == nil {
            addArrangedSubview(actionsView)
        }
    }
}

// MARK: Private

private extension BaseCard {
    func commomInit() {
        layoutViews()
    }

    func layoutViews() {
        addArrangedSubview(contentView)
        axis = .vertical
        spacing = 20
    }
}
