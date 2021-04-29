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
    }

    // A Boolean value that determines the off/on state of the RadioButton
    public var isActivated = false {
        didSet {
            activatedValueChanged(activated: isActivated)
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2.0
    }

    override public var accessibilityTraits: UIAccessibilityTraits {
        get {
            if super.accessibilityTraits != customAccessiblityTraits {
                return super.accessibilityTraits
            } else {
                return customAccessiblityTraits
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

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        activatedValueChanged(activated: isActivated)
    }
}

private extension RadioButton {
    var customAccessiblityTraits: UIAccessibilityTraits {
        if isActivated {
            return [.button, .selected]
        } else {
            return [.button]
        }
    }

    func commonInit() {
        activatedValueChanged(activated: isActivated)
        layer.cornerRadius = Constants.viewWidth / 2.0

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

    func activatedValueChanged(activated: Bool) {
        let animation = CAAnimationGroup()
        
        let width = intrinsicContentSize.width
        let duration = 0.2
        
        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = layer.borderWidth
        borderWidthAnimation.duration = duration
        
        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        borderColorAnimation.fromValue = layer.borderColor
        borderColorAnimation.duration = duration
        
        if activated {
            layer.backgroundColor = UIColor.white.cgColor
            layer.borderColor = UIColor.controlActivated.cgColor
            layer.borderWidth = width / 4.0
        } else {
            layer.backgroundColor = UIColor.background.cgColor
            layer.borderColor = UIColor.border.cgColor
            layer.borderWidth = 1
        }
        
        borderWidthAnimation.toValue = layer.borderWidth
        borderColorAnimation.toValue = layer.borderColor
        
        animation.animations = [borderWidthAnimation, borderColorAnimation]
        animation.duration = duration

        layer.add(animation, forKey: "group")
    }
}
