//
//  BackBarButtonItem.swift
//  CommonUIKit
//
//  Created by Pablo Bartolome on 3/18/20.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol BackBarButtonItemPresenterProtocol: AnyObject {
	func didTapBackButtonItem(sender: UIBarButtonItem)
}

public class BackBarButtonItem: UIBarButtonItem {
	private let presenter: BackBarButtonItemPresenterProtocol

	public init(presenter: BackBarButtonItemPresenterProtocol) {
		self.presenter = presenter
		super.init()

		image = BarButtonIcon.back.image
		style = .plain
		target = presenter
		action = #selector(BackBarButtonItemPresenterProtocol.didTapBackButtonItem(sender:))
		accessibilityLabel = NavigationTranslations.backButtonText
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
