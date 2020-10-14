//
//  GradientView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

struct GradientStyle {
    let alpha: CGFloat
    let colors: [UIColor]
    let locations: [NSNumber]
    let start: CGPoint
    let end: CGPoint
    let isOpaque: Bool

    static var assistant: GradientStyle {
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

    static var backgroundBrand: GradientStyle {
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

    static var scrollContentIndicator: GradientStyle {
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
