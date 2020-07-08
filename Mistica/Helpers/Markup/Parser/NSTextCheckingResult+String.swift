//
//  NSTextCheckingResult+String.swift
//  Messenger
//
//  Created by Guille Gonzalez on 26/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

extension NSTextCheckingResult {
	func range(for string: String) -> Range<String.Index>? {
		guard range.location != NSNotFound else { return nil }

		let utf16 = string.utf16
		guard let utf16Start = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
		guard let utf16End = utf16.index(utf16Start, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
		guard let start = String.Index(utf16Start, within: string) else { return nil }
		guard let end = String.Index(utf16End, within: string) else { return nil }

		return start ..< end
	}
}
