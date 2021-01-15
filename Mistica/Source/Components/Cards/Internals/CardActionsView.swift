//
//  CardActionsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

class CardActionsView: UIStackView {
    private let primaryButton = Button()
    private let linkButton = Button()
    private let dummyView = SpacerView(axis: .vertical, amount: 1)

    var buttonState: Button.State {
        get {
            primaryButton.state
        }
        set {
            primaryButton.state = newValue
        }
    }

    var linkState: Button.State {
        get {
            linkButton.state
        }
        set {
            linkButton.state = newValue
        }
    }

    private var primaryActionHandler: (() -> Void)?
    private var linkActionHandler: (() -> Void)?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
}

extension CardActionsView {
    func configureActions(primaryAction: DataCardAction?, linkAction: DataCardAction?) {
        if let primaryAction = primaryAction {
            primaryButton.title = primaryAction.title
            primaryButton.loadingTitle = primaryAction.loadingTitle
            primaryActionHandler = primaryAction.tapHandler

            if primaryButton.superview == nil {
                addArrangedSubview(primaryButton)
            }
        } else {
            primaryButton.removeFromSuperview()
        }

        if let linkAction = linkAction {
            linkButton.title = linkAction.title
            linkButton.loadingTitle = linkAction.loadingTitle
            linkActionHandler = linkAction.tapHandler

            if linkButton.superview == nil {
                addArrangedSubview(linkButton)
            }
        } else {
            linkButton.removeFromSuperview()
        }

        if !arrangedSubviews.isEmpty {
            addArrangedSubview(dummyView)
        }
    }
}

// MARK: Private

private extension CardActionsView {
    func commomInit() {
        axis = .horizontal
        alignment = .top
        spacing = 23.5

        primaryButton.addTarget(self, action: #selector(primaryActionTapped), for: .touchUpInside)
        linkButton.addTarget(self, action: #selector(linkActionTapped), for: .touchUpInside)

        styleViews()
    }

    func styleViews() {
        primaryButton.style = .primary
        primaryButton.isSmall = true

        linkButton.style = .link
    }

    @objc func primaryActionTapped(_ sender: Button) {
        primaryActionHandler?()
    }

    @objc func linkActionTapped(_ sender: Button) {
        linkActionHandler?()
    }
}
