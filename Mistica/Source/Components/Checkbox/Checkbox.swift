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
        static let viewWidth = CGFloat(24)
    }

    private let imageView = UIImageView()

    // A Boolean value that determines the off/on state of the Checkbox
    public var isChecked = false {
        didSet {
            changeIcon(checked: isChecked)
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

    override public var intrinsicContentSize: CGSize {
        let diameter: CGFloat = UIFontMetrics.default.scaledValue(for: Constants.viewWidth)

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

        changeIcon(checked: isChecked)

        backgroundColor = .clear

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
        addSubview(withDefaultConstraints: imageView)
    }

    func changeIcon(checked: Bool) {
        if checked {
            imageView.image = UIImage(named: "icn_checkbox_on", type: .brandedAndThemed)
        } else {
            imageView.image = UIImage(named: "icn_checkbox_off", type: .common)
        }
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
}
