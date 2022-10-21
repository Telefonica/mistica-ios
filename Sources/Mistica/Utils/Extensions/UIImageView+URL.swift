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
    func load(url: URL, urlForDarkMode: URL? = nil, renderAsTemplate: Bool = false) {
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else { return }
            if let urlForDarkMode = urlForDarkMode,
               let darkImageData = try? Data(contentsOf: urlForDarkMode) {
                self?.updateImage(imageData: imageData, darkImageData: darkImageData, renderAsTemplate: renderAsTemplate)
            } else {
                self?.updateImage(imageData: imageData, renderAsTemplate: renderAsTemplate)
            }
        }
    }
}

private extension UIImageView {
    func updateImage(imageData: Data, darkImageData: Data, renderAsTemplate: Bool = false) {
        DispatchQueue.main.async { [weak self] in
            var lightImage = UIImage(data: imageData)
            var darkImage = UIImage(data: darkImageData)
            1¡
            if renderAsTemplate {
                lightImage = lightImage?.withRenderingMode(.alwaysTemplate)
                darkImage = darkImage?.withRenderingMode(.alwaysTemplate)
            }

            self?.image = lightImage

            if let darkImage = darkImage {
                self?.image?.imageAsset?.register(darkImage, with: .init(userInterfaceStyle: .dark))
            }
        }
    }

    func updateImage(imageData: Data, renderAsTemplate: Bool = false) {
        DispatchQueue.main.async { [weak self] in
            var image = UIImage(data: imageData)

            if renderAsTemplate {
                image = image?.withRenderingMode(.alwaysTemplate)
            }

            self?.image = image
        }
    }
}
