//
//  UIImage+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

extension UIImage {
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
}
