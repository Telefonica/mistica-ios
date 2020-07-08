//
//  Optional+Utils.swift
//  Mistica
//
//  Created by Víctor Pimentel on 05/01/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public extension Optional where Wrapped: Collection {
	var isEmpty: Bool {
		switch self {
		case .none:
			return true
		case .some(let value):
			return value.isEmpty
		}
	}
}
