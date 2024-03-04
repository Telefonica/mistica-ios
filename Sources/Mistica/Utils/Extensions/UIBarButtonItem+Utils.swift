//
//  UIBarButtonItem+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit
import SDWebImage
import SDWebImageSVGCoder

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
    func setImageFromURL(url: URL, urlForDarkMode: URL? = nil) {
        print("TEST - setImageFromURL: \(url)")
        let coder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(coder)

        let imageAsset = UIImageAsset()

        sd_setImage(with: url, for: .normal) { lightResult, _, _, _ in
            print("TEST - lightResult RECEIVED")
            guard let lightResult else { return }
            imageAsset.register(lightResult, with: .init(userInterfaceStyle: .light))

            if let darkURL = urlForDarkMode {
                self.sd_setImage(with: darkURL, for: .normal) { darkResult, _, _, _ in
                    if let darkImage = darkResult {
                        imageAsset.register(darkImage, with: .init(userInterfaceStyle: .dark))
                        print("TEST - setImage WITH DARK")

                        self.setImage(imageAsset.image(with: .current), for: .normal)
                    }
                }
            } else {
                print("TEST - setImage")
                self.setImage(imageAsset.image(with: .current), for: .normal)
            }
        }
    }
}
