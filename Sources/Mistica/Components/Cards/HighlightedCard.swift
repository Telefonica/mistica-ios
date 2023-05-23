//
//  HighlightedCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class HighlightedCard: UIView {
    private enum Constants {
        static let closeButtonAlpha: CGFloat = 0.7
        static let closeButtonHeight: CGFloat = 48
        static let minHeight: CGFloat = 100
        static let maxRightImageWidth: CGFloat = 100
        static let defaultTextEdgeInsets = NSDirectionalEdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 56)
    }

    @frozen
    public enum RightImageStyle {
        case fit
        case fill
    }

    @frozen
    public enum ButtonStyle {
        case link
        case primary
        case secondary
    }

    private lazy var verticalStackView = UIStackView()
    private lazy var horizontalStackView = UIStackView()

    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var actionButton = Button()
    private lazy var closeButton = UIButton()
    private lazy var rightImageView = AlignmentImageView()
    private lazy var backgroundImageView = UIImageView()
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionButtonTapped))

    public var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    public var subtitle: String? {
        get {
            subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue
        }
    }

    public var subtitleAttributedText: NSAttributedString? {
        get {
            subtitleLabel.attributedText
        }
        set {
            subtitleLabel.attributedText = newValue
        }
    }

    public var rightImageStyle: RightImageStyle = .fill {
        didSet {
            updateRightImageViewStyle()
        }
    }

    public var rightImage: UIImage? {
        get {
            rightImageView.image
        }
        set {
            rightImageView.image = newValue
            updateRightImageViewVisibility()
        }
    }

    public var backgroundImage: UIImage? {
        get {
            backgroundImageView.image
        }
        set {
            backgroundImageView.image = newValue
            updateBackgroundImageViewVisibility()
        }
    }

    @objc public var actionButtonCallback: (() -> Void)?

    public var actionButtonTitle: String? {
        get {
            actionButton.title
        }
        set {
            actionButton.title = newValue
        }
    }

    public var actionButtonStyle: ButtonStyle = .primary {
        didSet {
            updateActionButtonStyle()
            updateTapGesture()
        }
    }

    public var showActionButton: Bool {
        get {
            actionButton.isHidden
        }
        set {
            actionButton.isHidden = !newValue
            updateTapGesture()
        }
    }

    public var closeButtonCallback: (() -> Void)?

    public var showCloseButton: Bool {
        get {
            closeButton.isHidden
        }
        set {
            closeButton.isHidden = !newValue
        }
    }

    public var style: HighlightedCardStyle = .normal {
        didSet {
            updateColors()
        }
    }

    override public var accessibilityElements: [Any]? {
        get {
            [
                horizontalStackView,
                closeButton.isHidden ? nil : closeButton
            ].compactMap { $0 }
        }
        set {}
    }

    public init(title: String? = nil,
                subtitle: String? = nil,
                rightImage: UIImage? = nil,
                actionButtonStyle: ButtonStyle = .primary) {
        super.init(frame: .zero)

        self.title = title
        self.subtitle = subtitle
        self.rightImage = rightImage
        self.actionButtonStyle = actionButtonStyle

        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override public var intrinsicContentSize: CGSize {
        horizontalStackView.intrinsicContentSize
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        closeButton.imageView?.backgroundColor = UIColor.white.withAlphaComponent(Constants.closeButtonAlpha)
        closeButton.imageView?.makeRounded()
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            updateFonts()
            updateRightImageViewVisibility()
        }

        if traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle {
            addBorder(color: .border)
        }
    }
}

// MARK: Custom Accessibilities

public extension HighlightedCard {
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

    var actionButtonAccessibilityLabel: String? {
        get {
            actionButton.accessibilityLabel
        }
        set {
            actionButton.accessibilityLabel = newValue
        }
    }

    var actionButtonAccessibilityIdentifier: String? {
        get {
            actionButton.accessibilityIdentifier
        }
        set {
            actionButton.accessibilityIdentifier = newValue
        }
    }

    var closeButtonAccessibilityLabel: String? {
        get {
            closeButton.accessibilityLabel
        }
        set {
            closeButton.accessibilityLabel = newValue
        }
    }

    var closeButtonAccessibilityIdentifier: String? {
        get {
            closeButton.accessibilityIdentifier
        }
        set {
            closeButton.accessibilityIdentifier = newValue
        }
    }

    var rightImageAccessibilityLabel: String? {
        get {
            rightImageView.accessibilityLabel
        }
        set {
            rightImageView.accessibilityLabel = newValue
        }
    }

