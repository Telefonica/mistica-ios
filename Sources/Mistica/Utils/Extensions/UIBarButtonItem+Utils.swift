//
//  UIBarButtonItem+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SDWebImage
import SDWebImageSVGCoder
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
        titleLabel?.font = .textPreset3(weight: .regular)
        sizeToFit()
        frameHeight = 36.0
    }
}

public extension UIButton {
    /*
     Support SVG Images from URL for UIButton settings
     */
    func setImageFromURL(url: URL, urlForDarkMode: URL? = nil, defaultImage: UIImage? = nil) {
        let coder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(coder)

        sd_setImage(with: url, for: .normal) { lightImage, error, _, _ in
            guard let lightImage else {
                self.setImage(defaultImage, for: .normal)
                return
            }

            if let darkURL = urlForDarkMode {
                self.sd_setImage(with: darkURL, for: .normal) { darkResult, _, _, _ in
                    if let darkImage = darkResult {
                        lightImage.imageAsset?.register(darkImage, with: UITraitCollection(traitsFrom: [.current, .init(userInterfaceStyle: .dark)]))
                        self.setImage(lightImage, for: .normal)
                    }
                }
            } else {
                self.setImage(lightImage, for: .normal)
            }
        }
    }
}
