//
//  UIColor+Utils.swift
//  Mistica
//
//  Created by Víctor Pimentel on 09/01/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

extension UIColor {
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 255) {
		self.init(red: r / 255,
		          green: g / 255,
		          blue: b / 255,
		          alpha: a / 255)
	}
}
