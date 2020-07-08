//
//  HeaderViewStyle.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 18/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public enum HeaderViewStyle {
	case normal
	case inverse
}

extension HeaderViewStyle {
	var backgroundColor: UIColor {
		switch self {
		case .normal:
			return .background
		case .inverse:
			return .navigationBarBackground
		}
	}

	var primaryButton: Button.Style {
		switch self {
		case .normal:
			return .primary
		case .inverse:
			return .primaryInverse
		}
	}

	var secondaryButton: Button.Style {
		switch self {
		case .normal:
			return .secondary
		case .inverse:
			return .secondaryInverse
		}
	}

	var textPrimaryColor: UIColor {
		switch self {
		case .normal:
			return .textPrimary
		case .inverse:
			return .textPrimaryInverse
		}
	}

	var textSecondaryColor: UIColor {
		switch self {
		case .normal:
			return .textSecondary
		case .inverse:
			return .textSecondaryInverse
		}
	}
}
