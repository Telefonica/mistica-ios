//
//  EmptyStateButtons.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// EmptyStateButtons is a custom view which contains the buttons  that belong for the empty state
class EmptyStateButtons: UIStackView {
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

extension EmptyStateButtons {
    func configureButtons(primaryButton: EmptyStateButton? = nil, secondaryButton: EmptyStateButton? = nil, linkButton: EmptyStateLinkButton? = nil, isCard: Bool = false) {
        configure(for: self.primaryButton, with: primaryButton, isCard: isCard)
        primaryActionHandler = primaryButton?.tapHandler
        configure(for: self.secondaryButton, with: secondaryButton, isCard: isCard)
        secondaryActionHandler = secondaryButton?.tapHandler
        configure(for: self.linkButton, with: linkButton, isCard: isCard)
        linkActionHandler = linkButton?.tapHandler

        if !arrangedSubviews.isEmpty {
            addArrangedSubview(dummyView)
        }
    }
}

// MARK: Private

private extension EmptyStateButtons {
    func commomInit() {
        axis = .horizontal
        alignment = .center
        spacing = 20.0

        primaryButton.addTarget(self, action: #selector(primaryActionTapped), for: .touchUpInside)
        secondaryButton.addTarget(self, action: #selector(secondaryActionTapped), for: .touchUpInside)
        linkButton.addTarget(self, action: #selector(linkActionTapped), for: .touchUpInside)

        styleViews()
    }

    func styleViews() {
        primaryButton.style = .primary
        secondaryButton.style = .secondary
        linkButton.style = .link
    }

    func configure(for button: Button, with emptyButton: EmptyStateButton?, isCard: Bool = false) {
        if let configButton = emptyButton {
            button.title = configButton.title
            button.loadingTitle = configButton.loadingTitle
            button.isSmall = isCard
            button.accessibilityIdentifier = configButton.accesibilityIdentifier
            if button.superview == nil {
                addArrangedSubview(button)
            }
        } else {
            button.removeFromSuperview()
        }
    }

    func configure(for link: Button, with emptyLinkButton: EmptyStateLinkButton?, isCard: Bool = false) {
        if let linkButton = emptyLinkButton {
            link.title = linkButton.title
            link.contentMode = .left
            link.isSmall = isCard
            link.accessibilityIdentifier = linkButton.accesibilityIdentifier

            if link.superview == nil {
                addArrangedSubview(link)
            }
        } else {
            link.removeFromSuperview()
        }
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
