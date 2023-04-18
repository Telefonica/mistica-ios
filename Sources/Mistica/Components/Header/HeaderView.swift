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

    // MARK: - Public

    public var pretitle: String? {
        get {
            pretitleLabel.text
        }
        set {
            pretitleLabel.text = newValue
            updatePretitleLabelVisibilityState()

            updateSpacing()
        }
    }

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

    public var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
            updateTitleLabelVisibilityState()

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

    public var descriptionValue: String? {
        get {
            descriptionLabel.text
        }
        set {
            descriptionLabel.text = newValue
            updateDescriptionLabelVisibilityState()

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
    private enum Constants {
        static let marginLeftAndRight = 16.0
        static let marginTop = 32.0
        static let marginBottom = 24.0
        static let spacing: CGFloat = 8
    }
    
    func setUpView() {
        layoutView()

        stylePretitleLabel()
        styleTitleLabel()
        styleDescriptionLabel()
    }

    func layoutView() {
        // The view cannot be compressed or stretched
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)

        updateLayoutMarginsGuide()

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = Constants.spacing

        topStackView.axis = .vertical
        topStackView.spacing = Constants.spacing

        addSubview(stackView, constraints: [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,  constant: Constants.marginLeftAndRight),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.marginLeftAndRight)
        ])
        
        stackView.addArrangedSubview(topStackView)

        topStackView.addArrangedSubview(pretitleLabel)
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(descriptionLabel)
    }

    func stylePretitleLabel() {
        pretitleLabel.font = .textPreset3(weight: .regular)
        pretitleLabel.textColor = .textPrimary
        pretitleLabel.numberOfLines = 1
    }

    func styleTitleLabel() {
        titleLabel.font = .textPreset6()
        titleLabel.textColor = .textPrimary
        titleLabel.numberOfLines = 1
    }

    func styleDescriptionLabel() {
        descriptionLabel.font = .textPreset3(weight: .regular)
        descriptionLabel.textColor = .textSecondary
        descriptionLabel.numberOfLines = 1
    }

    func updateLayoutMarginsGuide() {
        directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Constants.marginTop,
            leading: Constants.marginLeftAndRight,
            bottom: Constants.marginBottom,
            trailing: Constants.marginLeftAndRight)
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
        titleLabel.textColor = .textPrimary
        pretitleLabel.textColor = .textPrimary
    }
}
