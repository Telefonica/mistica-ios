//
//  Markup+Parse.swift
//  Messenger
//
//  Created by Guille Gonzalez on 29/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

private enum Constants {
	static let linkPattern = "(?<!\\!)(\\[)[^\\[]*?\\]\\([^\\)]*\\)"
	static let imagePattern = "!\\[[^\\[]*?\\]\\([^\\)]*\\)"
	static let listItemPattern = "^\\*\\ .+\\n?"
	static let mailURLScheme = "mailto"
}

public extension Markup {
	struct ParseOptions: OptionSet {
		public let rawValue: Int

		public init(rawValue: Int) {
			self.rawValue = rawValue
		}

		public static let parseTextLinks = ParseOptions(rawValue: 1 << 0)
		public static let autodetectLinks = ParseOptions(rawValue: 1 << 1)
		public static let parseImageLinks = ParseOptions(rawValue: 1 << 2)
	}

	static func parse(text: String, options: ParseOptions = []) -> [Markup] {
		var elements = parseListItems(in: text)

		if options.contains(.parseImageLinks) {
			elements = elements.parsingPlainText(with: parseImageLinks)
		}

		if options.contains(.parseTextLinks) {
			elements = elements.parsingPlainText(with: parseTextLinks)
		}

		if options.contains(.autodetectLinks) {
			elements = elements.parsingPlainText(with: autodetectLinks)
		}

		return elements
	}
}

private extension Array where Element == Markup {
	func parsingPlainText(with parse: (String) -> [Element]) -> [Element] {
		var elements = [Element]()

		for element in self {
			switch element {
			case let .plain(text):
				elements.append(contentsOf: parse(text))
			case let .strong(children):
				elements.append(.strong(children: children.parsingPlainText(with: parse)))
			case let .emphasis(children):
				elements.append(.emphasis(children: children.parsingPlainText(with: parse)))
			case let .delete(children):
				elements.append(.delete(children: children.parsingPlainText(with: parse)))
			case let .underline(children):
				elements.append(.underline(children: children.parsingPlainText(with: parse)))
			case let .listItem(children):
				elements.append(.listItem(children: children.parsingPlainText(with: parse)))
			default:
				elements.append(element)
			}
		}

		return elements
	}
}

private func parseTextLinks(in input: String) -> [Markup] {
	guard let regex = try? NSRegularExpression(pattern: Constants.linkPattern, options: .dotMatchesLineSeparators) else {
		return [.plain(text: input)]
	}

	return processMatches(in: input,
	                      regex: regex,
	                      rangeCalculator: { link, centerRange in
	                      	link.index(after: link.startIndex) ..< centerRange.lowerBound
	                      },
	                      markupGenerator: { text, destination in
	                      	.link(text: text, destination: destination)
	})
}

private func parseImageLinks(in input: String) -> [Markup] {
	guard let regex = try? NSRegularExpression(pattern: Constants.imagePattern, options: .dotMatchesLineSeparators) else {
		return [.plain(text: input)]
	}

	return processMatches(in: input,
	                      regex: regex,
	                      rangeCalculator: { link, centerRange in
	                      	link.index(link.startIndex, offsetBy: 2) ..< centerRange.lowerBound
	                      },
	                      markupGenerator: { text, destination in
	                      	.image(text: text, destination: destination)
	})
}

private func autodetectLinks(in input: String) -> [Markup] {
	let types: NSTextCheckingResult.CheckingType = [.link, .phoneNumber]

	guard let detector = try? NSDataDetector(types: types.rawValue) else {
		return [.plain(text: input)]
	}

	let matches = detector.matches(in: input,
	                               options: [],
	                               range: NSRange(location: 0, length: input.utf16.count))

	var elements = [Markup]()
	var lastIndex = input.startIndex

	for match in matches {
		guard let range = match.range(for: input) else {
			fatalError("Conversion from NSRange failed. Wrong input?")
		}

		if range.lowerBound > lastIndex {
			let text = String(input[lastIndex ..< range.lowerBound])
			elements.append(.plain(text: text))
		}

		lastIndex = range.upperBound

		let text = String(input[range])

		if match.resultType.contains(.phoneNumber) {
			elements.append(.phoneNumber(text: text))
		} else if match.resultType.contains(.link) {
			guard let url = match.url, let scheme = url.scheme else {
				elements.append(.plain(text: text))
				continue
			}

			if scheme == Constants.mailURLScheme {
				elements.append(.email(text: text, destination: url))
			} else {
				elements.append(.link(text: text, destination: url))
			}
		} else {
			elements.append(.plain(text: text))
		}
	}

	if lastIndex < input.endIndex {
		let text = String(input[lastIndex ..< input.endIndex])
		elements.append(.plain(text: text))
	}

	return elements
}

func processMatches(in input: String,
                    regex: NSRegularExpression,
                    rangeCalculator: (String, Range<String.Index>) -> Range<String.Index>,
                    markupGenerator: (String, URL) -> Markup) -> [Markup] {
	var elements = [Markup]()
	var lastIndex = input.startIndex
	let matches = regex.matches(in: input,
	                            options: [],
	                            range: NSRange(location: 0, length: input.utf16.count))

	for match in matches {
		guard let range = match.range(for: input) else {
			fatalError("Conversion from NSRange failed. Wrong input?")
		}

		if range.lowerBound > lastIndex {
			let text = String(input[lastIndex ..< range.lowerBound])
			elements.append(.plain(text: text))
		}

		lastIndex = range.upperBound

		let link = String(input[range])
		guard let centerRange = link.range(of: "](") else {
			elements.append(.plain(text: link))
			continue
		}

		let textRange = rangeCalculator(link, centerRange)
		let urlRange = centerRange.upperBound ..< link.index(before: link.endIndex)

		guard let url = URL(string: String(link[urlRange])) else {
			elements.append(.plain(text: link))
			continue
		}

		let text = String(link[textRange])
		elements.append(markupGenerator(text, url))
	}

	if lastIndex < input.endIndex {
		let text = String(input[lastIndex ..< input.endIndex])
		elements.append(.plain(text: text))
	}

	return elements
}

private func parseListItems(in input: String) -> [Markup] {
	guard let regex = try? NSRegularExpression(pattern: Constants.listItemPattern, options: []) else {
		return FormatParser.parse(text: input)
	}

	var elements = [Markup]()
	var lastIndex = input.startIndex
	let matches = regex.matches(in: input,
	                            options: [],
	                            range: NSRange(location: 0, length: input.utf16.count))

	for match in matches {
		guard let range = match.range(for: input) else {
			fatalError("Conversion from NSRange failed. Wrong input?")
		}

		if range.lowerBound > lastIndex {
			let text = String(input[lastIndex ..< range.lowerBound])
			elements += FormatParser.parse(text: text)
		}
		lastIndex = range.upperBound

		let listItemString = String(input[range])
		let listItemRange = listItemString.index(listItemString.startIndex, offsetBy: 2) ..< listItemString.endIndex
		let listItem = String(listItemString[listItemRange])

		elements.append(.listItem(children: FormatParser.parse(text: listItem)))
	}

	if lastIndex < input.endIndex {
		let text = String(input[lastIndex ..< input.endIndex])
		elements += FormatParser.parse(text: text)
	}

	return elements
}
