//
//  ProfileBarButtonItem.swift
//  Mistica
//
//  Created by Pablo Carcelén on 05/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

/// Encapsulates a `ProfileButtonView` inside a UIBarButtonItem.
public class ProfileBarButtonItem: UIBarButtonItem {
	private let profileButtonView: ProfileButtonView

	public init(presenter: ProfileButtonPresenterProtocol) {
		profileButtonView = ProfileButtonView(presenter: presenter)

		super.init()

		profileButtonView.translatesAutoresizingMaskIntoConstraints = false
		customView = profileButtonView

		setImage(nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ProfileBarButtonItem: ProfileButtonViewProtocol {
	public func setAccessibilityIdentifier(_ accessibilityIdentifier: String) {
		profileButtonView.setAccessibilityIdentifier(accessibilityIdentifier)
	}

	public func showBadge() {
		profileButtonView.showBadge()
	}

	public func hideBadge() {
		profileButtonView.hideBadge()
	}

	public func setImage(_ image: UIImage?) {
		profileButtonView.setImage(image)
	}
}
