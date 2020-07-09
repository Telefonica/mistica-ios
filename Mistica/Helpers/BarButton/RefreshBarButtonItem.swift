//
//  RefreshBarButtonItem.swift
//  Mistica
//
//  Created by Jose Maria Puerta on 11/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol RefreshBarButtonItemPresenterProtocol: AnyObject {
	func didTapRefreshButtonItem(sender: UIBarButtonItem)
}

public class RefreshBarButtonItem: UIBarButtonItem {
	private let presenter: RefreshBarButtonItemPresenterProtocol

	public init(presenter: RefreshBarButtonItemPresenterProtocol) {
		self.presenter = presenter
		super.init()

		image = BarButtonIcon.reload.image
		style = .plain
		target = presenter
		action = #selector(RefreshBarButtonItemPresenterProtocol.didTapRefreshButtonItem(sender:))
		accessibilityLabel = Translations.reloadButtonLabel
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
