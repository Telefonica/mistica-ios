//
//  ProfileButtonView.swift
//  CommonUIKit
//
//  Created by Pablo on 21/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

/// `ProfileButtonView` is meant for displaying a small rounded button with the profile avatar. This class consists
/// of the standalone view, that can be placed in a floating manner.
/// If you are going to place this on a NavigationBar, check the `ProfileBarButtonItem`, which encapsulates this class
/// inside a UIBarButtonItem.
///
/// To initialize this class, you need a type that conforms to `ProfileButtonPresenterProtocol`. The presenter was
/// introduced to encapsulate handling the action of tapping the button, and showing and hiding the badge. That way
/// the view component can be reused across different apps.
public class ProfileButtonView: UIView {
	private enum Constants {
		static let avatarSideSize: CGFloat = 28
		static let viewSideSize: CGFloat = 44
	}

	lazy var button = UIButton(type: .custom)
	private lazy var badgeView = BadgeView()

	private var image: UIImage? {
		get { button.image(for: .normal) }
		set { button.setImage(newValue, for: .normal) }
	}

	let presenter: ProfileButtonPresenterProtocol

	public init(presenter: ProfileButtonPresenterProtocol) {
		self.presenter = presenter

		super.init(frame: .zero)
		addSubview(withDefaultConstraints: button)

		NSLayoutConstraint.activate([
			button.widthAnchor.constraint(equalToConstant: Constants.viewSideSize),
			button.heightAnchor.constraint(equalToConstant: Constants.viewSideSize)
		])

		badgeView.isHidden = true
		// Pythagoras' theorem solving the size of the leg (assuming both legs will be the same and that the
		// hypotenuse is Constants.avatarSide / 2. Eq: 2l² = h² -> l² = h²/2 -> l = √(h²/2) -> l = h/√2
		let badgeDistanceFromCenter = (Constants.avatarSideSize / 2) / sqrt(2)
		addSubview(badgeView, constraints: [
			badgeView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: badgeDistanceFromCenter),
			badgeView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -badgeDistanceFromCenter)
		])

		button.adjustsImageWhenHighlighted = true
		let buttonInset = (Constants.viewSideSize - Constants.avatarSideSize) / 2
		button.contentEdgeInsets = UIEdgeInsets(top: buttonInset, left: buttonInset, bottom: buttonInset, right: buttonInset)

		button.addTarget(self,
		                 action: #selector(ProfileButtonView.didTapButton),
		                 for: .touchUpInside)

		hideBadge()

		presenter.view = self
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@objc func didTapButton() {
		presenter.handleButtonTapped()
	}
}

extension ProfileButtonView: ProfileButtonViewProtocol {
	public func setImage(_ image: UIImage?) {
		if image != nil {
			let image = image?.rounded
			self.image = image
		} else {
			self.image = .profileButtonPlaceholder
		}
	}

	public func showBadge() {
		badgeView.isHidden = false
		button.accessibilityLabel = "\(SettingsTranslations.settingWithBadgeLabel) \(HomeTranslations.buttonProfileTitle)"
	}

	public func hideBadge() {
		badgeView.isHidden = true
		button.accessibilityLabel = HomeTranslations.buttonProfileTitle
	}

	public func setAccessibilityIdentifier(_ accessibilityIdentifier: String) {
		button.accessibilityIdentifier = accessibilityIdentifier
	}
}
