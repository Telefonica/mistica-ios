//
//  Button.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

open class Button: UIControl {
    private enum Constants {
        static let animationDuration: TimeInterval = 0.3
        static let animationCurveControlPoint1 = CGPoint(x: 0.77, y: 0)
        static let animationCurveControlPoint2 = CGPoint(x: 0.175, y: 1)
        static let borderWidth: CGFloat = 1.5
        static let enabledAlpha: CGFloat = 1.0
        static let disabledAlpha: CGFloat = 0.5
    }

    public struct Style {
        public let allowsBleedingAlignment: Bool
        public let stateStyleByState: [State: StateStyle]
        public var overriddenSizes: OverriddenSizes?

        public struct OverriddenSizes {
            public let insets: UIEdgeInsets
            public let minimumWidth: CGFloat
            public let font: UIFont
            public let rightImageHeight: CGFloat?

            public init(
                insets: UIEdgeInsets,
                minimumWidth: CGFloat,
                font: UIFont,
                rightImageHeight: CGFloat? = nil
            ) {
                self.insets = insets
                self.minimumWidth = minimumWidth
                self.font = font
                self.rightImageHeight = rightImageHeight
            }
        }

        public init(allowsBleedingAlignment: Bool,
                    stateStyleByState: [State: Button.StateStyle],
                    overriddenSizes: Button.Style.OverriddenSizes? = nil) {
            self.allowsBleedingAlignment = allowsBleedingAlignment
            self.stateStyleByState = stateStyleByState
            self.overriddenSizes = overriddenSizes
        }
    }

    public struct StateStyle {
        public let textColor: UIColor
        public let backgroundColor: UIColor
        public let borderColor: UIColor

        public init(textColor: UIColor, backgroundColor: UIColor, borderColor: UIColor) {
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
        }
    }

    public enum RightImage {
        case chevron
        case custom(image: UIImage)

        private var _image: UIImage {
            switch self {
            case .chevron: return .chevron
            case let .custom(image: image): return image
            }
        }

        var image: UIImage {
            _image.withRenderingMode(.alwaysTemplate)
        }

        var space: CGFloat {
            switch self {
            case .chevron: return 2
            case .custom: return 8
            }
        }
    }

    public var style: Style {
        didSet {
            updateStyle()
        }
    }

    public var isSmall: Bool {
        didSet {
            updateStyle()
        }
    }

    @objc public var title: String? {
        get { container.title }
        set { container.title = newValue }
    }

    @objc public var loadingTitle: String? {
        get { container.loadingTitle }
        set { container.loadingTitle = newValue }
    }

    public var rightImage: RightImage? {
        get { container.rightImage }
        set { container.rightImage = newValue }
    }

    private var overridenAccessibilityLabel: String?
    private var isShowingLoadingAnimation = false

    private lazy var animator = UIViewPropertyAnimator(
        duration: Constants.animationDuration,
        controlPoint1: Constants.animationCurveControlPoint1,
        controlPoint2: Constants.animationCurveControlPoint2
    )

    private lazy var container = ButtonContentView()

    public convenience init() {
        self.init(title: "")
    }

    public init(style: Style = .primary, title: String, rightImage: RightImage? = nil, loadingTitle: String? = nil, isSmall: Bool = false) {
        self.style = style
        self.isSmall = isSmall

        super.init(frame: .zero)

        self.title = title
        self.rightImage = rightImage
        self.loadingTitle = loadingTitle
        commonInit()
    }

    public required init?(coder: NSCoder) {
        style = .primary
        isSmall = false

        super.init(coder: coder)

        commonInit()
    }

    override public var contentMode: UIView.ContentMode {
        get { super.contentMode }
        set {
            super.contentMode = newValue
            updateInsets()
        }
    }

    override public var alignmentRectInsets: UIEdgeInsets {
        UIEdgeInsets(top: 0, left: leftBleedingInsets, bottom: 0, right: rightBleedingInsets)
    }

    override public var intrinsicContentSize: CGSize {
        container.intrinsicContentSize
    }

    public var isLoading = false {
        didSet {
            didUpdateState()
        }
    }

    override open var isHighlighted: Bool {
        didSet {
            didUpdateState()
        }
    }

    override open var isSelected: Bool {
        didSet {
            didUpdateState()
        }
    }

    override open var isEnabled: Bool {
        didSet {
            didUpdateState()
        }
    }

