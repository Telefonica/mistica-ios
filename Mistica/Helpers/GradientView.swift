//
//  GradientView.swift
//  Mistica
//
//  Created by Guille Gonzalez on 25/08/2017.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public struct GradientStyle {
	let alpha: CGFloat
	let colors: [UIColor]
	let locations: [NSNumber]
	let start: CGPoint
	let end: CGPoint
	let isOpaque: Bool

	public static var assistant: GradientStyle {
		GradientStyle(alpha: 0.92,
		              colors: [
		              	UIColor.gradientBackgroundFirst,
		              	UIColor.gradientBackgroundSecond,
		              	UIColor.gradientBackgroundThird,
		              	UIColor.gradientBackgroundFourth
		              ],
		              locations: [0, 0.51, 0.71, 1],
		              start: CGPoint(x: 0.5, y: 0),
		              end: CGPoint(x: 0.5, y: 1.0),
		              isOpaque: false)
	}

	public static var backgroundBrand: GradientStyle {
		GradientStyle(alpha: 1,
		              colors: [
		              	UIColor.backgroundBrandFirst,
		              	UIColor.backgroundBrandSecond,
		              	UIColor.backgroundBrandThird,
		              	UIColor.backgroundBrandFourth
		              ],
		              locations: [0, 0.51, 0.71, 1],
		              start: CGPoint(x: 0.5, y: 0),
		              end: CGPoint(x: 0.5, y: 1.0),
		              isOpaque: false)
	}

	public static var scrollContentIndicator: GradientStyle {
		GradientStyle(alpha: 1,
		              colors: [
		              	UIColor.scrollContentIndicatorBackgroundFirst,
		              	UIColor.scrollContentIndicatorBackgroundSecond
		              ],
		              locations: [0, 1],
		              start: CGPoint(x: 0, y: 0.5),
		              end: CGPoint(x: 1.0, y: 0.5),
		              isOpaque: false)
	}
}

public final class GradientView: UIView {
	public var colors: [UIColor] = [] {
		didSet {
			gradientLayer.colors = colors.map { $0.cgColor }
		}
	}

	public var start: CGPoint {
		get { return gradientLayer.startPoint }
		set { gradientLayer.startPoint = newValue }
	}

	public var end: CGPoint {
		get { return gradientLayer.endPoint }
		set { gradientLayer.endPoint = newValue }
	}

	public var locations: [NSNumber]? {
		get { return gradientLayer.locations }
		set { gradientLayer.locations = newValue }
	}

	public override class var layerClass: AnyClass {
		CAGradientLayer.self
	}

	public func applyStyle(_ style: GradientStyle) {
		colors = style.colors
		start = style.start
		end = style.end
		locations = style.locations
		isOpaque = style.isOpaque
		alpha = style.alpha
	}
}

private extension GradientView {
	var gradientLayer: CAGradientLayer {
		guard let layer = self.layer as? CAGradientLayer else {
			fatalError("Invalid layer class")
		}

		return layer
	}
}
