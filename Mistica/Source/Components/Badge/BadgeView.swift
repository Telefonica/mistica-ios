//
//  BadgeView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

private enum Constants {
    static let maximumValue = 9
}

public class BadgeView: UIView {
    /// Specifies the style of a badge
    @frozen
    public enum Style {
        /// A red oval with a white number
        case numeric
        /// A small red oval, without number.
        case flag
    }

    public var style: Style {
        didSet {
            updateStyle()
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }

    public var value: Int = 0 {
        didSet {
            guard style == .numeric else { return }

            isHidden = value == 0

            if value > Constants.maximumValue {
                label.text = "+9"
            } else {
                label.text = "\(value)"
            }

            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .textPrimaryInverse
        label.font = .preset1(weight: .medium)
        return label
    }()

    public required init?(coder: NSCoder) {
        style = .flag

        super.init(coder: coder)

        commonInit()
    }

    public init(style: Style) {
        self.style = style

        super.init(frame: .zero)

        commonInit()
    }

    convenience init() {
        self.init(style: .flag)
    }

    override convenience init(frame _: CGRect) {
        fatalError("init(frame:) has not been implemented, please use init(style:)")
    }

    override public var intrinsicContentSize: CGSize {
        switch style {
        case .flag:
            return CGSize(width: 8, height: 8)
        case .numeric:
            if value > Constants.maximumValue {
                let textIntrinsicContentSize = label.intrinsicContentSize
                return CGSize(width: textIntrinsicContentSize.width + 12, height: 20)
            } else {
                return CGSize(width: 20, height: 20)
            }
        }
    }

    override public func draw(_ rect: CGRect) {
        let bezierPath: UIBezierPath

        if value > Constants.maximumValue {
            bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height / 2)
        } else {
            bezierPath = UIBezierPath(ovalIn: rect)
        }

        UIColor.badge.setFill()
        bezierPath.fill()

        super.draw(rect)
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            setUpLabelStyle()
        }
    }
}

private extension BadgeView {
    func commonInit() {
        backgroundColor = .clear

        setUpView()
        setUpLabel()
        updateStyle()
    }

    func setUpView() {
        // The badge cannot be shrunken or expanded
        translatesAutoresizingMaskIntoConstraints = false
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }

    func setUpLabel() {
        addSubview(withDefaultConstraints: label)
        setUpLabelStyle()
    }

    func setUpLabelStyle() {
        label.textAlignment = .center
        label.textColor = .textPrimaryInverse
        label.font = .preset1(weight: .medium)
    }

    func updateStyle() {
        switch style {
        case .flag:
            label.isHidden = true
            value = 0
        case .numeric:
            label.isHidden = false
        }
    }
}
