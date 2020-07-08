//
//  IntrinsicMaxButtonWidthContainerView.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 19/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

class IntrinsicMaxButtonWidthContainerView: UIStackView {
	let primaryButton = Button(title: "")
	let secondaryButton = Button(style: .secondary, title: "")

	init() {
		super.init(frame: .zero)
		axis = .vertical
		spacing = 16
		addArrangedSubview(primaryButton)
		addArrangedSubview(secondaryButton)
	}

	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override var intrinsicContentSize: CGSize {
		let width = max(primaryButton.intrinsicContentSize.width, secondaryButton.intrinsicContentSize.width)
		return CGSize(width: width, height: UIView.noIntrinsicMetric)
	}
}
