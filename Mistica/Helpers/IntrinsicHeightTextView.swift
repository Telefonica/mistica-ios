//
//  IntrinsicHeightTextView.swift
//  CommonUIKit
//
//  Created by Jose Maria Puerta on 19/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

/// This UITextView subclass will size itself based on a fixed valud for it's height.
public class IntrinsicHeightTextView: UITextView {
	public var intrinsicHeight: CGFloat = 128
	public override var intrinsicContentSize: CGSize {
		let width = super.intrinsicContentSize.width
		let height = max(intrinsicHeight, super.intrinsicContentSize.height)
		return CGSize(width: width, height: height)
	}
}
