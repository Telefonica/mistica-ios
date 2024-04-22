//
//  GradientView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public struct GradientView: View {
    let stops: [Gradient.Stop]
    let angle: CGFloat

    public init(colors: [UIColor], stops: [CGFloat], angle: CGFloat) {
        self.stops = zip(colors, stops).map { Gradient.Stop(color: Color($0), location: $1) }
        self.angle = angle
    }

    public var body: some View {
        GeometryReader { geo in
            LinearGradient(
                gradient: Gradient(stops: stops),
                startPoint: gradientPoints(size: geo.size, cssAngle: angle).start,
                endPoint: gradientPoints(size: geo.size, cssAngle: angle).end
            )
        }
    }
}

private extension GradientView {
    /**
     This function is intended to receive the same points that would be received on the Web using CSS from a given angle.
     */
    func gradientPoints(size: CGSize, cssAngle: CGFloat) -> (start: UnitPoint, end: UnitPoint) {
        var start = UnitPoint(x: 0.0, y: 1.0)
        var end = UnitPoint(x: 0.0, y: 0.0)

        let normalizedAngle = cssAngle.truncatingRemainder(dividingBy: 360)
        var directionAngle: (angle: CGFloat, topSide: Bool)

        if (90.0 ... 270.0).contains(normalizedAngle) {
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
            start = UnitPoint(x: (90 - directionAngle.angle) / 180, y: 0.5)
            end = UnitPoint(x: (90 + directionAngle.angle) / 180, y: 0.5)
        case -90 ..< 90:
            var angle = radian(degree: directionAngle.angle)
            var tAngle = tan(angle)

            guard !tAngle.isNaN else {
                start = UnitPoint(x: 1, y: 0.5)
                end = UnitPoint(x: 0, y: 0.5)
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

    func radian(degree: CGFloat) -> CGFloat {
        degree * .pi / 180
    }
}
