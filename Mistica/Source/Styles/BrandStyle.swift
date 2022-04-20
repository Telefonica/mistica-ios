//
//  BrandStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

@frozen
public enum BrandStyle: CustomStringConvertible, CaseIterable {
    case movistar
    case vivo
    case o2
    case o2Classic
    case blau
	case custom(Colors?)

	public var description: String {
		switch self {
		case .movistar:
			return "movistar"
		case .vivo:
			return "vivo"
		case .o2:
			return "o2"
		case .o2Classic:
			return "o2Classic"
		case .blau:
			return "blau"
		case .custom(_):
			return "custom"
		}
	}

	public static var allCases: [BrandStyle] = [.movistar, .vivo, .o2, .o2Classic, .blau, .custom(nil)]
}
