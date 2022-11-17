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
        guard UIView.areAnimationsEnabled else {
            downloadImage(
                url: url,
                urlForDarkMode: urlForDarkMode
            ) { [weak self] lightImageData, darkImageData in
                guard let lightImageData else { return }
                self?.updateImage(imageData: lightImageData, darkImageData: darkImageData)
            }
            return
        }

        DispatchQueue.global().async { [weak self] in
            self?.downloadImage(
                url: url,
                urlForDarkMode: urlForDarkMode,
                completion: { [weak self] lightImageData, darkImageData in
                    guard let lightImageData else { return }

                    DispatchQueue.main.async {
                        self?.updateImage(imageData: lightImageData, darkImageData: darkImageData)
                    }
                }
            )
        }
    }
}

private extension UIImageView {
    func downloadImage(url: URL, urlForDarkMode: URL?, completion: (Data?, Data?) -> Void) {
        guard let lightImageData = try? Data(contentsOf: url) else {
            completion(nil, nil)
            return
        }

        var darkImageData: Data?

        if let urlForDarkMode = urlForDarkMode {
            darkImageData = try? Data(contentsOf: urlForDarkMode)
        }

        completion(lightImageData, darkImageData)
    }

    func updateImage(imageData: Data, darkImageData: Data?, renderAsTemplate: Bool = false) {
        var lightImage = UIImage(data: imageData)
        var darkImage: UIImage?

        if let darkImageData {
            darkImage = .init(data: darkImageData)
        }

        if renderAsTemplate {
            lightImage = lightImage?.withRenderingMode(.alwaysTemplate)
            darkImage = darkImage?.withRenderingMode(.alwaysTemplate)
        }

        image = lightImage

        if let darkImage = darkImage {
            image?.imageAsset?.register(darkImage, with: .init(userInterfaceStyle: .dark))
        }
    }
}
