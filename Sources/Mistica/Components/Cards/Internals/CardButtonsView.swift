//
//  CardButtonsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// CardButtons is a custom view which contains the buttons shared between DataCard and MediaCard
class CardButtons: UIStackView {
    let primaryButton = Button()
    let linkButton = Button()
    private let dummyView = SpacerView(axis: .vertical, amount: 1)

    private var primaryActionHandler: (() -> Void)?
    private var linkActionHandler: (() -> Void)?

    override var accessibilityElements: [Any]? {
        get {
            [
                primaryButton.superview == nil ? nil : primaryButton,
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

extension CardButtons {
    func configureButtons(primaryButton: CardButton?, linkButton: CardLinkButton?) {
        if let primaryButton {
            self.primaryButton.title = primaryButton.title
            self.primaryButton.accessibilityIdentifier = primaryButton.accessibilityIdentifier
            self.primaryButton.loadingTitle = primaryButton.loadingTitle

            primaryActionHandler = primaryButton.tapHandler

            if self.primaryButton.superview == nil {
                addArrangedSubview(self.primaryButton)
            }
        } else {
            self.primaryButton.removeFromSuperview()
        }

        if let linkButton = linkButton {
            self.linkButton.title = linkButton.title
            self.linkButton.accessibilityIdentifier = linkButton.accessibilityIdentifier
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

private extension CardButtons {
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
        linkButton.contentMode = .left
    }

    @objc func primaryActionTapped(_ sender: Button) {
        primaryActionHandler?()
    }

    @objc func linkActionTapped(_ sender: Button) {
        linkActionHandler?()
    }
}
