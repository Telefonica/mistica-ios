//
//  UI+Themed.swift
//  Mistica
//
//  Created by pbartolome on 22/07/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
	convenience init?(themedImageNamed: String) {
		let name = UIImage.imageName(themedImageNamed, for: Mistica.themeVariant)
		self.init(named: name)
	}

	private static func imageName(_ name: String, for variant: ThemeVariant) -> String {
		switch variant {
		case .standard:
			return name
		default:
			return "\(variant.rawValue)/\(name)"
		}
	}
}

public extension UIColor {
	convenience init(_ defaultColor: UIColor, variants: [ThemeVariant: UIColor]) {
		if let current = variants[Mistica.themeVariant] {
			self.init(cgColor: current.cgColor)
		} else {
			self.init(cgColor: defaultColor.cgColor)
		}
	}
}
