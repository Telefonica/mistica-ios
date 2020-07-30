//
//  Button.swift
//  Mistica
//
//  Created by Pablo Carcelén on 24/09/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

open class Button: UIView {
    private enum Constants {
        static let animationDuration: TimeInterval = 0.3
        static let animationCurveControlPoint1 = CGPoint(x: 0.77, y: 0)
        static let animationCurveControlPoint2 = CGPoint(x: 0.175, y: 1)
        static let cornerRadius: CGFloat = 4
        static let borderWidth: CGFloat = 1.5
    }

    public enum State {
        case normal
        case selected
        case disabled
        case loading
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
                    stateStyleByState: [Button.State: Button.StateStyle],
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

    public var state: State = .normal {
        didSet {
            didUpdateState(previousState: oldValue)
        }
    }

    private var overridenAccessibilityLabel: String?

    private lazy var animator = UIViewPropertyAnimator(duration: Constants.animationDuration,
                                                       controlPoint1: Constants.animationCurveControlPoint1,
                                                       controlPoint2: Constants.animationCurveControlPoint2)

    private lazy var backingButton = BackingButton()
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

    override public var tag: Int {
        get { backingButton.tag }
        set { backingButton.tag = newValue }
    }

    override public var intrinsicContentSize: CGSize {
        container.intrinsicContentSize
    }
}

@objc public extension Button {
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        backingButton.addTarget(target, action: action, for: controlEvents)
    }

    override var accessibilityLabel: String? {
        get {
            if state == .loading {
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

    override func accessibilityActivate() -> Bool {
        if state.shouldBackingButtonBeEnabled {
            backingButton.sendActions(for: .touchUpInside)
            return true
        } else {
            return false
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
        setUpBackingButton()
        updateStyle()
    }

    func setUpView() {
        layer.cornerRadius = Constants.cornerRadius
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        layer.borderWidth = Constants.borderWidth
        isAccessibilityElement = true
    }

    func setUpContainer() {
        addSubview(withDefaultConstraints: container)
    }

    func setUpBackingButton() {
        updateBackingButtonEnabled()
        backingButton.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .horizontal)
        backingButton.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .vertical)
        addSubview(withDefaultConstraints: backingButton)
        backingButton.isHighlightedDidChangeHandler = { [weak self] in
            self?.updateStateBasedOnBackingButton()
        }
    }

    func applyStyleColors() {
        guard let stateStyle = style.stateStyleByState[state] else {
            preconditionFailure("Style \(style) does not have stateStyle for state \(state). Check that the current style is defined properly.")
        }
        container.textColor = stateStyle.textColor
        backgroundColor = stateStyle.backgroundColor
        layer.borderColor = stateStyle.borderColor.cgColor
    }

    func didUpdateState(previousState: State) {
        if state == .loading {
            animator.stopAnimation(true)

            // transition to loading
            UIAccessibility.post(notification: .layoutChanged, argument: loadingTitle)

            container.willTransitionToLoading()
            animator.addAnimations { [weak self] in
                self?.container.transitionToLoading()
                self?.applyStyleColors()
            }
            updateBackingButtonEnabled()
            animator.startAnimation()
        } else if previousState == .loading {
            animator.stopAnimation(true)

            // transition to normal
            animator.addAnimations { [weak self] in
                self?.container.transitionToNormal()
                self?.applyStyleColors()
            }
            animator.addCompletion { [weak self] _ in
                guard let s = self else { return }
                UIAccessibility.post(notification: .layoutChanged, argument: s.accessibilityLabel)
                s.updateBackingButtonEnabled()
            }
            animator.startAnimation()
        } else {
            applyStyleColors()
            updateBackingButtonEnabled()
        }
    }

    func updateBackingButtonEnabled() {
        accessibilityTraits = state.accesibilityTraits
        backingButton.isEnabled = state.shouldBackingButtonBeEnabled
    }

    func updateStateBasedOnBackingButton() {
        if backingButton.isHighlighted && state == .normal {
            state = .selected
        } else if !backingButton.isHighlighted && state == .selected {
            state = .normal
        }
    }
}

private extension Button.State {
    var shouldBackingButtonBeEnabled: Bool {
        switch self {
        case .disabled, .loading: return false
        case .normal, .selected: return true
        }
    }

    var accesibilityTraits: UIAccessibilityTraits {
        if shouldBackingButtonBeEnabled {
            return .button
        } else {
            return [.button, .notEnabled]
        }
    }
}

// MARK: Dummy button

private class BackingButton: UIButton {
    var isHighlightedDidChangeHandler: (() -> Void)?

    override var isHighlighted: Bool {
        didSet {
            isHighlightedDidChangeHandler?()
        }
    }

    init() {
        super.init(frame: .zero)
        accessibilityElementsHidden = true
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Objective-C API

@objc public extension Button {
    func objc_setNormalState() {
        state = .normal
    }

    func objc_setLoadingState() {
        state = .loading
    }

    func objc_setDisabledState() {
        state = .disabled
    }

    func objc_setLinkStyle() {
        style = .link
    }
}
