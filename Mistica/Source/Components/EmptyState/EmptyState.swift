//
//  EmptyState.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

private enum Constants {
    static let cornerRadius: CGFloat = 4.0
    static let emptyStateLayoutMargins = NSDirectionalEdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16)
}

public class EmptyState: UIView {
    private lazy var emptyStateAccessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
    private lazy var emptyStateContentBase = EmptyStateContentBase()

    public var contentConfiguration: EmptyStateConfiguration? {
        didSet {
            if let contentConfiguration = contentConfiguration {
                configure(withConfiguration: contentConfiguration)
            } else {
                configure(withConfiguration: .empty)
            }
        }
    }

    override public var accessibilityElements: [Any]? {
        get {
            // We must set the frame and be sure it is already calculated.
            emptyStateAccessibilityElement.accessibilityFrameInContainerSpace = bounds
            return [
                emptyStateAccessibilityElement,
                emptyStateContentBase
            ].compactMap { $0 }
        }
        set {}
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }

    override public var intrinsicContentSize: CGSize {
        emptyStateContentBase.intrinsicContentSize
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        guard let configuration = contentConfiguration else { return }

        if configuration.isInCard() {
            addBorder(color: .border)
        }
    }
}

// MARK: Public

public extension EmptyState {
    var iconContentMode: UIView.ContentMode {
        get {
            emptyStateContentBase.iconContentMode
        }
        set {
            emptyStateContentBase.iconContentMode = newValue
        }
    }

    var iconTintColor: UIColor {
        get {
            emptyStateContentBase.iconTintColor
        }
        set {
            emptyStateContentBase.iconTintColor = newValue
        }
    }

    var primaryButton: Button {
        emptyStateContentBase.emptyStateButtons.primaryButton
    }

    var secondaryButton: Button {
        emptyStateContentBase.emptyStateButtons.secondaryButton
    }

    var linkButton: Button {
        emptyStateContentBase.emptyStateButtons.linkButton
    }

    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            emptyStateAccessibilityElement.accessibilityTraits
        }
        set {
            emptyStateAccessibilityElement.accessibilityTraits = newValue
        }
    }
}

// MARK: Private

private extension EmptyState {
    func commomInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        directionalLayoutMargins = Constants.emptyStateLayoutMargins
        insetsLayoutMarginsFromSafeArea = false
    }

    func styleViews() {
        backgroundColor = .background
    }

    func configure(withConfiguration configuration: EmptyStateConfiguration) {
        cleanContent()
        if configuration.isInCard() {
            addSubview(constrainedToLayoutMarginsGuideOf: emptyStateContentBase)
            addBorder(color: .border)
            makeRounded(cornerRadius: Constants.cornerRadius)
            backgroundColor = .backgroundContainer
        } else {
            addSubview(withDefaultConstraints: emptyStateContentBase)
            backgroundColor = .background
        }
        emptyStateContentBase.configure(withConfiguration: configuration)

        emptyStateAccessibilityElement.accessibilityLabel = [
            configuration.title,
            configuration.description
        ].compactMap { $0 }.joined(separator: " ")
    }

    func cleanContent() {
        removeBorder()
        removeRounded()
        emptyStateContentBase.removeFromSuperview()
    }
}