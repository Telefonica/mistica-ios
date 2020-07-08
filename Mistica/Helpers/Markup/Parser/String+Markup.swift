//
//  String+Markup.swift
//  Mistica
//
//  Created by Guille Gonzalez on 05/06/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public extension String {
	func removingMarkup(options: Markup.ParseOptions = []) -> String {
		let elements = Markup.parse(text: self as String, options: options)
		return elements.map { $0.cleanText }.joined()
	}
}
