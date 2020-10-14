//
//  RadioButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import CoreGraphics
import UIKit

public class RadioButton: UIView {
    private enum Constants {
        static let viewWidth = CGFloat(24)
    }

    // A Boolean value that determines the off/on state of the RadioButton
    public var isActivated = false {
        didSet {
            setNeedsDisplay()
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

    override public var intrinsicContentSize: CGSize {
        let diameter: CGFloat = UIFontMetrics.default.scaledValue(for: Constants.viewWidth)

        return CGSize(width: diameter, height: diameter)
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)

        let outerCircleFillColor: UIColor
        let innerCircleRect: CGRect

        if isActivated {
            outerCircleFillColor = .controlActivated
            let innerCircleDiameter = (rect.width / 2)
            let x = (rect.width - innerCircleDiameter) / 2
            let y = (rect.height - innerCircleDiameter) / 2
            innerCircleRect = CGRect(x: x, y: y, width: innerCircleDiameter, height: innerCircleDiameter)
        } else {
            outerCircleFillColor = .control
            innerCircleRect = rect.insetBy(dx: 1, dy: 1)
        }

        // Draw outer circle
        let outerCiclePath = UIBezierPath(ovalIn: rect)
        outerCircleFillColor.setFill()
        outerCiclePath.fill()

        // Draw innter circle
        let innerCirclePath = UIBezierPath(ovalIn: innerCircleRect)
        UIColor.background.setFill()
        innerCirclePath.fill()
    }
}

private extension RadioButton {
    func commonInit() {
        backgroundColor = .clear

        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGesture)
    }

    @objc func didTap() {
        isActivated.toggle()

        onValueChanged?(isActivated)

        setNeedsDisplay()
    }
}
