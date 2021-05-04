//
//  Checkbox.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import CoreGraphics
import UIKit

public class Checkbox: UIControl {
    private enum Constants {
        static let viewWidth = CGFloat(18)
        static let cornerRadius = CGFloat(2)
        static let animationDuration = Double(0.4)
        static let timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
    }

    private let imageView = UIImageView(image: .checkmarkIcon)
    private let borderView = UIView()

    private var _isChecked = false
    /// A Boolean value that determines the off/on state of the Checkbox
    public var isChecked: Bool {
        get {
            _isChecked
        }
        set {
            guard _isChecked != newValue else { return }
            _isChecked = newValue
            updateViewStyleAnimated(checked: newValue)
        }
    }

    // Called when the Checkbox changes its value.
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

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        updateViewStyleAnimated(checked: isChecked)
    }

    override public var intrinsicContentSize: CGSize {
        let diameter = UIFontMetrics.default.scaledValue(for: Constants.viewWidth)
        return CGSize(width: diameter, height: diameter)
    }

    override public var allControlEvents: UIControl.Event {
        [.valueChanged]
    }

    override public var accessibilityValue: String? {
        get {
            guard super.accessibilityValue == nil else { return super.accessibilityLabel }

            // To replicate UISwitch voiceover behaviour, we are using a undocumented accessibility trait used by UISwitch.
            // This undocumented accessibilty trait uses 1 or 0 to read "activated" or "deactivated"
            return isChecked ? "1" : "0"
        }
        set {
            super.accessibilityValue = newValue
        }
    }

    public func setChecked(_ checked: Bool, animated: Bool) {
        guard _isChecked != checked else { return }

        _isChecked = checked
        if animated {
            updateViewStyleAnimated(checked: checked)
        } else {
            updateViewStyle(checked: checked)
        }
    }
}

private extension Checkbox {
    func commonInit() {
        layoutView()

        updateViewStyle(checked: isChecked)
        borderView.layer.cornerRadius = Constants.cornerRadius
        borderView.layer.masksToBounds = true
        
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
        setContentHuggingPriority(.defaultHigh, for: .vertical)
        setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGesture)

        isAccessibilityElement = true
        setupAccessibilityTraits()
    }

    func layoutView() {
        imageView.contentMode = .center
        imageView.backgroundColor = .clear
        backgroundColor = .background
        addSubview(withDefaultConstraints: borderView)
        addSubview(withDefaultConstraints: imageView)
    }

    @objc func didTap() {
        isChecked.toggle()

        sendActions(for: .valueChanged)
        onValueChanged?(isChecked)

        setNeedsDisplay()

        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }

    @available(iOS, introduced: 11.0, deprecated: 13.0, message: "We're using an undocumented traits of UISwitch. Please verify that this works before increment the deprecated version number")
    func setupAccessibilityTraits() {
        accessibilityTraits = UISwitch().accessibilityTraits
    }

    func updateViewStyleAnimated(checked: Bool) {
        let duration = Constants.animationDuration

        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = borderView.layer.borderWidth
        borderWidthAnimation.duration = duration

        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        borderColorAnimation.fromValue = borderView.layer.borderColor
        borderColorAnimation.duration = duration

        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = imageView.layer.transform
        transformAnimation.duration = duration

        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = imageView.layer.opacity
        opacityAnimation.duration = duration

        updateViewStyle(checked: checked)

        let timingFunction = Constants.timingFunction

        borderWidthAnimation.toValue = borderView.layer.borderWidth
        borderColorAnimation.toValue = borderView.layer.borderColor
        transformAnimation.toValue = imageView.layer.transform
        opacityAnimation.toValue = imageView.layer.opacity
        
        let borderAnimation = CAAnimationGroup()
        borderAnimation.animations = [borderWidthAnimation, borderColorAnimation]
        borderAnimation.duration = duration
        borderAnimation.timingFunction = timingFunction

        let imageAnimation = CAAnimationGroup()
        imageAnimation.animations = [opacityAnimation, transformAnimation]
        imageAnimation.duration = duration
        imageAnimation.timingFunction = timingFunction
        
        borderView.layer.add(borderAnimation, forKey: "group")
        imageView.layer.add(imageAnimation, forKey: "group")
    }

    func updateViewStyle(checked: Bool) {
        if checked {
            imageView.layer.opacity = 1
            imageView.layer.transform = CATransform3DIdentity
            borderView.layer.borderColor = UIColor.controlActivated.cgColor
            borderView.layer.borderWidth = intrinsicContentSize.width / 2.0
        } else {
            imageView.layer.opacity = 0
            imageView.layer.transform = CATransform3DScale(imageView.layer.transform, 0.01, 0.01, 0.01)
            borderView.layer.borderColor = UIColor.border.cgColor
            borderView.layer.borderWidth = 1
        }
    }
}
