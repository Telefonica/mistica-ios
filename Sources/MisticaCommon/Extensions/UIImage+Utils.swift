//
//  UIImage+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension UIImage {
    convenience init(color: UIColor, width: CGFloat = 1, height: CGFloat = 1) {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)

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
    
    /// Creates an UIImage with a centered circle
    class func circle(diameter: CGFloat, color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

        let context = UIGraphicsGetCurrentContext()

        context?.saveGState()

        context?.setFillColor(color.cgColor)
        context?.fillEllipse(in: rect)

        context?.restoreGState()

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
    }
}
