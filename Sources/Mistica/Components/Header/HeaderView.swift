//
//  HeaderView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public struct HeaderText {
    public let text: String
    public let lineLimit: Int
    public let accessibilityLabel: String?
    public let accessibilityIdentifier: String?

    public init(
        text: String,
        lineLimit: Int = 0,
        accessibilityLabel: String? = nil,
        accessibilityIdentifier: String? = nil
    ) {
        self.text = text
        self.lineLimit = lineLimit
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityIdentifier = accessibilityIdentifier
    }
}

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
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

    public func setUpView() {
        layoutView()

        stylePretitleLabel()
        styleTitleLabel()
        styleDescriptionLabel()
    }

    public var pretitle: HeaderText? {
        get {
            guard let text = pretitleLabel.text, !text.isEmpty else { return nil }
            return HeaderText(
                text:  text,
                lineLimit: pretitleLabel.numberOfLines,
                accessibilityLabel: pretitleLabel.accessibilityLabel,
                accessibilityIdentifier: pretitleLabel.accessibilityIdentifier
            )
        }
        set {
            stylePretitleLabel(newValue)
            updatePretitleLabelVisibilityState()

            updateSpacing()
        }
    }

    public var title: HeaderText? {
        get {
            guard let text = titleLabel.text, !text.isEmpty else { return nil }
            return HeaderText(
                text: text,
                lineLimit: titleLabel.numberOfLines,
                accessibilityLabel: titleLabel.accessibilityLabel,
                accessibilityIdentifier: titleLabel.accessibilityIdentifier
            )
        }
        set {
            styleTitleLabel(newValue)
            updateTitleLabelVisibilityState()

            updateSpacing()
        }
    }

    public var descriptionValue: HeaderText? {
        get {
            guard let text = descriptionLabel.text, !text.isEmpty else { return nil }
            return HeaderText(
                text: text,
                lineLimit: descriptionLabel.numberOfLines,
                accessibilityLabel: descriptionLabel.accessibilityLabel,
                accessibilityIdentifier: descriptionLabel.accessibilityIdentifier
            )
        }
        set {
            styleDescriptionLabel(newValue)
            updateDescriptionLabelVisibilityState()

            updateSpacing()
        }
    }

    public var style: HeaderViewStyle {
        get {
            headerStyle
        }
        set {
            headerStyle = newValue
            updateColors()
        }
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
        static let noSpacing: CGFloat = 0.0
    }

    func layoutView() {
        // The view cannot be compressed or stretched
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)

        updateLayoutMarginsGuide()

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = Constants.noSpacing
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
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        
        stackView.addArrangedSubview(topStackView)

        topStackView.addArrangedSubview(pretitleLabel)
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(descriptionLabel)
    }

    func stylePretitleLabel(_ headerText: HeaderText? = nil) {
        pretitleLabel.font = .textPreset3(weight: .regular)
        if let headerText = headerText {
            pretitleLabel.text = headerText.text
            pretitleLabel.numberOfLines = headerText.lineLimit
            pretitleAccessibilityLabel = headerText.accessibilityLabel
            pretitleAccessibilityIdentifier = headerText.accessibilityIdentifier
        }
    }

    func styleTitleLabel(_ headerText: HeaderText? = nil) {
        titleLabel.font = .textPreset6()
        if let headerText = headerText {
            titleLabel.text = headerText.text
            titleLabel.numberOfLines = headerText.lineLimit
            titleAccessibilityLabel = headerText.accessibilityLabel
            titleAccessibilityIdentifier = headerText.accessibilityIdentifier
        }
    }

    func styleDescriptionLabel(_ headerText: HeaderText? = nil) {
        descriptionLabel.font = .textPreset3(weight: .regular)
        if let headerText = headerText {
            descriptionLabel.text = headerText.text
            descriptionLabel.numberOfLines = headerText.lineLimit
            descriptionAccessibilityLabel = headerText.accessibilityLabel
            descriptionAccessibilityIdentifier = headerText.accessibilityIdentifier
        }
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
        switch (pretitle, title, descriptionValue) {
        case (.some, .some, .none), (.some, .none, .some):
            topStackView.setCustomSpacing(Constants.spacing, after: pretitleLabel)
        case (_, .some, .some):
            topStackView.setCustomSpacing(Constants.spacing, after: titleLabel)
        default:
            topStackView.setCustomSpacing(Constants.noSpacing, after: pretitleLabel)
            topStackView.setCustomSpacing(Constants.noSpacing, after: titleLabel)
        }
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
            descriptionLabel.textColor = .textSecondary
        case .inverse:
            stackView.backgroundColor = .backgroundBrand
            pretitleLabel.textColor = .textPrimaryInverse
            titleLabel.textColor = .textPrimaryInverse
            descriptionLabel.textColor = .textSecondaryInverse
        }
    }
}
