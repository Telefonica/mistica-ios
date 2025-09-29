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
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.closeButtonBlackSmallIcon.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .neutralHigh
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = CalloutAccessibilityIdentifiers.closeButton.rawValue
        return button
    }()

    public var onCloseButtonAction: (() -> Void)?
    private var animated = true

    public var contentConfiguration: CalloutConfiguration? {
        didSet {
            if let contentConfiguration = contentConfiguration {
                configure(withConfiguration: contentConfiguration)
            } else {
                configure(withConfiguration: .emptyConfiguration())
            }
        }
    }

    override public var accessibilityElements: [Any]? {
        get {
            // We must set the frame and be sure it is already calculated.
            calloutAccessibilityElement.accessibilityFrameInContainerSpace = bounds
            return [
                calloutAccessibilityElement,
                calloutContentBase,
                closeButton
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
            closeButton.accessibilityIdentifier
        }
        set {
            closeButton.accessibilityIdentifier = newValue ?? CalloutAccessibilityIdentifiers.closeButton.rawValue
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
    }

    func layoutViews() {
        directionalLayoutMargins = Constants.calloutLayoutMargins
        insetsLayoutMarginsFromSafeArea = false

        addSubview(constrainedToLayoutMarginsGuideOf: calloutContentBase)
        
        addSubview(closeButton, constraints: [
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.closeButtonTopMargin),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.closeButtonTrailingMargin),
            closeButton.widthAnchor.constraint(equalToConstant: Constants.closeButtonWidthAndHeight),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.closeButtonWidthAndHeight)
        ])
    }

    func configure(withConfiguration configuration: CalloutConfiguration) {
        calloutContentBase.configure(withConfiguration: configuration)

        closeButton.isHidden = !configuration.canClose
        
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
    
    @objc func closeButtonTapped() {
        onCloseButtonAction?()
        dismiss(animated: animated)
    }
}
