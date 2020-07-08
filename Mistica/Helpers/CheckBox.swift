//
//  CheckBox.swift
//  Mistica
//
//  Created by cestebanez on 25/03/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

enum CheckBoxStyle {
	static func messageAttributes() -> [NSAttributedString.Key: Any] {
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5
		return [
			.font: UIFont.body1,
			.foregroundColor: UIColor.textPrimary,
			.paragraphStyle: paragraphStyle
		]
	}

	static let mainStackSpacing: CGFloat = 16
	static let mainStackTopPadding: CGFloat = 16
	static let textStackSpacing: CGFloat = 4
	static let separatorPadding: CGFloat = 8
	static let mainStackSeparatorGoneBottomPadding: CGFloat = separatorPadding + 1 // separatorPadding + 1pt because of the separator itself

	static let buttonDiameterDefaultSize: CGFloat = 22
	static let buttonDiameterAccessibilitySize: CGFloat = 44

	static let markupTextContainerInset = UIEdgeInsets(top: 2, left: -6, bottom: 2, right: -6)

	static let errorAnimationDuration: TimeInterval = 0.3
}

public protocol CheckBoxDelegate: AnyObject {
	func checkBoxValueDidChange(_ field: CheckBox)
}

public class CheckBox: UIView {
	public weak var delegate: CheckBoxDelegate?

	private let markupRenderer: MarkupRenderer
	private let markupText: String
	private let isOptional: Bool

	/// This var will be `true` if the user selected the checkbox by tapping in its button, `false` otherwise.
	private(set) var isSelected = false

	// MARK: Subviews

	private lazy var mainStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [checkmarkButton, textStack])
		stack.spacing = CheckBoxStyle.mainStackSpacing
		stack.alignment = .top
		stack.axis = .horizontal
		return stack
	}()

	private lazy var checkmarkButton: UIButton = {
		let button = UIButton(type: .custom)
		button.tintColor = .white
		button.setImage(.checkmarkIconSmall, for: .selected)
		button.setImage(.checkmarkIconSmall, for: .normal)
		button.imageView?.contentMode = .scaleAspectFill
		button.contentVerticalAlignment = .fill
		button.contentHorizontalAlignment = .fill
		button.addBorder()
		button.makeRounded(cornerRadius: CheckBoxStyle.buttonDiameterDefaultSize / 2)
		button.setBackgroundColor(.controlActivated, for: .selected)
		button.addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	private lazy var textStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [messageMarkupView, errorLabel])
		stack.axis = .vertical
		stack.spacing = CheckBoxStyle.textStackSpacing
		return stack
	}()

	private lazy var messageMarkupView: MarkupTextView = {
		let messageMarkupView = MarkupTextView(renderer: markupRenderer,
		                                       text: markupText,
		                                       attributes: CheckBoxStyle.messageAttributes())
		messageMarkupView.textContainerInset = CheckBoxStyle.markupTextContainerInset
		return messageMarkupView
	}()

	private lazy var errorLabel: PaddingLabel = {
		let label = PaddingLabel()
		label.text = MisticaTranslations.formNonOptionalFieldText
		label.textAlignment = .left
		label.font = .caption1
		label.textColor = .textInputLabelError
		label.numberOfLines = 2
		label.isHidden = true
		return label
	}()

	public init(markupRenderer: MarkupRenderer,
	            markupText: String,
	            isOptional: Bool,
	            hasSeparator: Bool) {
		self.markupRenderer = markupRenderer
		self.markupText = markupText
		self.isOptional = isOptional

		super.init(frame: .zero)

		let mainStackBottomConstraint = mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CheckBoxStyle.mainStackSeparatorGoneBottomPadding)

		addSubview(mainStack, constraints: [
			mainStack.topAnchor.constraint(equalTo: topAnchor, constant: CheckBoxStyle.mainStackTopPadding),
			mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
			mainStackBottomConstraint
		])

		mainStackBottomConstraint.isActive = !hasSeparator

		if hasSeparator {
			let separator = SeparatorView(axis: .horizontal)
			addSubview(separator, constraints: [
				separator.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: CheckBoxStyle.separatorPadding),
				separator.leadingAnchor.constraint(equalTo: leadingAnchor),
				separator.trailingAnchor.constraint(equalTo: trailingAnchor),
				separator.bottomAnchor.constraint(equalTo: bottomAnchor)
			])
		}

		updateCheckmarkButtonConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
			resetFonts()
			updateCheckmarkButtonConstraints()
		}
	}
}

extension CheckBox {
	public var customAccessibilityIdentifier: String? {
		get { checkmarkButton.accessibilityIdentifier }
		set { checkmarkButton.accessibilityIdentifier = newValue }
	}
}

extension CheckBox {
	@objc func checkboxButtonTapped(_ sender: UIButton) {
		checkmarkButton.isSelected.toggle()
		isSelected.toggle()
		removeErrorLabelIfTransitioningToValidState()
		delegate?.checkBoxValueDidChange(self)
	}
}

extension CheckBox: Validatable {
	public func isValid() -> Bool {
		isOptional || isSelected
	}

	public func validate() {
		updateErrorLabel()
	}
}

private extension CheckBox {
	func updateErrorLabel() {
		UIView.animate(withDuration: CheckBoxStyle.errorAnimationDuration) {
			self.errorLabel.isHidden = self.isValid()
		}
	}

	/// If we move to valid state, we want to refresh the error label. This covers the case of a previous call to
	/// validate() from outside this class which ended in a validation error (thus we shown the error label). Now
	/// when the user taps the check again, we want to remove the error label.
	func removeErrorLabelIfTransitioningToValidState() {
		guard isValid() else { return }
		updateErrorLabel()
	}

	func resetFonts() {
		errorLabel.font = .caption1
		// Given the attributedString-based mechanism of MarkupTextView, we need to rerender to switch fonts.
		// Also make sure that messageAttributes is a func, because a static var won't recalculate the fonts
		// inside the returned attributes.
		messageMarkupView.rerender(with: markupRenderer,
		                           text: markupText,
		                           attributes: CheckBoxStyle.messageAttributes())
	}

	func updateCheckmarkButtonConstraints() {
		let diameter: CGFloat = UIFontMetrics.default.scaledValue(for: CheckBoxStyle.buttonDiameterDefaultSize)

		checkmarkButton.removeConstraints(checkmarkButton.constraints)
		NSLayoutConstraint.activate([
			checkmarkButton.heightAnchor.constraint(equalToConstant: diameter),
			checkmarkButton.widthAnchor.constraint(equalToConstant: diameter)
		])
		checkmarkButton.makeRounded(cornerRadius: diameter / 2)
	}
}
