//
//  CGSize+Utils.swift
//  CommonUIKit
//
//  Created by pbartolome on 26/09/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public extension CGSize {
	func inset(by insets: UIEdgeInsets) -> CGSize {
		CGSize(width: width + insets.left + insets.right, height: height + insets.bottom + insets.top)
	}

	func area() -> CGFloat {
		width * height
	}
}
