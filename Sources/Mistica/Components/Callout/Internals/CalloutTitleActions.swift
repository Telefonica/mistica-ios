//
//  CalloutTitleActions.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaCommon
import UIKit

/// CalloutTitleActions is where we will manage the messages and buttons view.
class CalloutTitleActions: UIStackView {
    let messagesView = CalloutMessagesContent(frame: .zero)
    let buttonsView = CalloutButtons()

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

extension CalloutTitleActions {
    var title: String? {
        get {
            messagesView.title
        }
        set {
            messagesView.title = newValue
        }
    }

    override var description: String {
        get {
            messagesView.description
        }
        set {
            messagesView.description = newValue
        }
    }

    override var accessibilityElements: [Any]? {
        get {
            [
                buttonsView
            ].compactMap { $0 }
        }
        set {}
    }

    func configureButtons(primaryButton: CalloutButton? = nil, secondaryButton: CalloutButton? = nil, linkButton: CalloutLinkButton? = nil) {
        buttonsView.configureButtons(primaryButton: primaryButton, secondaryButton: secondaryButton, linkButton: linkButton)

        if buttonsView.arrangedSubviews.isEmpty {
            buttonsView.removeFromSuperview()
        } else if buttonsView.superview == nil {
            addArrangedSubview(buttonsView)
        }
    }
}

// MARK: Private

private extension CalloutTitleActions {
    func commomInit() {
        layoutViews()
    }

    func layoutViews() {
        addArrangedSubview(messagesView)
        axis = .vertical
        spacing = 16
    }
}
