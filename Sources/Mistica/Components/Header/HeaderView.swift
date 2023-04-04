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
    private let bottomStackView = UIStackView()

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

            updateSpacing()
        }
    }

    public var titleAttributedText: NSAttributedString? {
        get {
            titleLabel.attributedText
        }
        set {
            titleLabel.attributedText = newValue

            updateSpacing()
        }
    }

    public var usingInLargeNavigationBar = false {
        didSet {
            updateLayoutMarginsGuide()
            _style = .inverse
            updateColors()
            setNeedsUpdateConstraints()
        }
    }

    private var _style: HeaderViewStyle = .normal
    public var style: HeaderViewStyle {
        get {
            _style
        }
        set {
            guard !usingInLargeNavigationBar else { return }

            _style = newValue
            updateColors()
        }
    }

    public var pretitleHasSecondaryColor = false {
        didSet {
            pretitleLabel.textColor = pretitleHasSecondaryColor ? _style.textSecondaryColor : _style.textPrimaryColor
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
}

// MARK: - Private

private extension HeaderView {
    func setUpView() {
        layoutView()

        stylePretitleLabel()
        styleTitleLabel()
    }

    func layoutView() {
        // The view cannot be compressed or stretched
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)

        updateLayoutMarginsGuide()

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 24

        topStackView.axis = .vertical
        topStackView.spacing = 8

        bottomStackView.axis = .vertical
        bottomStackView.spacing = 16
        bottomStackView.alignment = .leading

        addSubview(constrainedToLayoutMarginsGuideOf: stackView)
        
        stackView.addArrangedSubview(topStackView)
        stackView.addArrangedSubview(bottomStackView)

        topStackView.addArrangedSubview(pretitleLabel)
        topStackView.addArrangedSubview(titleLabel)
    }

    func stylePretitleLabel() {
        pretitleLabel.isHidden = true
        pretitleLabel.font = .textPreset3(weight: .regular)
        pretitleLabel.textColor = _style.textPrimaryColor
    }

    func styleTitleLabel() {
        titleLabel.font = .textPreset6()
        titleLabel.textColor = _style.textPrimaryColor
        titleLabel.numberOfLines = 0
    }

    func updateLayoutMarginsGuide() {
        let top: CGFloat = usingInLargeNavigationBar ? 0 : 32
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: top, leading: 16, bottom: 24, trailing: 32)
    }

    func updateSpacing() {
        if !pretitleLabel.isHidden {
            stackView.setCustomSpacing(8, after: pretitleLabel)
        } else {
            stackView.setCustomSpacing(0, after: pretitleLabel)
        }

        stackView.spacing = 24
    }

    func updatePretitleLabelVisibilityState() {
        pretitleLabel.isHidden = pretitleLabel.text == nil && pretitleLabel.attributedText == nil
    }

    func updateTitleLabelVisibilityState() {
        titleLabel.isHidden = titleLabel.text == nil && titleLabel.attributedText == nil
    }

    func updateColors() {
        titleLabel.textColor = _style.textPrimaryColor
        pretitleLabel.textColor = pretitleHasSecondaryColor ? _style.textSecondaryColor : _style.textPrimaryColor
    }
}
