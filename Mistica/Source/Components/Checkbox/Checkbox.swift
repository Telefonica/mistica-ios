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
    }

    private let imageView = UIImageView(image: .checkmarkIcon)
    private let borderView = UIView()
    
    // A Boolean value that determines the off/on state of the Checkbox
    public var isChecked = false {
        didSet {
            checkedValueChanged(checked: isChecked)
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
        checkedValueChanged(checked: isChecked)
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
}

private extension Checkbox {
    func commonInit() {
        layoutView()

        checkedValueChanged(checked: isChecked)
        borderView.makeRounded(cornerRadius: Constants.cornerRadius)
        
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
    }

    @available(iOS, introduced: 11.0, deprecated: 13.0, message: "We're using an undocumented traits of UISwitch. Please verify that this works before increment the deprecated version number")
    func setupAccessibilityTraits() {
        accessibilityTraits = UISwitch().accessibilityTraits
    }

    func checkedValueChanged(checked: Bool) {
        let animation = CAAnimationGroup()
        
        let width = intrinsicContentSize.width
        let duration = 0.1
        
        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = borderView.layer.borderWidth
        borderWidthAnimation.duration = duration
        
        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        borderColorAnimation.fromValue = borderView.layer.borderColor
        borderColorAnimation.duration = duration
        
        if checked {
            imageView.fade(toAlpha: 1, duration: duration)
            borderView.layer.borderColor = UIColor.controlActivated.cgColor
            borderView.layer.borderWidth = width / 2.0
        } else {
            imageView.fade(toAlpha: 0, duration: duration)
            borderView.layer.borderColor = UIColor.border.cgColor
            borderView.layer.borderWidth = 1
        }
        
        borderWidthAnimation.toValue = borderView.layer.borderWidth
        borderColorAnimation.toValue = borderView.layer.borderColor
        
        animation.animations = [borderWidthAnimation, borderColorAnimation]
        animation.duration = duration

        borderView.layer.add(animation, forKey: "group")
    }
}
