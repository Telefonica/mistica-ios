//
//  CloseBarButtonItem.swift
//  CommonUIKit
//
//  Created by Pablo Bartolome on 3/18/20.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol CloseBarButtonItemPresenterProtocol: AnyObject {
	func didTapCloseButtonItem(sender: UIBarButtonItem)
}

public class CloseBarButtonItem: UIBarButtonItem {
	private let presenter: CloseBarButtonItemPresenterProtocol

	public init(presenter: CloseBarButtonItemPresenterProtocol, title: String) {
		self.presenter = presenter
		super.init()
		let button = UIButton(title: title,
		                      target: presenter,
		                      action: #selector(CloseBarButtonItemPresenterProtocol.didTapCloseButtonItem(sender:)))
		customView = button
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
