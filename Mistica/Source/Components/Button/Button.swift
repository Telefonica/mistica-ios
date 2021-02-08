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
        static let cornerRadius: CGFloat = 4
        static let borderWidth: CGFloat = 1.5
    }

    public struct Style {
        public let allowsBleedingAlignment: Bool
        public let stateStyleByState: [State: StateStyle]
        public var overriddenSizes: OverriddenSizes?

        public struct OverriddenSizes {
            public let insets: UIEdgeInsets
            public let minimumWidth: CGFloat
            public let font: UIFont

            public init(insets: UIEdgeInsets, minimumWidth: CGFloat, font: UIFont) {
                self.insets = insets
                self.minimumWidth = minimumWidth
                self.font = font
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

    public init(style: Style = .primary, title: String, loadingTitle: String? = nil, isSmall: Bool = false) {
        self.style = style
        self.isSmall = isSmall

        super.init(frame: .zero)

        self.title = title
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
    
    open override var isSelected: Bool {
        didSet {
            didUpdateState()
        }
    }
    
    open override var isEnabled: Bool {
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

    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !isLoading else { return nil }
        return super.hitTest(point, with: event)
    }
}

@objc public extension Button {
    override var accessibilityLabel: String? {
        get {
            if state.contains(.loading) {
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
    }

    func commonInit() {
        setUpView()
        setUpContainer()
        updateStyle()
    }

    func setUpView() {
        layer.cornerRadius = Constants.cornerRadius
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        layer.borderWidth = Constants.borderWidth
        isAccessibilityElement = true
        updateTraits()
    }

    func setUpContainer() {
        container.isUserInteractionEnabled = false
        addSubview(withDefaultConstraints: container)
    }

    func applyStyleColors() {
        let stateStyle: StateStyle

        if state.contains(.loading) {
            stateStyle = style.stateStyleByState[.loading]!
        } else if state.contains(.disabled) {
            stateStyle = style.stateStyleByState[.disabled]!
        } else if state.contains(.selected) {
            stateStyle = style.stateStyleByState[.selected]!
        } else {
            stateStyle = style.stateStyleByState[.normal]!
        }

        container.textColor = stateStyle.textColor
        backgroundColor = stateStyle.backgroundColor
        layer.borderColor = stateStyle.borderColor.cgColor
    }

    func didUpdateState() {
        if state.contains(.loading) {
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

extension Button.State: Hashable {}
