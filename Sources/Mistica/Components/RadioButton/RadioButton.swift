//
//  RadioButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import CoreGraphics

import UIKit

public class RadioButton: UIControl {
    private enum Constants {
        static let viewWidth = CGFloat(20)
        static let animationDuration = Double(0.4)
        nonisolated(unsafe) static let timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
    }

    private var _isActivated = false
    /// A Boolean value that determines the off/on state of the RadioButton
    public var isActivated: Bool {
        get {
            _isActivated
        }
        set {
            guard _isActivated != newValue else { return }
            _isActivated = newValue
            updateViewStyleAnimated(activated: newValue)
        }
    }

    // Called when the RadioButton changes its value.
    public var onValueChanged: ((Bool) -> Void)?

    public convenience init() {
        self.init(frame: .zero)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2.0
        layer.masksToBounds = true
    }

    override public var accessibilityTraits: UIAccessibilityTraits {
        get {
            if isActivated {
                return super.accessibilityTraits.union([.button, .selected])
            } else {
                return super.accessibilityTraits.union([.button])
            }
        }
        set {
            super.accessibilityTraits = newValue
        }
    }

    override public var allControlEvents: UIControl.Event {
        [.valueChanged]
    }

    override public var intrinsicContentSize: CGSize {
        let diameter = UIFontMetrics.default.scaledValue(for: Constants.viewWidth)
        return CGSize(width: diameter, height: diameter)
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        updateViewStyleAnimated(activated: isActivated)
    }

    public func setActivated(_ activated: Bool, animated: Bool) {
        guard _isActivated != activated else { return }

        _isActivated = activated
        if animated {
            updateViewStyleAnimated(activated: activated)
        } else {
            updateViewStyle(activated: activated)
        }
    }
}

private extension RadioButton {
    func commonInit() {
        updateViewStyle(activated: isActivated)

        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGesture)

        isAccessibilityElement = true
    }

    @objc func didTap() {
        isActivated.toggle()

        sendActions(for: .valueChanged)
        onValueChanged?(isActivated)

        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }

    func updateViewStyleAnimated(activated: Bool) {
        let animation = CAAnimationGroup()

        let duration = Constants.animationDuration

        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = layer.borderWidth
        borderWidthAnimation.duration = duration

        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        borderColorAnimation.fromValue = layer.borderColor
        borderColorAnimation.duration = duration

        updateViewStyle(activated: activated)

        borderWidthAnimation.toValue = layer.borderWidth
        borderColorAnimation.toValue = layer.borderColor

        animation.animations = [borderWidthAnimation, borderColorAnimation]
        animation.duration = duration
        animation.timingFunction = Constants.timingFunction

        layer.add(animation, forKey: "group")
    }

    func updateViewStyle(activated: Bool) {
        if activated {
            layer.backgroundColor = UIColor.white.cgColor
            layer.borderColor = UIColor.controlActivated.cgColor
            layer.borderWidth = intrinsicContentSize.width / 4.0
        } else {
            layer.backgroundColor = UIColor.background.cgColor
            layer.borderColor = UIColor.control.cgColor
            layer.borderWidth = 1
        }
    }
}
