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
    func load(url: URL, urlForDarkMode: URL? = nil) {
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else { return }
            if let urlForDarkMode = urlForDarkMode,
               let darkImageData = try? Data(contentsOf: urlForDarkMode) {
                self?.updateImage(imageData: imageData, darkImageData: darkImageData)
            } else {
                self?.updateImage(imageData: imageData)
            }
        }
    }
}

private extension UIImageView {
    func updateImage(imageData: Data, darkImageData: Data) {
        DispatchQueue.main.async { [weak self] in
            var lightImage = UIImage(data: imageData)?.withRenderingMode(.alwaysTemplate)
            var darkImage = UIImage(data: darkImageData)?.withRenderingMode(.alwaysTemplate)

            self?.image = lightImage

            if let darkImage = darkImage {
                self?.image?.imageAsset?.register(darkImage, with: .init(userInterfaceStyle: .dark))
            }
        }
    }

    func updateImage(imageData: Data) {
        DispatchQueue.main.async { [weak self] in
            self?.image = UIImage(data: imageData)?.withRenderingMode(.alwaysTemplate)
        }
    }
}
