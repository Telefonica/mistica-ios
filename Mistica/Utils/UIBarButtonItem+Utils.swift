//
//  UIBarButtonItem+Utils.swift
//  Mistica
//
//  Created by Pablo on 06/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
	@objc convenience init(icon: UIImage,
	                       accessibilityLabel: String,
	                       target: AnyObject,
	                       action: Selector) {
		self.init()
		image = image
		self.target = target
		self.action = action
		style = .plain
		self.accessibilityLabel = accessibilityLabel
	}

	@objc convenience init(title: String,
	                       target: AnyObject,
	                       action: Selector) {
		let button = UIButton(title: title,
		                      target: target,
		                      action: action)
		self.init(customView: button)
	}
}

extension UIButton {
	convenience init(title: String, target: AnyObject, action: Selector) {
		self.init()
		addTarget(target, action: action, for: .touchUpInside)
		setTitle(title, for: .normal)
		setTitleColor(.navigationBarPrimary, for: .normal)
		setTitleColor(.navigationBarSecondary, for: .highlighted)
		setTitleColor(.navigationBarSecondary, for: .selected)
		setTitleColor(.navigationBarSecondary, for: .disabled)
		titleLabel?.font = .body1
		sizeToFit()
		frameHeight = 36.0
	}
}
