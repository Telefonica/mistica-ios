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
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Constants.spacing

        return stackView
    }()

    private lazy var pretitleLabel = UILabel()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private var headerStyle: HeaderViewStyle = .normal

    // MARK: - Public

    public var pretitleAttributedText: NSAttributedString? {
        get {
            pretitleLabel.attributedText
        }
        set {
            pretitleLabel.attributedText = newValue
            updatePretitleLabelVisibilityState()
        }
    }

    public var titleAttributedText: NSAttributedString? {
        get {
            titleLabel.attributedText
        }
        set {
            titleLabel.attributedText = newValue
            updateTitleLabelVisibilityState()
        }
    }

    public var descriptionAttributedText: NSAttributedString? {
        get {
            descriptionLabel.attributedText
        }
        set {
            descriptionLabel.attributedText = newValue
            updateDescriptionLabelVisibilityState()
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
    }

    public var pretitle: HeaderText? {
        didSet {
            updateTopStackView()
        }
    }

    public var title: HeaderText? {
        didSet {
            updateTopStackView()
        }
    }

    public var descriptionValue: HeaderText? {
        didSet {
            updateTopStackView()
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

    var titleAccessibilityTraits: UIAccessibilityTraits {
        get {
            titleLabel.accessibilityTraits
        }
        set {
            titleLabel.accessibilityTraits = newValue
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
        static let heightLabel: CGFloat = 24.0
    }

    func layoutView() {
        // The view cannot be compressed or stretched
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)

        updateColors()

        addSubview(stackView, constraints: [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.marginLeft),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.marginTop),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: Constants.marginRight),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Constants.marginBottom)
        ])
    }

    func updateTopStackView() {
        bringSubviewToFront(stackView)
        stackView.removeArrangedSubviews()

        if let pretitle = pretitle {
            stylePretitleLabel(pretitle)
            stackView.addArrangedSubview(pretitleLabel)

            let heightLayoutConstraint = pretitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.heightLabel)
            stackView.addConstraint(heightLayoutConstraint)
        }
        if let title = title {
            styleTitleLabel(title)
            stackView.addArrangedSubview(titleLabel)

            let heightLayoutConstraint = titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.heightLabel)
            stackView.addConstraint(heightLayoutConstraint)
        }
        if let descriptionValue = descriptionValue {
            styleDescriptionLabel(descriptionValue)
            stackView.addArrangedSubview(descriptionLabel)

            let heightLayoutConstraint = descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.heightLabel)
            stackView.addConstraint(heightLayoutConstraint)
        }
    }

    func stylePretitleLabel(_ headerText: HeaderText) {
        pretitleLabel.font = .textPreset3(weight: .regular)
        pretitleLabel.text = headerText.text
        pretitleLabel.numberOfLines = headerText.lineLimit
        pretitleAccessibilityLabel = headerText.accessibilityLabel
        pretitleAccessibilityIdentifier = headerText.accessibilityIdentifier
    }

    func styleTitleLabel(_ headerText: HeaderText) {
        titleLabel.font = titleFont
        titleLabel.text = headerText.text
        titleLabel.numberOfLines = headerText.lineLimit
        titleAccessibilityLabel = headerText.accessibilityLabel
        titleAccessibilityIdentifier = headerText.accessibilityIdentifier
    }

    func styleDescriptionLabel(_ headerText: HeaderText) {
        descriptionLabel.font = descriptionFont
        descriptionLabel.text = headerText.text
        descriptionLabel.numberOfLines = headerText.lineLimit
        descriptionAccessibilityLabel = headerText.accessibilityLabel
        descriptionAccessibilityIdentifier = headerText.accessibilityIdentifier
    }

    var titleFont: UIFont {
        switch style {
        case .normal, .inverse:
            return .textPreset6()
        case .normalSmall, .inverseSmall:
            return .textPreset4(weight: .regular)
        }
    }

    var descriptionFont: UIFont {
        switch style {
        case .normal, .inverse:
            return .textPreset3(weight: .regular)
        case .normalSmall, .inverseSmall:
            return .textPreset2(weight: .regular)
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
        case .normal, .normalSmall:
            stackView.backgroundColor = .background
            pretitleLabel.textColor = .textPrimary
            titleLabel.textColor = .textPrimary
            descriptionLabel.textColor = .textSecondary
        case .inverse, .inverseSmall:
            setMisticaColorBackground(.backgroundBrand)
            stackView.backgroundColor = .clear
            pretitleLabel.textColor = .textPrimaryInverse
            titleLabel.textColor = .textPrimaryInverse
            descriptionLabel.textColor = .textSecondaryInverse
        }
    }
}
