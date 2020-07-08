//
//  ScrollContentIndicator.swift
//  Mistica
//
//  Created by Jose Salavert on 24/03/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public class ScrollContentIndicator: Button {
	private enum Constants {
		static let shadowOpacity: Float = 0.2
		static let shadowRadius: CGFloat = 12
		static let defaultMargin: CGFloat = 24
		static let defaultHeight: CGFloat = 40
		static let animationDuration: TimeInterval = 0.3
	}

	public init(title: String, loadingTitle: String? = nil, isSmall: Bool = false) {
		super.init(style: .primaryClear, title: title, loadingTitle: loadingTitle, isSmall: isSmall)
		setUp()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		style = .primaryClear
		setUp()
	}

	public func addToView(_ view: UIView) {
		view.addSubview(self, constraints: [
			centerXAnchor.constraint(equalTo: view.centerXAnchor),
			heightAnchor.constraint(equalToConstant: Constants.defaultHeight),
			topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.defaultMargin)
		])
	}

	public func show() {
		isHidden = false
		UIView.animate(withDuration: Constants.animationDuration,
		               delay: 0.0,
		               options: .curveEaseOut,
		               animations: {
		               	self.transform = .identity
		               	self.alpha = 1
		})
	}

	public func hide() {
		UIView.animate(withDuration: Constants.animationDuration,
		               delay: 0.0,
		               options: .curveEaseIn,
		               animations: {
		               	// Due to the maths behind Affine Transformation matrix we have to use 0.001 instead 0.0 for the down scale to work properly.
		               	// More info: https://medium.com/@sarthak.tayade/problem-when-animating-a-uiview-to-scale-to-zero-using-cgaffinetransform-on-ios-2f50717add18
		               	self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
		               	self.alpha = 0
		               }, completion: { _ in
		               	self.isHidden = true
		})
	}
}

private extension ScrollContentIndicator {
	var cornerRadius: CGFloat {
		Constants.defaultHeight / 2
	}

	func setUp() {
		removeBorder()
		addGradient()
		makeRounded(cornerRadius: cornerRadius)
		addShadow()
		transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
		alpha = 0
		isHidden = true
		setContentCompressionResistancePriority(.required, for: .horizontal)
	}

	func addGradient() {
		let gradientView = GradientView()
		gradientView.applyStyle(.scrollContentIndicator)
		gradientView.makeRounded(cornerRadius: cornerRadius)
		insertSubview(gradientView, at: 0, constraints: gradientView.constraintsForEdges(to: self))
	}

	func addShadow() {
		layer.shadowColor = UIColor.backgroundOpacity.cgColor
		layer.shadowOpacity = Constants.shadowOpacity
		layer.shadowOffset = .zero
		layer.shadowRadius = Constants.shadowRadius
		layer.masksToBounds = false
	}
}
