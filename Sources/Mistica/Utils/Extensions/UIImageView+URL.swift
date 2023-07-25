//
//  UIImageView+URL.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SDWebImageSVGNativeCoder
import UIKit

extension UIImageView {
    /// Loads the urls asynchronously
    func load(url: URL, urlForDarkMode: URL? = nil, renderAsTemplate: Bool = false) {
        guard UIView.areAnimationsEnabled else {
            downloadImage(
                url: url,
                urlForDarkMode: urlForDarkMode
            ) { [weak self] lightImage, darkImage in
                guard let lightImage else { return }
                self?.updateImage(image: lightImage, darkImage: darkImage)
            }
            return
        }

        DispatchQueue.global().async { [weak self] in
            self?.downloadImage(
                url: url,
                urlForDarkMode: urlForDarkMode,
                completion: { [weak self] lightImage, darkImage in
                    guard let lightImage else { return }

                    DispatchQueue.main.async {
                        self?.updateImage(image: lightImage, darkImage: darkImage)
                    }
                }
            )
        }
    }
}

private extension UIImageView {
    func downloadImage(url: URL, urlForDarkMode: URL?, completion: @escaping (UIImage?, UIImage?) -> Void) {
        var light: UIImage?, dark: UIImage?
        if let data = try? Data(contentsOf: url) {
            light = decode(data: data)
        }

        if let url = urlForDarkMode, let data = try? Data(contentsOf: url) {
            dark = decode(data: data)
        }

        completion(light, dark)
    }

    func decode(data: Data) -> UIImage? {
        if let image = UIImage(data: data) {
            return image
        } else if let image = SDImageSVGNativeCoder.shared.decodedImage(with: data) {
            return image
        } else {
            return nil
        }
    }

    func updateImage(image: UIImage, darkImage: UIImage?, renderAsTemplate: Bool = false) {
        let renderMode = renderAsTemplate ? UIImage.RenderingMode.alwaysTemplate : .automatic
        let lightImage = image.withRenderingMode(renderMode)
        let darkImage = darkImage?.withRenderingMode(renderMode)

        if let darkImage {
            lightImage.imageAsset?.register(darkImage, with: .init(userInterfaceStyle: .dark))
        }

        self.image = lightImage
    }
}
