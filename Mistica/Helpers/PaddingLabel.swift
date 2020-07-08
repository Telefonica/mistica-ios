//
//  PaddingLabel.swift
//  CommonUIKit
//
//  Created by jmpuerta on 29/4/18.
//  Copyright © 2018 Tuenti. All rights reserved.
//

import Foundation
import UIKit

open class PaddingLabel: UILabel {
	@IBInspectable open var topInset: CGFloat = 0
	@IBInspectable open var bottomInset: CGFloat = 0
	@IBInspectable open var leftInset: CGFloat = 0
	@IBInspectable open var rightInset: CGFloat = 0

	open var contentInset: UIEdgeInsets {
		get { return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset) }
		set {
			topInset = newValue.top
			bottomInset = newValue.bottom
			leftInset = newValue.left
			rightInset = newValue.right
		}
	}

	open override func drawText(in rect: CGRect) {
		super.drawText(in: rect.inset(by: contentInset))
	}

	open override var intrinsicContentSize: CGSize {
		var contentSize = super.intrinsicContentSize
		contentSize.height += topInset + bottomInset
		contentSize.width += leftInset + rightInset
		return contentSize
	}
}
