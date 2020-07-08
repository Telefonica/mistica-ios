//
//  UIStackView+Utils.swift
//  CommonKit
//
//  Created by cbarrera on 5/4/18.
//  Copyright © 2018 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public extension UIStackView {
	func removeArrangedSubviews() {
		arrangedSubviews.forEach { subview in
			subview.removeFromSuperview()
		}
	}
}
