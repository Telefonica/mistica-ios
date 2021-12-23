//
//  UIImage+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(color: UIColor) {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        if let image = image,
           let cgImage = image.cgImage {
            self.init(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
        } else {
            self.init()
        }
    }

    var rounded: UIImage {
        let bounds = CGRect(origin: .zero, size: size)
        let cornerRadius = CGFloat(bounds.size.height / 2)

        let circularPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        UIGraphicsBeginImageContext(bounds.size)

        circularPath.addClip()

        draw(in: bounds)

        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return roundedImage!
    }

    func resized(with contentMode: UIView.ContentMode, bounds: CGSize) -> UIImage {
        resized(with: contentMode, bounds: bounds, scale: UIScreen.main.scale)
    }

    func resized(with contentMode: UIView.ContentMode, bounds: CGSize, scale: CGFloat) -> UIImage {
        let ratio = resizeRatio(with: contentMode, bounds: bounds)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        return resized(to: newSize, scale: scale)
    }
}

private extension UIImage {
    func resized(to newSize: CGSize, scale: CGFloat) -> UIImage {
        let newRect = CGRect(origin: .zero, size: newSize).integral
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, scale)
        draw(in: newRect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage ?? self
    }

    func resizeRatio(with contentMode: UIView.ContentMode, bounds: CGSize) -> CGFloat {
        assert(size.width > 0 && size.height > 0, "Image size is 0: \(self) \(NSCoder.string(for: size))")
        var horizontalRatio: CGFloat = 1
        var verticalRatio: CGFloat = 1
        if size.width > 0 {
            horizontalRatio = bounds.width / size.width
        }
        if size.height > 0 {
            verticalRatio = bounds.height / size.height
        }
        switch contentMode {
        case .scaleAspectFill:
            return max(horizontalRatio, verticalRatio)
        case .scaleAspectFit:
            return min(horizontalRatio, verticalRatio)
        default:
            fatalError("Unsupported content mode: \(contentMode)")
        }
    }
}
