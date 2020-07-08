//
//  FontStyle.swift
//  CommonKit
//
//  Created by Pablo Carcelén on 4/12/17.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

@objc public enum FontStyle: Int, CaseIterable, CustomStringConvertible {
	case display1
	case display2
	case display3
	case display4
	case display5
	case display6
	case headline1
	case headline2
	case headline3
	case title
	case title1
	case title2
	case title3
	case body1
	case body2
	case body3
	case sub1
	case sub2
	case caption1
	case caption2
	case caption3
	case caption4

	func preferredFont(constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
		let horizontalSizeClass = UIScreen.main.traitCollection.horizontalSizeClass
		var preferredSize = self.preferredSize

		if let constrainedSize = constrainedPreferredSize, preferredSize.isGreaterThan(constrainedSize) {
			preferredSize = constrainedSize
		}

		let points = fontSize.points(prerredContentSize: preferredSize, horizontalSizeClass: horizontalSizeClass)

		return UIFont.systemFont(ofSize: points, weight: weight)
	}

	public var description: String {
		switch self {
		case .display1:
			return "display1"
		case .display2:
			return "display2"
		case .display3:
			return "display3"
		case .display4:
			return "display4"
		case .display5:
			return "display5"
		case .display6:
			return "display6"
		case .headline1:
			return "headline1"
		case .headline2:
			return "headline2"
		case .headline3:
			return "headline3"
		case .title:
			return "title"
		case .title1:
			return "title1"
		case .title2:
			return "title2"
		case .title3:
			return "title3"
		case .body1:
			return "body1"
		case .body2:
			return "body2"
		case .body3:
			return "body3"
		case .sub1:
			return "sub1"
		case .sub2:
			return "sub2"
		case .caption1:
			return "caption1"
		case .caption2:
			return "caption2"
		case .caption3:
			return "caption3"
		case .caption4:
			return "caption4"
		}
	}
}

private extension FontStyle {
	var preferredSize: UIContentSizeCategory {
		UIScreen.main.traitCollection.preferredContentSizeCategory
	}

	var fontSize: FontSize {
		switch self {
		case .display1,
		     .display2,
		     .display3:
			return .huge
		case .display4:
			return .veryVeryHuge
		case .display5:
			return .extraHuge
		case .display6:
			return .veryHuge
		case .headline1,
		     .headline2,
		     .headline3:
			return .large
		case .title,
		     .title1:
			return .big
		case .title2,
		     .title3:
			return .veryBig
		case .body1,
		     .body2,
		     .body3:
			return .medium
		case .sub1,
		     .sub2:
			return .small
		case .caption1,
		     .caption2,
		     .caption3:
			return .verySmall
		case .caption4:
			return .extraSmall
		}
	}

	var weight: UIFont.Weight {
		switch self {
		case .display1:
			return .regular
		case .display2:
			return .medium
		case .display3:
			return .light
		case .display4:
			return .regular
		case .display5:
			return .light
		case .display6:
			return .light
		case .headline1:
			return .regular
		case .headline2:
			return .medium
		case .headline3:
			return .light
		case .title:
			return .medium
		case .title1:
			return .light
		case .title2:
			return .medium
		case .title3:
			return .light
		case .body1:
			return .regular
		case .body2:
			return .medium
		case .body3:
			return .bold
		case .sub1:
			return .regular
		case .sub2:
			return .medium
		case .caption1:
			return .regular
		case .caption2:
			return .medium
		case .caption3:
			return .bold
		case .caption4:
			return .regular
		}
	}
}

// This extension can go away when we drop support for iOS versions lower than 11
public extension UIContentSizeCategory {
	func isGreaterThan(_ other: UIContentSizeCategory) -> Bool {
		self > other
	}

	private var weight: Int {
		switch self {
		case .extraSmall:
			return -3
		case .small:
			return -2
		case .medium:
			return -1
		case .large: // Default
			return 0
		case .extraLarge:
			return 1
		case .extraExtraLarge:
			return 2
		case .extraExtraExtraLarge:
			return 3
		case .accessibilityMedium:
			return 4
		case .accessibilityLarge:
			return 5
		case .accessibilityExtraLarge:
			return 6
		case .accessibilityExtraExtraLarge:
			return 7
		case .accessibilityExtraExtraExtraLarge:
			return 8
		default:
			return 0
		}
	}
}
