//
//  MarkupRenderer.swift
//  Mistica
//
//  Created by Guille Gonzalez on 19/05/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString.Key {
	/// Custom NSAttributedStringKey created to specify which font should be used to render
	/// bold texts.
	///
	/// Most of the cases this property is not necessary, because by default, we are using the
	/// system font trait collection for bold texts. But if we are using a font with `light`
	/// weight, bold can't be applied, so in this case, we must specify the font for bold
	/// texts too.
	public static let boldFont = NSAttributedString.Key(rawValue: "CustomNSAttributedStringKey.boldFont")
}

public enum MarkupAttributedKeys {
	public static let action = NSAttributedString.Key("markupAction")
}

private enum Constants {
	static let monospacePointSizeDelta: CGFloat = -2
	static let monospaceBackgroundColor = UIColor.gray.withAlphaComponent(0.1)
	static let defaultListPrefix = "• "
}

public struct MarkupRendererOptions: OptionSet {
	public let rawValue: Int

	public init(rawValue: Int) {
		self.rawValue = rawValue
	}

	/// Proceses md text links with format []()
	public static let textLinks = MarkupRendererOptions(rawValue: 1 << 0)
	/// Autodetects links in the string
	public static let autodetectLinks = MarkupRendererOptions(rawValue: 1 << 1)
	/// Proceses md image links with format ![]()
	public static let imageLinks = MarkupRendererOptions(rawValue: 1 << 2)
	/// Render images as images instead as URLs
	public static let renderImages = MarkupRendererOptions(rawValue: 1 << 3)
}

public class MarkupRenderer: NSObject {
	// MARK: Dependencies

	private let markupActionFactory: MarkupActionFactory

	init(markupActionFactory: MarkupActionFactory) {
		self.markupActionFactory = markupActionFactory
	}
}

public extension MarkupRenderer {
	func render(text: String,
	            attributes: [NSAttributedString.Key: Any],
	            linkAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.textLink],
	            options: MarkupRendererOptions = [.textLinks]) -> NSAttributedString {
		var parseOptions: Markup.ParseOptions = []

		if options.contains(.textLinks) {
			parseOptions.insert(.parseTextLinks)
		}

		if options.contains(.autodetectLinks) {
			parseOptions.insert(.autodetectLinks)
		}

		let shouldRenderImages = options.contains(.renderImages)
		if options.contains(.imageLinks) || shouldRenderImages {
			parseOptions.insert(.parseImageLinks)
		}

		let linkAttributes = attributes.merging(linkAttributes) { _, right in right }

		let markup = Markup.parse(text: text, options: parseOptions)
        
		return markup.map { render($0, withAttributes: attributes, linkAttributes: linkAttributes, renderImages: shouldRenderImages) }.joined()
	}
}

private extension MarkupRenderer {
	func render(_ markup: Markup,
	            withAttributes attributes: [NSAttributedString.Key: Any],
	            linkAttributes: [NSAttributedString.Key: Any],
	            renderImages: Bool = false) -> NSAttributedString {
		guard let currentFont = attributes[.font] as? UIFont else {
			fatalError("Missing font attribute in \(attributes)")
		}

		switch markup {
		case let .plain(text):
			return NSAttributedString(string: text, attributes: attributes)

		case let .link(text, destination):
			return NSAttributedString(string: text,
			                          action: markupActionFactory.action(withURL: destination),
			                          attributes: linkAttributes)

		case let .email(text, destination):
			return NSAttributedString(string: text,
			                          action: markupActionFactory.action(withURL: destination),
			                          attributes: linkAttributes)

		case let .phoneNumber(text):
			return NSAttributedString(string: text,
			                          action: markupActionFactory.action(withPhoneNumber: text),
			                          attributes: linkAttributes)

		case let .strong(children):
			var newAttributes = attributes

			if let boldFont = attributes[.boldFont] {
				newAttributes[.font] = boldFont
			} else {
				newAttributes[.font] = currentFont.addingSymbolicTraits(.traitBold)
			}

			return children.map { render($0, withAttributes: newAttributes, linkAttributes: linkAttributes) }.joined()

		case let .emphasis(children):
			var newAttributes = attributes
			newAttributes[.font] = currentFont.addingSymbolicTraits(.traitItalic)

			return children.map { render($0, withAttributes: newAttributes, linkAttributes: linkAttributes) }.joined()

		case let .delete(children):
			var newAttributes = attributes
			newAttributes[.strikethroughStyle] = NSUnderlineStyle.single.rawValue
			newAttributes[.baselineOffset] = 0

			return children.map { render($0, withAttributes: newAttributes, linkAttributes: linkAttributes) }.joined()

		case let .underline(children):
			var newAttributes = attributes
			newAttributes[.underlineStyle] = NSUnderlineStyle.single.rawValue

			return children.map { render($0, withAttributes: newAttributes, linkAttributes: linkAttributes) }.joined()

		case let .code(text):
			var newAttributes = attributes
			newAttributes[.font] = currentFont.monospacedFont
			newAttributes[.backgroundColor] = Constants.monospaceBackgroundColor

			return NSAttributedString(string: text, attributes: newAttributes)
		case .listItem(let children):
			var listChildrens: [Markup] = [.plain(text: Constants.defaultListPrefix)]
			listChildrens.append(contentsOf: children)
			return listChildrens.map { render($0, withAttributes: attributes, linkAttributes: linkAttributes) }.joined()
		case .image(let text, let destination):
			if renderImages {
				let htmlBody = "<img src=\"\(destination)\" alt=\"\(text)\"/>"
				let data = Data(htmlBody.utf8)
				if let attributedString = try? NSAttributedString(data: data,
				                                                  options: [.documentType: NSAttributedString.DocumentType.html],
				                                                  documentAttributes: nil) {
					return attributedString
				}
			}

			return NSAttributedString(string: text,
			                          action: markupActionFactory.action(withURL: destination),
			                          attributes: linkAttributes)
		}
	}
}

private extension NSAttributedString {
	convenience init(string: String,
	                 action: MarkupAction,
	                 attributes: [NSAttributedString.Key: Any]) {
		var newAttributes = attributes

		newAttributes[MarkupAttributedKeys.action] = action

		self.init(string: string, attributes: newAttributes)
	}
}

private extension UIFont {
	var monospacedFont: UIFont? {
		// Neither monospacedDigitSystemFont nor .traitMonoSpace return a monospaced font in iOS 10
		UIFont(name: "Menlo", size: pointSize + Constants.monospacePointSizeDelta)?.addingSymbolicTraits(fontDescriptor.symbolicTraits)
	}

	func addingSymbolicTraits(_ traits: UIFontDescriptor.SymbolicTraits) -> UIFont? {
		let newTraits = fontDescriptor.symbolicTraits.union(traits)
		guard let descriptor = fontDescriptor.withSymbolicTraits(newTraits) else {
			return nil
		}

		return UIFont(descriptor: descriptor, size: 0)
	}
}