    var rightImageAccessibilityIdentifier: String? {
        get {
            rightImageView.accessibilityIdentifier
        }
        set {
            rightImageView.accessibilityIdentifier = newValue
        }
    }

    var backgroundImageAccessibilityLabel: String? {
        get {
            backgroundImageView.accessibilityLabel
        }
        set {
            backgroundImageView.accessibilityLabel = newValue
        }
    }

    var backgroundImageAccessibilityIdentifier: String? {
        get {
            backgroundImageView.accessibilityIdentifier
        }
        set {
            backgroundImageView.accessibilityIdentifier = newValue
        }
    }
}

// MARK: Private

private extension HighlightedCard {
    func commonInit() {
        addViews()
        layoutView()
        styleViews()
        updateTapGesture()
        updateColors()
        updateFonts()
    }

    func addViews() {
        addSubview(backgroundImageView, constraints: [
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)
        ])

        addSubview(withDefaultConstraints: horizontalStackView)

        addSubview(closeButton, constraints: [
            closeButton.topAnchor.constraint(equalTo: topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.closeButtonHeight)
        ])
    }

    func layoutView() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.minHeight),
            rightImageView.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.maxRightImageWidth)
        ])

        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.isLayoutMarginsRelativeArrangement = true
        verticalStackView.directionalLayoutMargins = Constants.defaultTextEdgeInsets
        verticalStackView.insetsLayoutMarginsFromSafeArea = false
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleLabel)
        verticalStackView.addArrangedSubview(actionButton)
        verticalStackView.setCustomSpacing(8, after: titleLabel)
        verticalStackView.setCustomSpacing(16, after: subtitleLabel)
        verticalStackView.addGestureRecognizer(tapGesture)

        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 8
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(rightImageView)
    }

    func styleViews() {
        titleLabel.numberOfLines = 0
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .vertical)

        subtitleLabel.numberOfLines = 0
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentHuggingPriority(.required, for: .vertical)

        actionButton.isSmall = true
        actionButton.contentMode = .left
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)

        rightImageView.backgroundColor = .clear
        rightImageView.clipsToBounds = true
        rightImageView.setContentCompressionResistancePriority(.required, for: .horizontal)

        updateRightImageViewVisibility()
        updateRightImageViewStyle()

        backgroundImageView.clipsToBounds = true
        updateBackgroundImageViewVisibility()

        closeButton.setImage(.closeButtonBlackSmallIcon, for: .normal)
        closeButton.imageEdgeInsets.left = 8
        closeButton.imageEdgeInsets.bottom = 8
        closeButton.clipsToBounds = true
        closeButton.isHidden = true

        addBorder(color: .border)
        setMisticaRadius(.container)
        clipsToBounds = true
    }

    func updateRightImageViewVisibility() {
        if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
            rightImageView.isHidden = true
        } else {
            rightImageView.isHidden = rightImageView.image == nil
        }

        if rightImageView.isHidden {
            verticalStackView.directionalLayoutMargins.trailing = Constants.defaultTextEdgeInsets.trailing
        } else {
            verticalStackView.directionalLayoutMargins.trailing = 0
        }
    }

    func updateRightImageViewStyle() {
        switch rightImageStyle {
        case .fit:
            rightImageView.contentMode = .scaleAspectFit
            rightImageView.verticalAlignment = .bottom
            rightImageView.horizontalAlignment = .right
        case .fill:
            rightImageView.contentMode = .scaleAspectFill
            rightImageView.verticalAlignment = .center
            rightImageView.horizontalAlignment = .center
        }
    }

    func updateBackgroundImageViewVisibility() {
        backgroundImageView.isHidden = backgroundImageView.image == nil
    }

    func updateColors() {
        backgroundColor = style.backgroundColor
        titleLabel.textColor = style.titleColor
        subtitleLabel.textColor = style.subtitleColor
        updateActionButtonStyle()
    }

    func updateActionButtonStyle() {
        switch actionButtonStyle {
        case .primary:
            actionButton.style = style.primaryButtonStyle
        case .secondary:
            actionButton.style = style.secondaryButtonStyle
        case .link:
            actionButton.style = style.linkButtonStyle
        }
    }

    func updateFonts() {
        titleLabel.font = .textPreset4(weight: .regular)
        subtitleLabel.font = .textPreset2(weight: .regular)
        updateActionButtonStyle()
    }

    func updateTapGesture() {
        tapGesture.isEnabled = actionButton.isHidden || actionButtonStyle == .link
    }

    @objc func actionButtonTapped() {
        actionButtonCallback?()
    }
}
