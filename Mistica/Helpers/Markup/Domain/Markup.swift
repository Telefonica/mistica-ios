//
//  Markup.swift
//  Messenger
//
//  Created by Guille Gonzalez on 17/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public enum Markup {
	case plain(text: String)
	case link(text: String, destination: URL)
	case email(text: String, destination: URL)
	case phoneNumber(text: String)
	case strong(children: [Markup])
	case emphasis(children: [Markup])
	case delete(children: [Markup])
	case underline(children: [Markup])
	case code(text: String)
	case listItem(children: [Markup])
	case image(text: String, destination: URL)
}

extension Markup: CustomStringConvertible {
	public var description: String {
		switch self {
		case let .plain(text):
			return text
		case let .link(text, destination) where text == destination.absoluteString:
			return text
		case let .link(text, destination):
			return "[\(text)](\(destination))"
		case let .email(text, _):
			return text
		case let .phoneNumber(text):
			return text
		case let .strong(children):
			return "*\(children.map { $0.description }.joined())*"
		case let .emphasis(children):
			return "_\(children.map { $0.description }.joined())_"
		case let .delete(children):
			return "~\(children.map { $0.description }.joined())~"
		case let .underline(children):
			return "+\(children.map { $0.description }.joined())+"
		case let .code(text):
			return "`\(text)`"
		case let .listItem(children):
			return "*\(children.map { $0.description }.joined())"
		case let .image(text, destination):
			return "![\(text)](\(destination))"
		}
	}
}

public extension Markup {
	init?(delimiter: UnicodeScalar, children: [Markup]) {
		switch delimiter {
		case "*":
			self = .strong(children: children)
		case "_":
			self = .emphasis(children: children)
		case "~":
			self = .delete(children: children)
		case "+":
			self = .underline(children: children)
		case "`":
			self = .code(text: children.map { $0.description }.joined())
		default:
			return nil
		}
	}

	var cleanText: String {
		switch self {
		case let .plain(text):
			return text
		case let .link(text, _):
			return text
		case let .email(text, _):
			return text
		case let .phoneNumber(text):
			return text
		case let .strong(children):
			return children.map { $0.cleanText }.joined()
		case let .emphasis(children):
			return children.map { $0.cleanText }.joined()
		case let .delete(children):
			return children.map { $0.cleanText }.joined()
		case let .underline(children):
			return children.map { $0.cleanText }.joined()
		case let .code(text):
			return text
		case let .listItem(children):
			return children.map { $0.cleanText }.joined()
		case let .image(text, _):
			return text
		}
	}
}
