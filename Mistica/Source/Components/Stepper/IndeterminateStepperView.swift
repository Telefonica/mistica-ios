//
//  IndeterminateStepperView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

open class IndeterminateStepperView: UIControl {
    private lazy var segmentView = SegmentView()

    private var _value = 0
    /// Use this property to get and set the stepper's current value. To render an animated transition from the current value to the new value, use the setValue(_:animated:) method instead.
    /// If you try to set a value that is below 0  or 100, a sanitized value is set. The default value of this property is 0.
    public var value: Int {
        set {
            setValue(newValue, animated: false)
        }
        get {
            _value
        }
    }

    // Called when the Stepper changes its value.
    public var onValueChanged: ((Int) -> Void)?

    public convenience init() {
        self.init(frame: .zero)
        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        addSubview(withDefaultConstraintsIfNeeded: segmentView)
        isAccessibilityElement = true
        updateAccesibilityValues()
        backgroundColor = .clear
        segmentView.minimumValue = 0
        segmentView.maximumValue = 100
    }

    override public var allControlEvents: UIControl.Event {
        [.valueChanged]
    }
}

public extension IndeterminateStepperView {
    func setValue(_ value: Int, animated: Bool) {
        let sanitizedValue = min(max(value, segmentView.minimumValue), segmentView.maximumValue)
        _value = sanitizedValue
        segmentView.setValue(sanitizedValue, animated: animated)
        updateAccesibilityValues()
        onValueChanged?(value)
        sendActions(for: .valueChanged)
    }
}

private extension IndeterminateStepperView {
    func updateAccesibilityValues() {
        let formatter = NumberFormatter()
        accessibilityLabel = formatter.string(from: NSNumber(integerLiteral: value + 1))
    }
}
