//
//  FormatToken.swift
//  Mistica
//
//  Created by Guille Gonzalez on 25/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

enum FormatToken: Equatable {
	case text(String)
	case leftDelimiter(UnicodeScalar)
	case rightDelimiter(UnicodeScalar)
}

extension FormatToken: CustomStringConvertible {
	var description: String {
		switch self {
		case let .text(value):
			return value
		case let .leftDelimiter(value):
			return String(value)
		case let .rightDelimiter(value):
			return String(value)
		}
	}
}
