//
//  IntrinsictImageView.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 23/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

class IntrinsictImageView: UIImageView {
	convenience init() {
		self.init(frame: .zero)
		setUp()
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setUp()
	}

	override init(image: UIImage?) {
		super.init(image: image)
		setUp()
	}

	override init(image: UIImage?, highlightedImage: UIImage?) {
		super.init(image: image, highlightedImage: highlightedImage)
		setUp()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setUp()
	}

	var intrinsicWidth: CGFloat = UIView.noIntrinsicMetric {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}

	var intrinsicHeight: CGFloat = UIView.noIntrinsicMetric {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}

	override var intrinsicContentSize: CGSize {
		CGSize(width: intrinsicWidth, height: intrinsicHeight)
	}

	private func setUp() {
		setContentCompressionResistancePriority(.required, for: .vertical)
		setContentCompressionResistancePriority(.required, for: .horizontal)
		setContentHuggingPriority(.required, for: .vertical)
		setContentHuggingPriority(.required, for: .horizontal)
	}
}
