//
//  RadioButton.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 06/10/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import CoreGraphics
import UIKit

public class CheckBox: UIView {
    private enum Constants {
        static let viewWidth = CGFloat(24)
    }

    private let imageView = UIImageView()

    // A Boolean value that determines the off/on state of the CheckBox
    public var isChecked = false {
        didSet {
            changeIcon(checked: isChecked)
        }
    }

    // Called when the CheckBox changes its value.
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
}

private extension CheckBox {
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

        onValueChanged?(isChecked)

        setNeedsDisplay()
    }
}
