//
//  TagView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import UIKit

public class TagView: UIView {
    @frozen
    public enum Style {
        public static let horizontalMargin: CGFloat = 12
        public static let labelHorizontalLeadingMarginWithIcon: CGFloat = 5
        public static let verticalMargin: CGFloat = 4
        public static let minWidth: CGFloat = 56
        public static let minHeight: CGFloat = 28
        public static var font: UIFont { .textPreset2(weight: .indicator) }
        public static let iconSize: CGFloat = 16
        public static let emptyContent = " "
        public static let stackViewSpacing: CGFloat = 4
        public static let stackViewHorizontalLeadingMarginWithIcon: CGFloat = 8
    }

    // MARK: UI Subcomponents

    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)

        setUpFont(label)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail

        return label
    }()

    // MARK: Properties

    public var text: String? {
        didSet {
            textDidSet()
        }
    }

    public var style: TagStyle = .promo {
        didSet {
            updateColors()
        }
    }

    public var isInverse: Bool = false {
        didSet {
            updateColors()
        }
    }

    private var stackView: UIStackView?
    private var icon: UIImage?
    private lazy var iconImageView: UIImageView? = {
        guard let icon = icon else { return nil }
        let iconView = UIImageView(image: icon.withRenderingMode(.alwaysTemplate))
        iconView.tintColor = style.textColor(isInverse)
        iconView.contentMode = .scaleAspectFit
        if let accessibilityIdentifier = label.accessibilityIdentifier {
            iconView.accessibilityIdentifier = "\(accessibilityIdentifier)-icon"
        }
        return iconView
    }()

    private var labelLeadingMargin: CGFloat {
        if icon != nil {
            return Style.labelHorizontalLeadingMarginWithIcon
        } else {
            return Style.horizontalMargin
        }
    }

    private var scrollViewLeadingMargin: CGFloat {
        if icon != nil {
            return Style.stackViewHorizontalLeadingMarginWithIcon
        } else {
            return Style.horizontalMargin
        }
    }

    // MARK: Init

    public init() {
        super.init(frame: .zero)

        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    public init(
        text: String? = nil,
        style: TagStyle = .promo,
        isInverse: Bool = false,
        icon: UIImage? = nil,
        accessibilityIdentifier: String? = nil
    ) {
        super.init(frame: .zero)

        self.text = text
        self.style = style
        self.isInverse = isInverse
        self.icon = icon
        label.accessibilityIdentifier = accessibilityIdentifier

        textDidSet()
        commonInit()
    }

    // MARK: Sizing

    override public var intrinsicContentSize: CGSize {
        let intrinsicWidth = labelLeadingMargin
            + label.intrinsicContentSize.width
            + Style.horizontalMargin

        return CGSize(
            width: max(Style.minWidth, intrinsicWidth),
            height: Style.minHeight
        )
    }

    // MARK: Accessibility

    override public var accessibilityLabel: String? {
        get {
            label.accessibilityLabel
        }
        set {
            label.accessibilityLabel = newValue
        }
    }

    override public var accessibilityIdentifier: String? {
        get {
            label.accessibilityIdentifier
        }
        set {
            label.accessibilityIdentifier = newValue
        }
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            setUpFont(label)
            invalidateIntrinsicContentSize()
        }
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        setMisticaRadius(.indicator)
        clipsToBounds = true
    }
}

// MARK:

extension TagView: AccessibleTextualView {
    public var accessibleText: String? {
        text
    }
}

// MARK: Private methods

private extension TagView {
    func commonInit() {
        let stackView = UIStackView()
        stackView.spacing = Style.stackViewSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center

        if let iconImageView = iconImageView {
            stackView.addArrangedSubview(iconImageView)
            NSLayoutConstraint.activate([
                iconImageView.heightAnchor.constraint(equalToConstant: Style.iconSize),
                iconImageView.widthAnchor.constraint(equalToConstant: Style.iconSize)
            ])
        }

        stackView.addArrangedSubview(label)

        addSubview(stackView, constraints: [
            topAnchor.constraint(
                equalTo: stackView.topAnchor,
                constant: -Style.verticalMargin
            ),
            bottomAnchor.constraint(
                equalTo: stackView.bottomAnchor,
                constant: Style.verticalMargin
            ),
            leadingAnchor.constraint(
                equalTo: stackView.leadingAnchor,
                constant: -scrollViewLeadingMargin
            ),
            trailingAnchor.constraint(
                equalTo: stackView.trailingAnchor,
                constant: Style.horizontalMargin
            )
        ])

        updateColors()
    }

    func updateColors() {
        backgroundColor = style.backgroundColor(isInverse)
        label.textColor = style.textColor(isInverse)
        iconImageView?.tintColor = style.textColor(isInverse)
    }

    func textDidSet() {
        let normalized = normalize(text)
        guard label.text != normalized else { return }

        label.text = normalized
        invalidateIntrinsicContentSize()
    }

    func setUpFont(_ label: UILabel) {
        label.font = Style.font
    }

    func normalize(_ text: String?) -> String? {
        guard let text = text, !text.isEmpty else {
            // To keep the right intrinsic content height according
            // the text font, we will set, at least, a blank character
            // to the label.
            return Style.emptyContent
        }
        return text
    }
}
