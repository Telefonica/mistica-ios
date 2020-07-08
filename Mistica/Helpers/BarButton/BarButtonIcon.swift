//
//  BarButtonIcon.swift
//  Mistica
//
//  Created by Pablo Bartolome on 3/18/20.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

@objc public enum BarButtonIcon: Int {
	case back
	case browserShare
	case browserSafari
	case browserBack
	case browserForward
	case support
	case reload
	case search
}

extension BarButtonIcon {
	var image: UIImage {
		switch self {
		case .back:
			return .navigationBarBackButtonImage
		case .browserShare:
			return .browserToolbarShareImage
		case .browserSafari:
			return .browserToolbarSafariImage
		case .browserBack:
			return .browserBackButtonImage
		case .browserForward:
			return .browserForwardButtonImage
		case .support:
			return .navigationBarSupportButtonImage
		case .reload:
			return .navigationBarReloadButtonImage
		case .search:
			return .navigationBarSearchButtonImage
		}
	}
}
