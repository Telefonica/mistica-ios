//
//  BadgeCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct BadgeCatalogView: View {
    let colors: [UIColor] = [MisticaConfig.currentColors.backgroundSkeletonInverse,
                             MisticaConfig.currentColors.backgroundSkeletonInverse,
                             MisticaConfig.currentColors.borderHigh]
    let stops: [CGFloat] = [0, 0.3, 1]
    let angle: CGFloat = 180
    
    var body: some View {
        GeometryReader { geo in
            VStack {}
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            .linearGradient(colors: colors, stops: stops, angle: angle)
        }
    }
}

struct GradientView: ViewModifier {
    let colors: [UIColor]
    let stops: [CGFloat]
    let angle: CGFloat

    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            GeometryReader { geo in
                content
                    .background(
                        LinearGradient(
                            gradient: Gradient(
                                stops: [
                                    Gradient.Stop(color: Color(colors[0]), location: stops[0]),
                                    Gradient.Stop(color: Color(colors[1]), location: stops[1]),
                                    Gradient.Stop(color: Color(colors[2]), location: stops[2])
                                ]),
                            startPoint: gradientPoints(size: geo.size, cssAngle: angle).start,
                            endPoint: gradientPoints(size: geo.size, cssAngle: angle).end
                        )
                    )
            }
        } else {
            content
        }
    }
    
    private func gradientPoints(size: CGSize, cssAngle: CGFloat) -> (start: UnitPoint, end: UnitPoint) {
        var start = UnitPoint(x: 0.0, y: 1.0)
        var end = UnitPoint(x: 0.0, y: 0.0)

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
            start = UnitPoint(x: (90 - directionAngle.angle) / 180, y: 0.5)
            end = UnitPoint(x: (90 + directionAngle.angle) / 180, y: 0.5)
        case -90..<90:
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

    private func radian(degree: CGFloat) -> CGFloat {
        return degree * .pi / 180
    }
}

public extension View {
    func linearGradient(colors: [UIColor], stops: [CGFloat], angle: CGFloat) -> some View {
        modifier(GradientView(colors: colors, stops: stops, angle: angle))
    }
}

#if DEBUG
    struct BadgeCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                BadgeCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
