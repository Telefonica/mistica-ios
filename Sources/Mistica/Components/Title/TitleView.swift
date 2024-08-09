//
//  TitleView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class TitleView: UITableViewHeaderFooterView {
    public typealias Style = TitleStack.Style

    private lazy var titleStack = TitleStack()

    public var onLinkLabelTapped: (() -> Void)?

    public var style: Style {
        set {
            titleStack.style = newValue
        }
        get {
            titleStack.style
        }
    }

    public var title: String? {
        get {
            titleStack.title
        }
        set {
            titleStack.title = newValue
        }
    }

    public var linkTitle: String? {
        get {
            titleStack.linkTitle
        }
        set {
            titleStack.linkTitle = newValue
        }
    }

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    public init(style: Style, reuseIdentifier: String? = nil) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.style = style

        commonInit()
    }
}

// MARK: - Accessibility

public extension TitleView {
    var titleAccessibilityTraits: UIAccessibilityTraits {
        get {
            titleStack.accessibilityTraits
        }
        set {
            titleStack.accessibilityTraits = newValue
        }
    }
}

// MARK: - Private methods

private extension TitleView {
    func commonInit() {
        contentView.addSubview(withDefaultConstraints: titleStack)
    }
}
