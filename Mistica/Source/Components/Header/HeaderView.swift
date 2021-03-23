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
    private let preAmountLabel = UILabel()
    private let amountLabel = UILabel()
    // The buttons must be the same width of the bigger button
    private let buttonsContainerView = IntrinsicMaxButtonWidthContainerView()
    private let subtitleLabel = UILabel()

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

    public var preAmount: String? {
        get {
            preAmountLabel.text
        }
        set {
            preAmountLabel.text = newValue
            updatePreamountLabelVisibilityState()
            updateSpacing()
        }
    }

    public var preAmountAttributedText: NSAttributedString? {
        get {
            preAmountLabel.attributedText
        }
        set {
            preAmountLabel.attributedText = newValue
            updatePreamountLabelVisibilityState()
            updateSpacing()
        }
    }

    public var amount: String? {
        get {
            amountLabel.text
        }
        set {
            amountLabel.text = newValue
            updateAmountLabelVisibilityState()

            updateSpacing()
        }
    }

    public var amountAttributedText: NSAttributedString? {
        get {
            amountLabel.attributedText
        }
        set {
            amountLabel.attributedText = newValue
            updateAmountLabelVisibilityState()

            updateSpacing()
        }
    }

    public var primaryActionTitle: String? {
        get {
            buttonsContainerView.primaryButton.title
        }
        set {
            buttonsContainerView.primaryButton.title = newValue
            buttonsContainerView.primaryButton.isHidden = newValue == nil
            hideButtonsContainerViewIfNeeded()
            invalidateIntrinsicContentSize()
            updateSpacing()
        }
    }

    public var primaryActionCallback: (() -> Void)?

    public var secondaryActionTitle: String? {
        get {
            buttonsContainerView.secondaryButton.title
        }
        set {
            buttonsContainerView.secondaryButton.title = newValue
            buttonsContainerView.secondaryButton.isHidden = newValue == nil
            hideButtonsContainerViewIfNeeded()
            invalidateIntrinsicContentSize()
            updateSpacing()
        }
    }

    public var secondaryActionCallback: (() -> Void)?

    public var subtitle: String? {
        get {
            subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue
            updateSubtitleLabelVisibilityState()
            updateSpacing()
        }
    }

    public var subtitleAttributedText: NSAttributedString? {
        get {
            subtitleLabel.attributedText
        }
        set {
            subtitleLabel.attributedText = newValue
            updateAmountLabelVisibilityState()

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

    public var preAmountHasSecondaryColor = false {
        didSet {
            preAmountLabel.textColor = preAmountHasSecondaryColor ? _style.textSecondaryColor : _style.textPrimaryColor
        }
    }

    public var amountHasDangerColor = false {
        didSet {
            updateAmountLabelTextColor()
        }
    }

    public var subtitleHasSecondaryColor = false {
        didSet {
            subtitleLabel.textColor = subtitleHasSecondaryColor ? _style.textSecondaryColor : _style.textPrimaryColor
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

    var preAmountAccessibilityLabel: String? {
        get {
            preAmountLabel.accessibilityLabel
        }
        set {
            preAmountLabel.accessibilityLabel = newValue
        }
    }

    var preAmountAccessibilityIdentifier: String? {
        get {
            preAmountLabel.accessibilityIdentifier
        }
        set {
            preAmountLabel.accessibilityIdentifier = newValue
        }
    }

    var amountAccessibilityLabel: String? {
        get {
            amountLabel.accessibilityLabel
        }
        set {
            amountLabel.accessibilityLabel = newValue
        }
    }

    var amountAccessibilityIdentifier: String? {
        get {
            amountLabel.accessibilityIdentifier
        }
        set {
            amountLabel.accessibilityIdentifier = newValue
        }
    }

    var primaryActionAccessibilityLabel: String? {
        get {
            buttonsContainerView.primaryButton.accessibilityLabel
        }
        set {
            buttonsContainerView.primaryButton.accessibilityLabel = newValue
        }
    }

    var primaryActionAccessibilityIdentifier: String? {
        get {
            buttonsContainerView.primaryButton.accessibilityIdentifier
        }
        set {
            buttonsContainerView.primaryButton.accessibilityIdentifier = newValue
        }
    }

    var secondaryActionAccessibilityLabel: String? {
        get {
            buttonsContainerView.secondaryButton.accessibilityLabel
        }
        set {
            buttonsContainerView.secondaryButton.accessibilityLabel = newValue
        }
    }

    var secondaryActionAccessibilityIdentifier: String? {
        get {
            buttonsContainerView.secondaryButton.accessibilityIdentifier
        }
        set {
            buttonsContainerView.secondaryButton.accessibilityIdentifier = newValue
        }
    }

    var subtitleAccessibilityLabel: String? {
        get {
            subtitleLabel.accessibilityLabel
        }
        set {
            subtitleLabel.accessibilityLabel = newValue
        }
    }

    var subtitleAccessibilityIdentifier: String? {
        get {
            subtitleLabel.accessibilityIdentifier
        }
        set {
            subtitleLabel.accessibilityIdentifier = newValue
        }
    }
}

// MARK: - Private

private extension HeaderView {
    func setUpView() {
        layoutView()

        stylePretitleLabel()
        styleTitleLabel()
        stylePreamountLabel()
        styleAmountLabel()
        styleSubtitleLabel()
        styleButtons()
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

        bottomStackView.addArrangedSubview(preAmountLabel)
        bottomStackView.addArrangedSubview(amountLabel)
        bottomStackView.addArrangedSubview(buttonsContainerView)
        bottomStackView.addArrangedSubview(subtitleLabel)
    }

    func stylePretitleLabel() {
        pretitleLabel.isHidden = true
        pretitleLabel.font = .preset3(weight: .regular)
        pretitleLabel.textColor = _style.textPrimaryColor
    }

    func styleTitleLabel() {
        titleLabel.font = .preset6(weight: .light)
        titleLabel.textColor = _style.textPrimaryColor
        titleLabel.numberOfLines = 0
    }

    func stylePreamountLabel() {
        preAmountLabel.isHidden = true
        preAmountLabel.font = .preset3(weight: .regular)
        preAmountLabel.textColor = _style.textPrimaryColor
    }

    func styleAmountLabel() {
        amountLabel.isHidden = true
        amountLabel.font = .preset8(weight: .light)
        amountLabel.textColor = _style.textPrimaryColor
    }

    func styleSubtitleLabel() {
        subtitleLabel.isHidden = true
        subtitleLabel.font = .preset3(weight: .regular)
        subtitleLabel.textColor = _style.textPrimaryColor
    }

    func styleButtons() {
        buttonsContainerView.isHidden = true

        buttonsContainerView.primaryButton.isHidden = true
        buttonsContainerView.primaryButton.addTarget(self, action: #selector(primaryButtonTapped), for: .touchUpInside)

        buttonsContainerView.secondaryButton.isHidden = true
        buttonsContainerView.secondaryButton.addTarget(self, action: #selector(secondaryButtonTapped), for: .touchUpInside)
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

        if !preAmountLabel.isHidden {
            bottomStackView.setCustomSpacing(8, after: preAmountLabel)
        } else {
            bottomStackView.setCustomSpacing(0, after: preAmountLabel)
        }

        if areViewsAfterTitleHidden() {
            stackView.spacing = 0
        } else {
            stackView.spacing = 24
        }
    }

    func areViewsAfterTitleHidden() -> Bool {
        let viewsAfterTitle: [UIView] = [
            preAmountLabel,
            amountLabel,
            buttonsContainerView.primaryButton,
            buttonsContainerView.secondaryButton,
            subtitleLabel
        ]

        return viewsAfterTitle.reduce(true) { (acc, view) -> Bool in
            acc && view.isHidden
        }
    }

    @objc func primaryButtonTapped() {
        primaryActionCallback?()
    }

    @objc func secondaryButtonTapped() {
        secondaryActionCallback?()
    }

    func updatePretitleLabelVisibilityState() {
        pretitleLabel.isHidden = pretitleLabel.text == nil && pretitleLabel.attributedText == nil
    }

    func updateTitleLabelVisibilityState() {
        titleLabel.isHidden = titleLabel.text == nil && titleLabel.attributedText == nil
    }

    func updatePreamountLabelVisibilityState() {
        preAmountLabel.isHidden = preAmountLabel.text == nil && preAmountLabel.attributedText == nil
    }

    func updateAmountLabelVisibilityState() {
        amountLabel.isHidden = amountLabel.text == nil && amountLabel.attributedText == nil
    }

    func updateSubtitleLabelVisibilityState() {
        subtitleLabel.isHidden = subtitleLabel.text == nil && subtitleLabel.attributedText == nil
    }

    func updateColors() {
        backgroundColor = usingInLargeNavigationBar ? .navigationBarBackground : _style.backgroundColor
        buttonsContainerView.primaryButton.style = _style.primaryButton
        buttonsContainerView.secondaryButton.style = _style.secondaryButton
        titleLabel.textColor = _style.textPrimaryColor
        pretitleLabel.textColor = pretitleHasSecondaryColor ? _style.textSecondaryColor : _style.textPrimaryColor
        preAmountLabel.textColor = preAmountHasSecondaryColor ? _style.textSecondaryColor : _style.textPrimaryColor
        subtitleLabel.textColor = subtitleHasSecondaryColor ? _style.textSecondaryColor : _style.textPrimaryColor
        updateAmountLabelTextColor()
    }

    func updateAmountLabelTextColor() {
        guard !amountHasDangerColor else {
            amountLabel.textColor = .highlight
            return
        }

        amountLabel.textColor = _style.textPrimaryColor
    }

    /// When both buttons are hidden, we need to hide the container view also to avoid an extra space with the below subview.
    func hideButtonsContainerViewIfNeeded() {
        let primnaryButtonHidden = buttonsContainerView.primaryButton.isHidden
        let secondaryButtonHidden = buttonsContainerView.secondaryButton.isHidden

        buttonsContainerView.isHidden = primnaryButtonHidden && secondaryButtonHidden
    }
}
