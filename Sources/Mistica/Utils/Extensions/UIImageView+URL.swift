//
//  UIImageView+URL.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit
import SDWebImage
import SDWebImageSVGNativeCoder

extension UIImageView {
    /// Loads the urls asynchronously
    func load(url: URL, urlForDarkMode: URL? = nil, renderAsTemplate: Bool = false) {
        let coder = SDImageSVGNativeCoder.shared
        SDImageCodersManager.shared.removeCoder(coder)
        SDImageCodersManager.shared.addCoder(coder)

        sd_setImage(with: url) { [weak self] lightImage, _, _, _  in
            self?.sd_setImage(with: urlForDarkMode) { darkImage, _, _, _  in
                if let lightImage, let darkImage {
                    lightImage.imageAsset?.register(darkImage, with: UITraitCollection(userInterfaceStyle: .dark))
                    self?.image = lightImage
                }
            }
        }
    }
}
