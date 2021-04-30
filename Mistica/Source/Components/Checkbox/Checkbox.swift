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
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }

    @available(iOS, introduced: 11.0, deprecated: 13.0, message: "We're using an undocumented traits of UISwitch. Please verify that this works before increment the deprecated version number")
    func setupAccessibilityTraits() {
        accessibilityTraits = UISwitch().accessibilityTraits
    }

    func checkedValueChanged(checked: Bool) {
        let animation = CAAnimationGroup()
        
        let width = intrinsicContentSize.width
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
                
        if checked {
            imageView.layer.transform = CATransform3DIdentity
            borderView.layer.borderColor = UIColor.controlActivated.cgColor
            borderView.layer.borderWidth = width / 2.0
        } else {
            imageView.layer.transform = CATransform3DScale(imageView.layer.transform, 0.01, 0.01, 0.01)
            borderView.layer.borderColor = UIColor.border.cgColor
            borderView.layer.borderWidth = 1
        }
        
        let timingFunction = Constants.timingFunction
        
        borderWidthAnimation.toValue = borderView.layer.borderWidth
        borderColorAnimation.toValue = borderView.layer.borderColor
        transformAnimation.toValue = imageView.layer.transform
        transformAnimation.timingFunction = timingFunction
        
        animation.animations = [borderWidthAnimation, borderColorAnimation]
        animation.duration = duration
        animation.timingFunction = timingFunction
        
        borderView.layer.add(animation, forKey: "group")
        imageView.layer.add(transformAnimation, forKey: "transform")
        CATransaction.commit()
    }
    
    func animateImageView(from fromTranform: CGAffineTransform, to toTransform: CGAffineTransform, duration: Double) {
        imageView.transform = fromTranform
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.3,
            options: .beginFromCurrentState,
            animations: { self.imageView.transform = toTransform },
            completion: nil)
    }
}
