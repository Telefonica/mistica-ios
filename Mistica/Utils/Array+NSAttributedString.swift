//
//  Array+NSAttributedString.swift
//  Messenger
//
//  Created by Guille Gonzalez on 19/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public extension Array where Element: NSAttributedString {
	func joined() -> NSAttributedString {
		let result = NSMutableAttributedString()
		for element in self {
			result.append(element)
		}
		return result
	}

	func joined(separator: NSAttributedString) -> NSAttributedString {
		let result = NSMutableAttributedString()
		for (index, element) in enumerated() {
			result.append(element)
			if index < count - 1 {
				result.append(separator)
			}
		}
		return result
	}
}
