//
//  MarkupTextView.swift
//  CommonUIKit
//
//  Created by Guille Gonzalez on 22/03/2018.
//  Copyright © 2018 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

/// A view that renders markup text using the provided attributes, and handles taps on links, phone numbers, etc.
public final class MarkupTextView: UIView {
	public override var intrinsicContentSize: CGSize {
		textView.intrinsicContentSize
	}

	public var textContainerInset: UIEdgeInsets {
		get { textView.textContainerInset }
		set { textView.textContainerInset = newValue }
	}

	private let textView = UITextView()

	public init(renderer: MarkupRenderer,
	            text: String,
	            attributes: [NSAttributedString.Key: Any],
	            linkAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.textLink]) {
		super.init(frame: .zero)
		setUp(with: renderer,
		      text: text,
		      attributes: attributes,
		      linkAttributes: linkAttributes)
		setUpAccessibility()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override var accessibilityIdentifier: String? {
		get { textView.accessibilityIdentifier }
		set { textView.accessibilityIdentifier = newValue }
	}
}

public extension MarkupTextView {
	func rerender(with renderer: MarkupRenderer,
	              text: String,
	              attributes: [NSAttributedString.Key: Any],
	              linkAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.textLink]) {
		let attributedText = renderer.render(text: text,
		                                     attributes: attributes,
		                                     linkAttributes: linkAttributes)
		textView.attributedText = attributedText
	}
}

private extension MarkupTextView {
	func setUp(with renderer: MarkupRenderer,
	           text: String,
	           attributes: [NSAttributedString.Key: Any],
	           linkAttributes: [NSAttributedString.Key: Any]) {
		let attributedText = renderer.render(text: text,
		                                     attributes: attributes,
		                                     linkAttributes: linkAttributes)

		setUpTextView(with: attributedText)
	}

	func setUpAccessibility() {
		textView.isAccessibilityElement = true
	}

	func setUpTextView(with attributedText: NSAttributedString) {
		addSubview(textView, constraints: textView.constraintsForEdges(to: self))

		textView.attributedText = attributedText
		textView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:))))
		textView.isScrollEnabled = false
		textView.isSelectable = false
		textView.backgroundColor = .clear
	}

	@objc func handleTap(sender: UITapGestureRecognizer) {
		if let markupAction = markupAction(at: sender.location(in: textView)) {
			markupAction.execute()
		}
	}

	func markupAction(at location: CGPoint) -> MarkupAction? {
		guard let attributedText = textView.attributedText else { return nil }

		let index = indexOfCharacter(at: location)
		return attributedText.attribute(MarkupAttributedKeys.action, at: index, effectiveRange: nil) as? MarkupAction
	}

	func indexOfCharacter(at location: CGPoint) -> Int {
		let locationInTextContainer = CGPoint(x: location.x - textView.textContainerInset.left,
		                                      y: location.y - textView.textContainerInset.top)
		return textView.layoutManager.characterIndex(for: locationInTextContainer, in: textView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
	}
}
