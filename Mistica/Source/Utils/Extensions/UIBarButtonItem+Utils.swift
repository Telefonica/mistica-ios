//
//  UIBarButtonItem+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(icon _: UIImage,
                     accessibilityLabel: String,
                     target: AnyObject,
                     action: Selector) {
        self.init()
        image = image
        self.target = target
        self.action = action
        style = .plain
        self.accessibilityLabel = accessibilityLabel
    }

    convenience init(title: String,
                     target: AnyObject,
                     action: Selector) {
        let button = UIButton(title: title,
                              target: target,
                              action: action)
        self.init(customView: button)
    }
}

extension UIButton {
    convenience init(title: String, target: AnyObject, action: Selector) {
        self.init()
        addTarget(target, action: action, for: .touchUpInside)
        setTitle(title, for: .normal)
        setTitleColor(.navigationBarPrimary, for: .normal)
        setTitleColor(.navigationBarSecondary, for: .highlighted)
        setTitleColor(.navigationBarSecondary, for: .selected)
        setTitleColor(.navigationBarSecondary, for: .disabled)
        titleLabel?.font = .textPreset6(weight: .regular)
        sizeToFit()
        frameHeight = 36.0
    }
}
