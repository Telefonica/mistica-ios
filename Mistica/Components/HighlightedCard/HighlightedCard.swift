//
//  HighlightedCard.swift
//  Mistica
//
//  Created by Jose Maria Puerta on 18/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//


import UIKit

public class HighlightedCard: UIView {
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
    private lazy var rightImageViewContainer = UIView()
    private lazy var rightImageView = UIImageView()
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
            updateColors()
            updateTapGesture()
        }
    }
    
    public var showActionButton: Bool {
        get {
            actionButton.isHidden
        }
        set {
            actionButton.isHidden = newValue
            updateTapGesture()
        }
    }
    
    public var closeButtonCallback: (() -> Void)?
    
    public var showCloseButton: Bool {
        get {
            closeButton.isHidden
        }
        set {
            closeButton.isHidden = newValue
        }
    }
    
    private var _style: HighlightedCardStyle = .normal
    public var style: HighlightedCardStyle {
        get {
            _style
        }
        set {
            _style = newValue
            updateColors()
        }
    }

    public convenience init(title: String? = nil,
                            subtitle: String? = nil,
                            rightImage: UIImage? = nil,
                            actionButtonStyle: ButtonStyle = .primary) {
        self.init(frame: .zero)
        self.title = title
        self.subtitle = subtitle
        self.rightImage = rightImage
        self.actionButtonStyle = actionButtonStyle
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public var intrinsicContentSize: CGSize {
        horizontalStackView.intrinsicContentSize
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        closeButton.imageView?.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        closeButton.imageView?.makeRounded()
    }
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory else { return }
        updateFonts()
        updateRightImageViewVisibility()
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
    
    var imageAccessibilityLabel: String? {
        get {
            rightImageView.accessibilityLabel
        }
        set {
            rightImageView.accessibilityLabel = newValue
        }
    }

    var imageAccessibilityIdentifier: String? {
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
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
        ])
        
        addSubview(withDefaultConstraints: horizontalStackView)
        
        addSubview(closeButton, constraints: [
            closeButton.topAnchor.constraint(equalTo: topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        rightImageViewContainer.addSubview(rightImageView, constraints: [
            rightImageViewContainer.widthAnchor.constraint(equalToConstant: 100),
            rightImageView.leadingAnchor.constraint(equalTo: rightImageViewContainer.leadingAnchor),
            rightImageView.trailingAnchor.constraint(equalTo: rightImageViewContainer.trailingAnchor),
            rightImageView.bottomAnchor.constraint(equalTo: rightImageViewContainer.bottomAnchor),
        ])
    }
    
    func layoutView() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])

        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.isLayoutMarginsRelativeArrangement = true
        verticalStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 0)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleLabel)
        verticalStackView.addArrangedSubview(actionButton)
        verticalStackView.setCustomSpacing(8, after: titleLabel)
        verticalStackView.setCustomSpacing(16, after: subtitleLabel)
        verticalStackView.addGestureRecognizer(tapGesture)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 8
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(rightImageViewContainer)
    }

    func styleViews() {
        titleLabel.numberOfLines = 2

        subtitleLabel.numberOfLines = 3
        
        actionButton.isSmall = true
        actionButton.contentMode = .left
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)

        rightImageView.contentMode = .scaleAspectFill
        rightImageView.backgroundColor = .clear

        rightImageViewContainer.clipsToBounds = true
        rightImageViewContainer.isHidden = true

        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.isHidden = true
        
        closeButton.setImage(.closeButtonBlackSmallIcon, for: .normal)
        closeButton.imageEdgeInsets.left = 8
        closeButton.imageEdgeInsets.bottom = 8
        closeButton.clipsToBounds = true
        closeButton.isHidden = true
        
        addBorder()
        makeRounded(cornerRadius: 4)
    }
    
    func updateRightImageViewVisibility() {
        if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
            rightImageViewContainer.isHidden = true
        } else {
            rightImageViewContainer.isHidden = rightImageView.image == nil
        }
    }
    
    func updateBackgroundImageViewVisibility() {
        backgroundImageView.isHidden = backgroundImageView.image == nil
    }
    
    func updateColors() {
        backgroundColor = _style.backgroundColor
        titleLabel.textColor = _style.titleColor
        subtitleLabel.textColor = _style.subtitleColor
        updateButtonStyle()
    }
    
    func updateButtonStyle() {
        switch actionButtonStyle {
        case .primary:
            actionButton.style = _style.primaryButtonStyle
        case .secondary:
            actionButton.style = _style.secondaryButtonStyle
        case .link:
            actionButton.style = _style.linkButtonStyle
        }
    }
    
    func updateFonts() {
        titleLabel.font = .title1
        subtitleLabel.font = .sub1
        updateButtonStyle()
    }
    
    func updateTapGesture() {
        tapGesture.isEnabled = actionButton.isHidden || actionButtonStyle == .link
    }
    
    @objc func actionButtonTapped() {
        actionButtonCallback?()
    }
}
