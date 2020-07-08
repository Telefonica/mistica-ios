//
//  FormatTokenizer.swift
//  Messenger
//
//  Created by Guille Gonzalez on 25/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

private extension CharacterSet {
	static let delimiters = CharacterSet(charactersIn: "*_~+`")
	static let whitespaceAndPunctuation = CharacterSet.whitespacesAndNewlines
		.union(CharacterSet.punctuationCharacters)
		.union(CharacterSet(charactersIn: "~+`"))
		// Slash `/` should not be considered punctuation in order to fix SUBO-1960
		.subtracting(CharacterSet(charactersIn: "/"))
}

private extension UnicodeScalar {
	static let space: UnicodeScalar = " "
}

/// Splits an input string into `FormatToken` elements.
///
/// How to use it:
///
/// 	var tokenizer = FormatTokenizer(string: "_Hello *world*_")
/// 		while let token = tokenizer.nextToken() {
/// 			switch token {
/// 			case let .text(value):
/// 				print("text: \(value)"
/// 			case let .leftDelimiter(value):
/// 				print("left delimiter: \(value)"
/// 			case let .rightDelimiter(value):
/// 				print("right delimiter: \(value)"
/// 		}
/// 	}
struct FormatTokenizer {
	private var current: UnicodeScalar? {
		guard currentIndex < input.endIndex else {
			return nil
		}

		return input[currentIndex]
	}

	private var previous: UnicodeScalar? {
		guard currentIndex > input.startIndex else {
			return nil
		}

		let index = input.index(before: currentIndex)
		return input[index]
	}

	private var next: UnicodeScalar? {
		guard currentIndex < input.endIndex else {
			return nil
		}

		let index = input.index(after: currentIndex)

		guard index < input.endIndex else {
			return nil
		}

		return input[index]
	}

	private let input: String.UnicodeScalarView
	private var currentIndex: String.UnicodeScalarView.Index
	private var leftDelimiters: [UnicodeScalar] = []

	init(string: String) {
		input = string.unicodeScalars
		currentIndex = string.unicodeScalars.startIndex
	}

	mutating func nextToken() -> FormatToken? {
		guard let current = current else { return nil }

		var token: FormatToken?

		if CharacterSet.delimiters.contains(current) {
			token = scan(delimiter: current)
		} else {
			token = scanText()
		}

		if token == nil {
			token = .text(String(current))
			advance()
		}

		return token
	}

	private mutating func scan(delimiter: UnicodeScalar) -> FormatToken? {
		scanRight(delimiter: delimiter) ?? scanLeft(delimiter: delimiter)
	}

	private mutating func scanLeft(delimiter: UnicodeScalar) -> FormatToken? {
		let previous = self.previous ?? .space

		guard let next = next else { return nil }

		// Left delimiters must be predeced by whitespace or punctuation
		// and NOT followed by whitespaces or newlines
		guard CharacterSet.whitespaceAndPunctuation.contains(previous),
			!CharacterSet.whitespacesAndNewlines.contains(next),
			!leftDelimiters.contains(delimiter) else {
			return nil
		}

		leftDelimiters.append(delimiter)
		advance()

		return .leftDelimiter(delimiter)
	}

	private mutating func scanRight(delimiter: UnicodeScalar) -> FormatToken? {
		guard let previous = previous else { return nil }

		let next = self.next ?? .space

		// Right delimiters must NOT be preceded by whitespace and must be
		// followed by whitespace or punctuation
		guard !CharacterSet.whitespacesAndNewlines.contains(previous) &&
			CharacterSet.whitespaceAndPunctuation.contains(next) &&
			leftDelimiters.contains(delimiter) else {
			return nil
		}

		while !leftDelimiters.isEmpty {
			if leftDelimiters.popLast() == delimiter {
				break
			}
		}
		advance()

		return .rightDelimiter(delimiter)
	}

	private mutating func scanText() -> FormatToken? {
		let startIndex = currentIndex
		scanUntil { CharacterSet.delimiters.contains($0) }

		guard currentIndex > startIndex else {
			return nil
		}

		return .text(String(input[startIndex ..< currentIndex]))
	}

	private mutating func scanUntil(_ predicate: (UnicodeScalar) -> Bool) {
		while currentIndex < input.endIndex && !predicate(input[currentIndex]) {
			advance()
		}
	}

	private mutating func advance() {
		currentIndex = input.index(after: currentIndex)
	}
}
