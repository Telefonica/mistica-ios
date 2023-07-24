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
        let SVGCoder = SDImageSVGNativeCoder.shared
        if SDImageCodersManager.shared.coders?.contains(where: { $0.hash == SVGCoder.hash }) == false {
            SDImageCodersManager.shared.addCoder(SVGCoder)
        }

        SDWebImageManager.shared.loadImage(with: url, progress: nil) { lightImage, _, _, _, _, _ in
            SDWebImageManager.shared.loadImage(with: urlForDarkMode, progress: nil) { darkImage, _, _, _, _, _ in
                completion(lightImage, darkImage)
            }
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
