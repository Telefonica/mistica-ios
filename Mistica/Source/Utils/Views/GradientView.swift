//
//  GradientView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct GradientStyle {
    let alpha: CGFloat
    let colors: [UIColor]
    let locations: [NSNumber]
    let start: CGPoint
    let end: CGPoint
    let isOpaque: Bool

    static var backgroundBrand: GradientStyle {
        GradientStyle(
            alpha: 1,
            colors: UIColor.backgroundBrandGradient,
            locations: [0, 0.51, 0.71, 1],
            start: CGPoint(x: 0.5, y: 0),
            end: CGPoint(x: 0.5, y: 1.0),
            isOpaque: false
        )
    }
}

final class GradientView: UIView {
    var colors: [UIColor] = [] {
        didSet {
            gradientLayer.colors = colors.map(\.cgColor)
        }
    }

    var start: CGPoint {
        get { gradientLayer.startPoint }
        set { gradientLayer.startPoint = newValue }
    }

    var end: CGPoint {
        get { gradientLayer.endPoint }
        set { gradientLayer.endPoint = newValue }
    }

    var locations: [NSNumber]? {
        get { gradientLayer.locations }
        set { gradientLayer.locations = newValue }
    }

    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    func applyStyle(_ style: GradientStyle) {
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
