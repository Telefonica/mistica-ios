//
//  TitleHeaderFooterView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class TitleHeaderFooterView: UITableViewHeaderFooterView {
    public typealias Style = TitleView.Style

    private lazy var titleView = TitleView()

    public var onLinkLabelTapped: (() -> Void)? {
        set {
            titleView.onLinkLabelTapped = newValue
        }
        get {
            titleView.onLinkLabelTapped
        }
    }

    public var style: Style {
        set {
            titleView.style = newValue
        }
        get {
            titleView.style
        }
    }

    public var title: String? {
        get {
            titleView.title
        }
        set {
            titleView.title = newValue
        }
    }

    public var linkTitle: String? {
        get {
            titleView.linkTitle
        }
        set {
            titleView.linkTitle = newValue
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

public extension TitleHeaderFooterView {
    var titleAccessibilityTraits: UIAccessibilityTraits {
        get {
            titleView.accessibilityTraits
        }
        set {
            titleView.accessibilityTraits = newValue
        }
    }
}

// MARK: - Private methods

private extension TitleHeaderFooterView {
    func commonInit() {
        contentView.addSubview(withDefaultConstraints: titleView)
    }
}
