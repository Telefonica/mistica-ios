//
//  ProfileButtonPresenter.swift
//  CommonUIKit
//
//  Created by Pablo Carcelén on 05/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public protocol ProfileButtonViewProtocol: AnyObject {
	func showBadge()
	func hideBadge()

	/// The image to set to the ProfileButtonView. You can pass nil to remove the image and show the placeholder
	/// - Parameter image: the image to set, or nil so that the placeholder is set
	func setImage(_ image: UIImage?)

	func setAccessibilityIdentifier(_ accessibilityIdentifier: String)
}

public protocol ProfileButtonPresenterProtocol: AnyObject {
	// Please make this reference weak
	var view: ProfileButtonViewProtocol? { get set }

	func handleButtonTapped()
}
