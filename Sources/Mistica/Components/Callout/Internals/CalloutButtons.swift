//
//  CalloutButtons.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// CardButtons is a custom view which contains the buttons  that belong for the callouts
class CalloutButtons: UIStackView {
    let primaryButton = Button()
    let secondaryButton = Button()
    let linkButton = Button()
    private let dummyView = SpacerView(axis: .vertical, amount: 1)

    private var primaryActionHandler: (() -> Void)?
    private var secondaryActionHandler: (() -> Void)?
    private var linkActionHandler: (() -> Void)?

    override var accessibilityElements: [Any]? {
        get {
            [
                primaryButton.superview == nil ? nil : primaryButton,
                secondaryButton.superview == nil ? nil : secondaryButton,
                linkButton.superview == nil ? nil : linkButton
            ].compactMap { $0 }
        }
        set {}
    }

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

extension CalloutButtons {
    func configureButtons(primaryButton: CalloutButton?, secondaryButton: CalloutButton?, linkButton: CalloutLinkButton?) {
        if let primaryButton = primaryButton {
            self.primaryButton.title = primaryButton.title
            self.primaryButton.loadingTitle = primaryButton.loadingTitle
            primaryActionHandler = primaryButton.tapHandler

            if self.primaryButton.superview == nil {
                addArrangedSubview(self.primaryButton)
            }
        } else {
            self.primaryButton.removeFromSuperview()
        }

        if let secondaryButton = secondaryButton {
            self.secondaryButton.title = secondaryButton.title
            self.secondaryButton.loadingTitle = secondaryButton.loadingTitle
            secondaryActionHandler = secondaryButton.tapHandler

            if self.secondaryButton.superview == nil {
                addArrangedSubview(self.secondaryButton)
            }
        } else {
            self.secondaryButton.removeFromSuperview()
        }

        if let linkButton = linkButton {
            self.linkButton.title = linkButton.title
            self.linkButton.contentMode = .left
            linkActionHandler = linkButton.tapHandler

            if self.linkButton.superview == nil {
                addArrangedSubview(self.linkButton)
            }
        } else {
            self.linkButton.removeFromSuperview()
        }

        if !arrangedSubviews.isEmpty {
            addArrangedSubview(dummyView)
        }
    }
}

// MARK: Private

private extension CalloutButtons {
    func commomInit() {
        axis = .horizontal
        alignment = .trailing
        spacing = 20.0

        primaryButton.addTarget(self, action: #selector(primaryActionTapped), for: .touchUpInside)
        secondaryButton.addTarget(self, action: #selector(secondaryActionTapped), for: .touchUpInside)
        linkButton.addTarget(self, action: #selector(linkActionTapped), for: .touchUpInside)

        styleViews()
    }

    func styleViews() {
        primaryButton.style = .primary
        primaryButton.isSmall = true

        secondaryButton.style = .secondary
        secondaryButton.isSmall = true

        linkButton.style = .link
        linkButton.contentMode = .left
    }

    @objc func primaryActionTapped(_ sender: Button) {
        primaryActionHandler?()
    }

    @objc func secondaryActionTapped(_ sender: Button) {
        secondaryActionHandler?()
    }

    @objc func linkActionTapped(_ sender: Button) {
        linkActionHandler?()
    }
}
