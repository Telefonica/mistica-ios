//
//  PopoverContentView.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 24/07/2020.
//  Copyright © 2020 Jose Miguel Brocal. All rights reserved.
//

import UIKit

private enum ViewStyles {
    static let imageWidth = CGFloat(40)
    static let imageHeight = CGFloat(40)
    static let closeImageWidth = CGFloat(24)
    static let closeImageHeight = CGFloat(24)
    static let closeImageTopMargin = CGFloat(8)
    static let closeImageTralingMargin = CGFloat(-8)
    static let layoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
}

class PopoverContentView: UIView {
    private let stackView = UIStackView()

    private let imageView = IntrinsictImageView()
    private let messageView = PopoverMessageView()
    private let spaceView = SpacerView(axis: .horizontal, amount: 16)
    private let closeImageView = IntrinsictImageView()
    private let onCloseButtonTap: () -> Void

    init(onCloseButtonTap: @escaping () -> Void) {
        self.onCloseButtonTap = onCloseButtonTap

        super.init(frame: .zero)

        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopoverContentView {
    var image: UIImage? {
        get {
            imageView.image
        }
        set {
            imageView.image = newValue

            if newValue != nil && imageView.superview == nil {
                stackView.insertArrangedSubview(imageView, at: 0)
            } else if newValue == nil {
                imageView.removeFromSuperview()
            }
        }
    }

    var title: String? {
        get {
            messageView.title
        }
        set {
            messageView.title = newValue
        }
    }

    var subtitle: String? {
        get {
            messageView.subtitle
        }
        set {
            messageView.subtitle = newValue
        }
    }

    var canClose: Bool {
        get {
            closeImageView.isHidden
        }
        set {
            closeImageView.isHidden = !newValue

            if newValue && spaceView.superview == nil {
                stackView.addArrangedSubview(spaceView)
            } else if !newValue {
                spaceView.removeFromSuperview()
            }
        }
    }
}

// MARK: Custom Accessibilities

extension PopoverContentView {
    var closeButtonAccessibilityLabel: String? {
        get {
            closeImageView.accessibilityLabel
        }
        set {
            closeImageView.accessibilityLabel = newValue
        }
    }

    var closeButtonAccessibilityIdentifier: String? {
        get {
            closeImageView.accessibilityIdentifier
        }
        set {
            closeImageView.accessibilityIdentifier = newValue
        }
    }

    var imageAccessibilityLabel: String? {
        get {
            imageView.accessibilityLabel
        }
        set {
            imageView.accessibilityLabel = newValue
        }
    }

    var imageAccessibilityIdentifier: String? {
        get {
            imageView.accessibilityIdentifier
        }
        set {
            imageView.accessibilityIdentifier = newValue
        }
    }

    var titleAccessibilityLabel: String? {
        get {
            messageView.titleAccessibilityLabel
        }
        set {
            messageView.titleAccessibilityLabel = newValue
        }
    }

    var titleAccessibilityIdentifier: String? {
        get {
            messageView.titleAccessibilityIdentifier
        }
        set {
            messageView.titleAccessibilityIdentifier = newValue
        }
    }

    var subtitleAccessibilityLabel: String? {
        get {
            messageView.subtitleAccessibilityLabel
        }
        set {
            messageView.subtitleAccessibilityLabel = newValue
        }
    }

    var subtitleAccessibilityIdentifier: String? {
        get {
            messageView.subtitleAccessibilityIdentifier
        }
        set {
            messageView.subtitleAccessibilityIdentifier = newValue
        }
    }
}

private extension PopoverContentView {
    func commonInit() {
        layoutViews()
        configureStackView()
        configureImageView()
        configureCloseImageView()
    }

    func layoutViews() {
        addSubview(stackView, constraints: [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])

        stackView.addArrangedSubview(messageView)

        addSubview(closeImageView, constraints: [
            closeImageView.topAnchor.constraint(equalTo: topAnchor, constant: ViewStyles.closeImageTopMargin),
            closeImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: ViewStyles.closeImageTralingMargin)
        ])

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: stackView.widthAnchor),
            heightAnchor.constraint(equalTo: messageView.heightAnchor, constant: ViewStyles.layoutMargins.top + ViewStyles.layoutMargins.bottom)
        ])
    }

    func configureStackView() {
        stackView.alignment = .top
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = ViewStyles.layoutMargins
        stackView.spacing = 16
        stackView.setCustomSpacing(8, after: messageView)
    }

    func configureImageView() {
        imageView.intrinsicHeight = ViewStyles.imageHeight
        imageView.intrinsicWidth = ViewStyles.imageWidth
    }

    func configureCloseImageView() {
        closeImageView.intrinsicHeight = ViewStyles.closeImageHeight
        closeImageView.intrinsicWidth = ViewStyles.closeImageWidth
        closeImageView.image = .closeButtonBlackSmallIcon

        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(closeButtonTapped))

        closeImageView.isUserInteractionEnabled = true
        closeImageView.addGestureRecognizer(tapGesture)
    }

    @objc func closeButtonTapped() {
        onCloseButtonTap()
    }
}
