//
//  GradientView.swift
//  
//
//  Created by Alejandro Ruiz on 10/4/24.
//

import UIKit

class GradientView: UIView {
    private var colors: [UIColor] = []
    private var locations: [NSNumber] = []
    private var angle: CGFloat = 0.0
    private var gradientLayer: CAGradientLayer!
    
    init(frame: CGRect, colors: [UIColor], locations: [NSNumber], angle: CGFloat) {
        super.init(frame: frame)
        self.colors = colors
        self.locations = locations
        self.angle = angle
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        self.gradientLayer = self.layer as? CAGradientLayer
        self.gradientLayer.colors = colors.map { $0.cgColor }
        self.gradientLayer.locations = locations
        let points = gradientPoints(size: bounds.size, cssAngle: angle)
        self.gradientLayer.startPoint = points.start
        self.gradientLayer.endPoint = points.end
    }
    
    private func gradientPoints(size: CGSize, cssAngle: CGFloat) -> (start: CGPoint, end: CGPoint) {
        var start = CGPoint(x: 0.0, y: 1.0)
        var end = CGPoint(x: 0.0, y: 0.0)

        let normalizedAngle = cssAngle.truncatingRemainder(dividingBy: 360)
        var directionAngle: (angle: CGFloat, topSide: Bool)

        if (90.0...270.0).contains(normalizedAngle) {
            directionAngle = (normalizedAngle - 180, false)
        } else if normalizedAngle > 270 {
            directionAngle = (normalizedAngle - 180, true)
        } else if normalizedAngle < -90 && normalizedAngle > -270 {
            directionAngle = (abs(normalizedAngle) - 180, false)
        } else if normalizedAngle <= -270 {
            directionAngle = (abs(normalizedAngle) - 180, true)
        } else {
            directionAngle = (normalizedAngle, true)
        }

        switch directionAngle.angle {
        case 90, -90.0:
            start = CGPoint(x: (90 - directionAngle.angle) / 180, y: 0.5)
            end = CGPoint(x: (90 + directionAngle.angle) / 180, y: 0.5)
        case -90..<90:
            var angle = radian(degree: directionAngle.angle)
            var tAngle = tan(angle)
            
            guard !tAngle.isNaN else {
                start = CGPoint(x: 1, y: 0.5)
                end = CGPoint(x: 0, y: 0.5)
                break
            }

            start.y = 1
            end.y = 0
            let valueX = (size.width / 2 - (size.height / 2 * tAngle)) / size.width

            start.x = valueX < 0 ? 0 : (valueX >= 1 ? 1 : valueX)
            end.x = valueX < 0 ? 1 : (valueX >= 1 ? 0 : 1 - valueX)

            if valueX < 0 || valueX > 1 {
                angle = radian(degree: 90 - abs(directionAngle.angle))
                tAngle = tan(angle)
                let valueY = (size.height / 2 - (size.width / 2 * tAngle)) / size.height
                start.y = 1 - valueY
                end.y = valueY
            }
        default:
            break
        }

        return directionAngle.topSide ? (start, end) : (end, start)
    }

    private func radian(degree: CGFloat) -> CGFloat {
        return degree * .pi / 180
    }
}
