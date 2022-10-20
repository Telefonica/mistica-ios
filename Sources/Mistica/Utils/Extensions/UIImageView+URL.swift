//
//  UIImageView+URL.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

extension UIImageView {
    /// Loads the urls asynchronously
    func load(url: URL, urlForDarkMode: URL? = nil, tintColor: UIColor? = nil) {
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else { return }
            if let urlForDarkMode = urlForDarkMode,
               let darkImageData = try? Data(contentsOf: urlForDarkMode) {
                self?.updateImage(imageData: imageData, darkImageData: darkImageData, tintColor: tintColor)
            } else {
                self?.updateImage(imageData: imageData, tintColor: tintColor)
            }
        }
    }
}

private extension UIImageView {
    func updateImage(imageData: Data, darkImageData: Data, tintColor: UIColor? = nil) {
        DispatchQueue.main.async { [weak self] in
            var lightImage = UIImage(data: imageData)
            var darkImage = UIImage(data: darkImageData)

            if let tintColor = tintColor {
                lightImage = lightImage?.withTintColor(tintColor)
                darkImage = darkImage?.withTintColor(tintColor)
            }

            self?.image = lightImage

            if let darkImage = darkImage {
                self?.image?.imageAsset?.register(darkImage, with: .init(userInterfaceStyle: .dark))
            }
        }
    }

    func updateImage(imageData: Data, tintColor: UIColor? = nil) {
        DispatchQueue.main.async { [weak self] in
            self?.image = UIImage(data: imageData)
            if let tintColor = tintColor {
                self?.image = self?.image?.withTintColor(tintColor, renderingMode: .alwaysTemplate)
            }
        }
    }
}
