//
//  UIButton+Utils.swift
//  Messenger
//
//  Created by Víctor Pimentel on 04/01/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public extension UIButton {
	func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
		setBackgroundImage(UIImage(color: color), for: state)
	}

	private var states: [UIControl.State] {
		[.normal, .selected, .highlighted, .disabled]
	}

	/// Set image for all states.
	///
	/// - Parameter image: UIImage.
	func setImageForAllStates(_ image: UIImage) {
		states.forEach { self.setImage(image, for: $0) }
	}
}
