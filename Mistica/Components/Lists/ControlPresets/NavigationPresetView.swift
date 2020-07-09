//
//  NavigationPresetView.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 24/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public class NavigationPresetView: UIStackView {
    private let imageView = UIImageView(image: .arrowRight)

	public let badgeView = BadgeView()

	public var isBadgeHidden = false {
		didSet {
			if isBadgeHidden {
				badgeView.removeFromSuperview()
			} else if badgeView.superview == nil {
				insertArrangedSubview(badgeView, at: 0)
			}
		}
	}

	public var isNavigationIconHidden = false {
		didSet {
			if isNavigationIconHidden {
				imageView.removeFromSuperview()
			} else if badgeView.superview == nil {
				addArrangedSubview(imageView)
			}
		}
	}

	public convenience init() {
		self.init(frame: .zero)
	}

	public override init(frame: CGRect) {
		super.init(frame: .zero)

		commonInit()
	}

	required init(coder: NSCoder) {
		super.init(coder: coder)

		commonInit()
	}
}

private extension NavigationPresetView {
	func commonInit() {
		axis = .horizontal
		alignment = .center
		spacing = 16

		imageView.tintColor = .textSecondary

		addArrangedSubview(imageView)
	}
}
