//
//  Callout.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

private enum Constants {
    static let messageToCloseTrailingMargin: CGFloat = 44
    static let calloutLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: messageToCloseTrailingMargin)
    static let closeButtonTopMargin: CGFloat = 16
    static let closeButtonTrailingMargin: CGFloat = -12
    static let closeButtonWidthAndHeight: CGFloat = 24
}

public class Callout: UIView {
    private lazy var calloutAccessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
    private lazy var calloutContentBase = CalloutContentBase()
    private let closeImageView = IntrinsictImageView()

    public var onCloseButtonAction: (() -> Void)?
    private var animated = true

    public var contentConfiguration: CalloutConfiguration? {
        didSet {
            if let contentConfiguration = contentConfiguration {
                configure(withConfiguration: contentConfiguration)
            } else {
                configure(withConfiguration: .emptyConfiguration)
            }
        }
    }

    override public var accessibilityElements: [Any]? {
        get {
            // We must set the frame and be sure it is already calculated.
            calloutAccessibilityElement.accessibilityFrameInContainerSpace = bounds
            return [
                calloutAccessibilityElement,
                calloutContentBase
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

    override public func layoutSubviews() {
        super.layoutSubviews()
        setMisticaRadius(.container)
        clipsToBounds = true
    }

    override public var intrinsicContentSize: CGSize {
        calloutContentBase.intrinsicContentSize
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        addBorder(color: .border)
    }
}

// MARK: Public

public extension Callout {
    var iconContentMode: UIView.ContentMode {
        get {
            calloutContentBase.iconContentMode
        }
        set {
            calloutContentBase.iconContentMode = newValue
        }
    }

    var primaryButton: Button {
        calloutContentBase.calloutBaseView.buttonsView.primaryButton
    }

    var secondaryButton: Button {
        calloutContentBase.calloutBaseView.buttonsView.secondaryButton
    }

    var linkButton: Button {
        calloutContentBase.calloutBaseView.buttonsView.linkButton
    }

    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            calloutAccessibilityElement.accessibilityTraits
        }
        set {
            calloutAccessibilityElement.accessibilityTraits = newValue
        }
    }

    var titleIdentifier: String? {
        get {
            calloutContentBase.titleIdentifier
        }
        set {
            calloutContentBase.titleIdentifier = newValue
        }
    }

    var descriptionIdentifier: String? {
        get {
            calloutContentBase.descriptionIdentifier
        }
        set {
            calloutContentBase.descriptionIdentifier = newValue
        }
    }

    var closeIdentifier: String? {
        get {
            closeImageView.accessibilityIdentifier
        }
        set {
            closeImageView.accessibilityIdentifier = newValue == nil ? CalloutAccessibilityIdentifiers.closeButton.rawValue : newValue
        }
    }

    func dismiss(animated: Bool) {
        let completion: (Bool) -> Void = { finished in
            if finished {
                self.removeFromSuperview()
            }
        }

        if animated {
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
                self.alpha = 0.0
            }, completion: completion)
        } else {
            completion(true)
        }
    }
}

// MARK: Private

private extension Callout {
    func commomInit() {
        layoutViews()
        configureCloseImageView()
    }

    func layoutViews() {
        directionalLayoutMargins = Constants.calloutLayoutMargins
        insetsLayoutMarginsFromSafeArea = false

        addSubview(constrainedToLayoutMarginsGuideOf: calloutContentBase)
        addSubview(closeImageView, constraints: [
            closeImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.closeButtonTopMargin),
            closeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.closeButtonTrailingMargin)
        ])
    }

    func configure(withConfiguration configuration: CalloutConfiguration) {
        calloutContentBase.configure(withConfiguration: configuration)

        if !configuration.canClose {
            closeImageView.removeFromSuperview()
        }

        if configuration.inverse {
            backgroundColor = .backgroundContainer
        } else {
            backgroundColor = .backgroundAlternative
        }

        calloutAccessibilityElement.accessibilityLabel = [
            configuration.title,
            configuration.description
        ].compactMap { $0 }.joined(separator: " ")
    }

    func configureCloseImageView() {
        closeImageView.intrinsicHeight = Constants.closeButtonWidthAndHeight
        closeImageView.intrinsicWidth = Constants.closeButtonWidthAndHeight
        closeImageView.image = UIImage.closeButtonBlackSmallIcon.withRenderingMode(.alwaysTemplate)
        closeImageView.tintColor = .neutralHigh

        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(closeButtonTapped))

        closeImageView.isUserInteractionEnabled = true
        closeImageView.addGestureRecognizer(tapGesture)

        closeImageView.accessibilityIdentifier = CalloutAccessibilityIdentifiers.closeButton.rawValue
    }

    @objc func closeButtonTapped() {
        onCloseButtonAction?()
        dismiss(animated: animated)
    }
}
