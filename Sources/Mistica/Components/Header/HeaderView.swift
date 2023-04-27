//
//  HeaderView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class HeaderView: UIView {
    private let stackView = UIStackView()
    private let topStackView = UIStackView()

    private let pretitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private var headerStyle: HeaderViewStyle = .normal

    // MARK: - Public

    public var pretitleAttributedText: NSAttributedString? {
        get {
            pretitleLabel.attributedText
        }
        set {
            pretitleLabel.attributedText = newValue
            updatePretitleLabelVisibilityState()

            updateSpacing()
        }
    }

    public var titleAttributedText: NSAttributedString? {
        get {
            titleLabel.attributedText
        }
        set {
            titleLabel.attributedText = newValue
            updateTitleLabelVisibilityState()

            updateSpacing()
        }
    }

    public var descriptionAttributedText: NSAttributedString? {
        get {
            descriptionLabel.attributedText
        }
        set {
            descriptionLabel.attributedText = newValue
            updateDescriptionLabelVisibilityState()

            updateSpacing()
        }
    }

    // MARK: - Inits

    public convenience init() {
        self.init(frame: .zero)
    }

    public func setUpView(
        pretitle: String? = nil,
        title: String? = nil,
        descriptionValue: String? = nil,
        style: HeaderViewStyle = .normal
    ) {
        self.pretitle = pretitle
        self.title = title
        self.descriptionValue = descriptionValue
        self.style = style

        layoutView()

        stylePretitleLabel()
        styleTitleLabel()
        styleDescriptionLabel()
    }
}

// MARK: - Accessibility

public extension HeaderView {
    var pretitleAccessibilityLabel: String? {
        get {
            pretitleLabel.accessibilityLabel
        }
        set {
            pretitleLabel.accessibilityLabel = newValue
        }
    }

    var pretitleAccessibilityIdentifier: String? {
        get {
            pretitleLabel.accessibilityIdentifier
        }
        set {
            pretitleLabel.accessibilityIdentifier = newValue
        }
    }

    var titleAccessibilityLabel: String? {
        get {
            titleLabel.accessibilityLabel
        }
        set {
            titleLabel.accessibilityLabel = newValue
        }
    }

    var titleAccessibilityIdentifier: String? {
        get {
            titleLabel.accessibilityIdentifier
        }
        set {
            titleLabel.accessibilityIdentifier = newValue
        }
    }

    var descriptionAccessibilityLabel: String? {
        get {
            descriptionLabel.accessibilityLabel
        }
        set {
            descriptionLabel.accessibilityLabel = newValue
        }
    }

    var descriptionAccessibilityIdentifier: String? {
        get {
            descriptionLabel.accessibilityIdentifier
        }
        set {
            descriptionLabel.accessibilityIdentifier = newValue
        }
    }
}

// MARK: - Private

private extension HeaderView {
    enum Constants {
        static let marginLeft = 16.0
        static let marginRight = 32.0
        static let marginTop = 32.0
        static let marginBottom = 24.0
        static let spacing: CGFloat = 8
    }

    var pretitle: String? {
        get {
            pretitleLabel.text
        }
        set {
            pretitleLabel.text = newValue
            updatePretitleLabelVisibilityState()

            updateSpacing()
        }
    }

    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
            updateTitleLabelVisibilityState()

            updateSpacing()
        }
    }

    var descriptionValue: String? {
        get {
            descriptionLabel.text
        }
        set {
            descriptionLabel.text = newValue
            updateDescriptionLabelVisibilityState()

            updateSpacing()
        }
    }

    var style: HeaderViewStyle {
        get {
            headerStyle
        }
        set {
            headerStyle = newValue
            updateColors()
        }
    }

    func layoutView() {
        // The view cannot be compressed or stretched
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)

        updateLayoutMarginsGuide()

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = Constants.spacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(
            top: Constants.marginTop,
            left: Constants.marginLeft,
            bottom: Constants.marginBottom,
            right: Constants.marginRight
        )

        topStackView.axis = .vertical
        topStackView.spacing = Constants.spacing

        addSubview(stackView, constraints: [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        stackView.addArrangedSubview(topStackView)

        if pretitle != nil {
            topStackView.addArrangedSubview(pretitleLabel)
        }
        if title != nil {
            topStackView.addArrangedSubview(titleLabel)
        }
        if descriptionValue != nil {
            topStackView.addArrangedSubview(descriptionLabel)
        }
    }

    func stylePretitleLabel() {
        pretitleLabel.font = .textPreset3(weight: .regular)
        pretitleLabel.numberOfLines = 1
    }

    func styleTitleLabel() {
        titleLabel.font = .textPreset6()
        titleLabel.numberOfLines = 1
    }

    func styleDescriptionLabel() {
        descriptionLabel.font = .textPreset3(weight: .regular)
        descriptionLabel.numberOfLines = 1
    }

    func updateLayoutMarginsGuide() {
        updateColors()
        directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Constants.marginTop,
            leading: Constants.marginLeft,
            bottom: Constants.marginBottom,
            trailing: Constants.marginRight
        )
    }

    func updateSpacing() {
        stackView.setCustomSpacing(Constants.spacing, after: pretitleLabel)
    }

    func updatePretitleLabelVisibilityState() {
        pretitleLabel.isHidden = pretitleLabel.text == nil && pretitleLabel.attributedText == nil
    }

    func updateTitleLabelVisibilityState() {
        titleLabel.isHidden = titleLabel.text == nil && titleLabel.attributedText == nil
    }

    func updateDescriptionLabelVisibilityState() {
        descriptionLabel.isHidden = descriptionLabel.text == nil && descriptionLabel.attributedText == nil
    }

    func updateColors() {
        switch style {
        case .normal:
            stackView.backgroundColor = .background
            pretitleLabel.textColor = .textPrimary
            titleLabel.textColor = .textPrimary
            descriptionLabel.textColor = .textPrimary
        case .inverse:
            stackView.backgroundColor = .backgroundBrand
            pretitleLabel.textColor = .textPrimaryInverse
            titleLabel.textColor = .textPrimaryInverse
            descriptionLabel.textColor = .textPrimaryInverse
        }
    }
}
