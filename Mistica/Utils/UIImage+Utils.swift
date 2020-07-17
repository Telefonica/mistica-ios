//
//  UIImage+Utils.swift
//  Mistica
//
//  Created by Víctor Pimentel on 03/01/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
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
}
