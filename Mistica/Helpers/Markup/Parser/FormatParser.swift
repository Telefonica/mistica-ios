//
//  FormatParser.swift
//  Messenger
//
//  Created by Guille Gonzalez on 26/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

struct FormatParser {
	static func parse(text: String) -> [Markup] {
		var parser = FormatParser(text: text)
		return parser.parse()
	}

	private var tokenizer: FormatTokenizer

	private init(text: String) {
		tokenizer = FormatTokenizer(string: text)
	}

	private mutating func parse() -> [Markup] {
		let elements = parse(delimiter: nil)
		return mergeText(in: elements)
	}

	private mutating func parse(delimiter: UnicodeScalar?) -> [Markup] {
		var elements = [Markup]()
		var isClosed = false

		while let token = tokenizer.nextToken() {
			if let delimiter = delimiter {
				if token == .rightDelimiter(delimiter) {
					isClosed = true
					break
				}
			}

			switch token {
			case let .text(value):
				elements.append(.plain(text: value))
			case let .leftDelimiter(value):
				elements.append(contentsOf: parse(delimiter: value))
			default:
				elements.append(.plain(text: token.description))
			}
		}

		if isClosed {
			guard let delimiter = delimiter else {
				fatalError("There must be a delimiter")
			}
			guard let parent = Markup(delimiter: delimiter, children: elements) else {
				fatalError("Unsupported delimiter: \(delimiter)")
			}

			return [parent]
		}

		if let delimiter = delimiter {
			// Left delimiter without a corresponding right delimiter
			elements.insert(.plain(text: String(delimiter)), at: 0)
		}

		return elements
	}

	private func mergeText(in input: [Markup]) -> [Markup] {
		var mergedText = ""
		var output = [Markup]()

		for element in input {
			if case let .plain(text) = element {
				mergedText += text
			} else {
				if !mergedText.isEmpty {
					output.append(.plain(text: mergedText))
					mergedText = ""
				}

				switch element {
				case let .strong(children):
					output.append(.strong(children: mergeText(in: children)))
				case let .emphasis(children):
					output.append(.emphasis(children: mergeText(in: children)))
				case let .delete(children):
					output.append(.delete(children: mergeText(in: children)))
				case let .underline(children):
					output.append(.underline(children: mergeText(in: children)))
				default:
					output.append(element)
				}
			}
		}

		if !mergedText.isEmpty {
			output.append(.plain(text: mergedText))
		}

		return output
	}
}