    override open var state: UIControl.State {
        if isLoading {
            return .loading
        } else if !isEnabled {
            return .disabled
        } else if isSelected || isHighlighted {
            return .selected
        } else {
            return .normal
        }
    }

    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !isLoading else { return nil }
        return super.hitTest(point, with: event)
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        applyStyleColors()
    }

    override open func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        setMisticaRadius(.button)
    }
}

@objc public extension Button {
    override var accessibilityLabel: String? {
        get {
            if isLoading {
                return loadingTitle
            } else if overridenAccessibilityLabel != nil {
                return overridenAccessibilityLabel
            } else {
                return title
            }
        }
        set {
            overridenAccessibilityLabel = newValue
        }
    }
}

private extension Button {
    var styleInsets: UIEdgeInsets {
        style.insets(isSmall: isSmall)
    }

    var leftBleedingInsets: CGFloat {
        guard style.allowsBleedingAlignment else { return 0 }
        guard contentMode == .left else { return 0 }

        return styleInsets.left
    }

    var rightBleedingInsets: CGFloat {
        guard style.allowsBleedingAlignment else { return 0 }
        guard contentMode == .right else { return 0 }

        return styleInsets.right
    }

    func updateInsets() {
        var insets = styleInsets
        insets.left -= leftBleedingInsets
        insets.right -= rightBleedingInsets
        container.layoutMargins = insets
        container.insetsLayoutMarginsFromSafeArea = false
        invalidateIntrinsicContentSize()
    }

    func updateStyle() {
        applyStyleColors()
        updateInsets()
        container.minimumWidth = style.minimumWidth(isSmall: isSmall)
        container.font = style.font(isSmall: isSmall)
        container.rightImageHeight = style.rightImageHeight(isSmall: isSmall)
    }

    func commonInit() {
        setUpView()
        setUpContainer()
        updateStyle()
    }

    func setUpView() {
        layer.borderWidth = Constants.borderWidth
        isAccessibilityElement = true
        updateTraits()
    }

    func setUpContainer() {
        container.isUserInteractionEnabled = false
        addSubview(withDefaultConstraints: container)
    }

    func applyStyleColors() {
        guard let stateStyle = style.stateStyleByState[state] else {
            preconditionFailure("Style \(style) does not have stateStyle for state \(state). Check that the current style is defined properly.")
        }

        container.textColor = stateStyle.textColor
        backgroundColor = stateStyle.backgroundColor
        layer.borderColor = stateStyle.borderColor.cgColor
        alpha = state != .disabled ? Constants.enabledAlpha : Constants.disabledAlpha
    }

    func didUpdateState() {
        if isLoading {
            animator.stopAnimation(true)

            // transition to loading
            UIAccessibility.post(notification: .layoutChanged, argument: loadingTitle)

            container.willTransitionToLoading()
            animator.addAnimations { [weak self] in
                self?.container.transitionToLoading()
                self?.applyStyleColors()
            }
            updateTraits()
            isShowingLoadingAnimation = true
            animator.startAnimation()
        } else if isShowingLoadingAnimation {
            animator.stopAnimation(true)

            // transition to normal
            animator.addAnimations { [weak self] in
                self?.container.transitionToNormal()
                self?.applyStyleColors()
            }
            animator.addCompletion { [weak self] _ in
                guard let s = self else { return }
                UIAccessibility.post(notification: .layoutChanged, argument: s.accessibilityLabel)
                s.updateTraits()
            }
            isShowingLoadingAnimation = false
            animator.startAnimation()
        } else {
            applyStyleColors()
            updateTraits()
        }
    }

    func updateTraits() {
        accessibilityTraits = state.accesibilityTraits
    }
}

private extension Button.State {
    var accesibilityTraits: UIAccessibilityTraits {
        if contains(.disabled) || contains(.loading) {
            return [.button, .notEnabled]
        } else {
            return .button
        }
    }
}

// MARK: Objective-C API

@objc public extension Button {
    func objc_setNormalState() {
        isLoading = false
        isSelected = false
        isEnabled = true
    }

    func objc_setLoadingState() {
        isLoading = true
    }

    func objc_setDisabledState() {
        isEnabled = false
    }

    func objc_setLinkStyle() {
        style = .link
    }
}

// MARK: Useful extensions

public extension Button.State {
    static let loading = UIControl.State(rawValue: 1 << 50) // Arbitrary value
}

extension Button.State: Swift.Hashable {}
