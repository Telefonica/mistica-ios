//
//  SeparatorView.swift
//  CommonUIKit
//
//  Created by Guille Gonzalez on 22/11/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

/// One point separator view.
public final class SeparatorView: UIView {
	private enum Constants {
		static let thickness: CGFloat = 1
	}

	private let axis: NSLayoutConstraint.Axis

	public var height: CGFloat = Constants.thickness {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}

	public override var intrinsicContentSize: CGSize {
		switch axis {
		case .horizontal:
			return CGSize(width: UIView.noIntrinsicMetric, height: height)
		case .vertical:
			return CGSize(width: height, height: UIView.noIntrinsicMetric)
		@unknown default:
			fatalError()
		}
	}

	public init(axis: NSLayoutConstraint.Axis) {
		self.axis = axis
		super.init(frame: .zero)
		commonInit()
	}

	required init?(coder: NSCoder) {
		axis = .horizontal
		super.init(coder: coder)
		commonInit()
	}
}

private extension SeparatorView {
	func commonInit() {
		backgroundColor = .divider

		setContentHuggingPriority(.required, for: .vertical)
		setContentCompressionResistancePriority(.required, for: .vertical)
	}
}
