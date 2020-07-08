//
//  TagView.swift
//  Mistica
//
//  Created by Alejandro Megías on 29/04/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public class TagView: UIView {
	public enum Style {
		public static let horizontalMargin: CGFloat = 8
		public static let verticalMargin: CGFloat = 2
		public static let minWidth: CGFloat = 48
		public static let minHeight: CGFloat = 20
		public static var font: UIFont { .caption2 }
		static let cornerRadius: CGFloat = 2
		static let emptyContent = " "
	}

	// MARK: UI Subcomponents

	private lazy var label: UILabel = {
		let label = UILabel(frame: .zero)

		setUpFont(label)
		label.textColor = .textPrimaryInverse
		label.textAlignment = .center
		label.numberOfLines = 1

		return label
	}()

	// MARK: Properties

	public var text: String? {
		didSet {
			textDidSet()
		}
	}

	// MARK: Init

	public init() {
		super.init(frame: .zero)

		commonInit()
	}

	public override init(frame: CGRect) {
		super.init(frame: frame)

		commonInit()
	}

	public required init?(coder: NSCoder) {
		super.init(coder: coder)

		commonInit()
	}

	public init(text: String? = nil) {
		super.init(frame: .zero)
		self.text = text
		textDidSet()

		commonInit()
	}

	// MARK: Sizing

	public override var intrinsicContentSize: CGSize {
		let intrinsicWidth = Style.horizontalMargin
			+ label.intrinsicContentSize.width
			+ Style.horizontalMargin
		let intrinsicHeight = Style.verticalMargin
			+ label.intrinsicContentSize.height
			+ Style.verticalMargin

		return CGSize(width: max(Style.minWidth, intrinsicWidth),
		              height: max(Style.minHeight, intrinsicHeight))
	}

	// MARK: Accessibility

	public override var accessibilityLabel: String? {
		get {
			label.accessibilityLabel
		}
		set {
			label.accessibilityLabel = newValue
		}
	}

	public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)

		if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
			setUpFont(label)
			invalidateIntrinsicContentSize()
		}
	}
}

// MARK: Private methods

private extension TagView {
	func commonInit() {
		addSubview(label, constraints: [
			topAnchor.constraint(equalTo: label.topAnchor,
			                     constant: -Style.verticalMargin),
			bottomAnchor.constraint(equalTo: label.bottomAnchor,
			                        constant: Style.verticalMargin),
			leadingAnchor.constraint(equalTo: label.leadingAnchor,
			                         constant: -Style.horizontalMargin),
			trailingAnchor.constraint(equalTo: label.trailingAnchor,
			                          constant: Style.horizontalMargin)
		])

		makeRounded(cornerRadius: Style.cornerRadius)
		backgroundColor = .backgroundPromo
	}

	func textDidSet() {
		let normalized = normalize(text)
		guard label.text != normalized else { return }

		label.text = normalized
		invalidateIntrinsicContentSize()
	}

	func setUpFont(_ label: UILabel) {
		label.font = Style.font
	}

	func normalize(_ text: String?) -> String? {
		guard let text = text, !text.isEmpty else {
			// To keep the right intrinsic content height according
			// the text font, we will set, at least, a blank character
			// to the label.
			return Style.emptyContent
		}

		return text.uppercased()
	}
}
