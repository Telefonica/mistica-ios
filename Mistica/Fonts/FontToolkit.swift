//
//  FontToolkit.swift
//  Messenger
//
//  Created by Víctor Pimentel on 13/12/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

private var _isDynamicTypeEnabled = true

public extension UIFont {
	@objc(display1Font)
	static var display1: UIFont {
		FontStyle.display1.preferredFont()
	}

	@objc(display2Font)
	static var display2: UIFont {
		FontStyle.display2.preferredFont()
	}

	@objc(display3Font)
	static var display3: UIFont {
		FontStyle.display3.preferredFont()
	}

	@objc(display4Font)
	static var display4: UIFont {
		FontStyle.display4.preferredFont()
	}

	@objc(display5Font)
	static var display5: UIFont {
		FontStyle.display5.preferredFont()
	}

	@objc(display6Font)
	static var display6: UIFont {
		FontStyle.display6.preferredFont()
	}

	@objc(headline1Font)
	static var headline1: UIFont {
		FontStyle.headline1.preferredFont()
	}

	@objc(headline2Font)
	static var headline2: UIFont {
		FontStyle.headline2.preferredFont()
	}

	@objc(headline3Font)
	static var headline3: UIFont {
		FontStyle.headline3.preferredFont()
	}

	@objc(titleFont)
	static var title: UIFont {
		FontStyle.title.preferredFont()
	}

	@objc(title1Font)
	static var title1: UIFont {
		FontStyle.title1.preferredFont()
	}

	@objc(title2Font)
	static var title2: UIFont {
		FontStyle.title2.preferredFont()
	}

	@objc(title3Font)
	static var title3: UIFont {
		FontStyle.title3.preferredFont()
	}

	@objc(body1Font)
	static var body1: UIFont {
		FontStyle.body1.preferredFont()
	}

	@objc(body2Font)
	static var body2: UIFont {
		FontStyle.body2.preferredFont()
	}

	@objc(body3Font)
	static var body3: UIFont {
		FontStyle.body3.preferredFont()
	}

	@objc(sub1Font)
	static var sub1: UIFont {
		FontStyle.sub1.preferredFont()
	}

	@objc(sub2Font)
	static var sub2: UIFont {
		FontStyle.sub2.preferredFont()
	}

	@objc(caption1Font)
	static var caption1: UIFont {
		FontStyle.caption1.preferredFont()
	}

	@objc(caption2Font)
	static var caption2: UIFont {
		FontStyle.caption2.preferredFont()
	}

	@objc(caption3Font)
	static var caption3: UIFont {
		FontStyle.caption3.preferredFont()
	}

	@objc(caption4Font)
	static var caption4: UIFont {
		FontStyle.caption4.preferredFont()
	}

	@objc(fixedFontForFontStyle:)
	static func fixedFont(for fontStyle: FontStyle) -> UIFont {
		fontStyle.preferredFont(constrainedToPreferredSize: .large)
	}

	@objc(preferredFontForFontStyle:constrainedToSize:)
	static func preferredFont(for fontStyle: FontStyle, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory) -> UIFont {
		fontStyle.preferredFont(constrainedToPreferredSize: constrainedPreferredSize)
	}

	@objc static var isDynamicTypeEnabled: Bool {
		get {
			return _isDynamicTypeEnabled
		}
		set {
			_isDynamicTypeEnabled = newValue
		}
	}
}
