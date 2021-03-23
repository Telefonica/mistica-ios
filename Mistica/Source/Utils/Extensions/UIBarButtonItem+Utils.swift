//
//  UIBarButtonItem+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
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
        let button = UIButton(
            title: title,
            target: target,
            action: action
        )
        self.init(customView: button)
    }
}

extension UIButton {
    convenience init(title: String, target: AnyObject, action: Selector) {
        self.init()
        addTarget(target, action: action, for: .touchUpInside)
        setTitle(title, for: .normal)
        setTitleColor(.textNavigationBarPrimary, for: .normal)
        setTitleColor(.textNavigationBarSecondary, for: .highlighted)
        setTitleColor(.textNavigationBarSecondary, for: .selected)
        setTitleColor(.textNavigationBarSecondary, for: .disabled)
        titleLabel?.font = .preset3(weight: .regular)
        sizeToFit()
        frameHeight = 36.0
    }
}
