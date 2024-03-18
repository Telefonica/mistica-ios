//
//  GradientViewController.swift
//  MisticaCatalog
//
//  Created by Alejandro Ruiz on 11/3/24.
//

import UIKit
import Mistica

extension UIView {
    func applyLinearGradient(colors: [CGColor], locations: [NSNumber], angle: Float) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        let points = gradientPoints(size: bounds.size, cssAngle: 180)
        gradientLayer.startPoint = points.start
        gradientLayer.endPoint = points.end

        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

class GradientViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let palette = MovistarColorPalette()
        palette.movistarBlue

        // Configure gradient from your JSON data
        if let color1 = UIColor(hex: "#FABADA"),
           let color2 = UIColor(hex: "#F2E377"),
           let color3 = UIColor(hex: "#FFEEAA") {
            let colors: [CGColor] = [
                color1.cgColor,
                color2.cgColor,
                color3.cgColor
            ]
            let stops: [NSNumber] = [0, 0.3, 1] // Stop values provided in JSON
            let angle: Float = 180 // Angle provided in JSON
            
            // Apply gradient to the background of the view controller's view
            view.applyLinearGradient(colors: colors, locations: stops, angle: angle)
        } else {
            // Handle case where colors couldn't be parsed
            print("Unable to parse colors from JSON")
        }
    }
}

func gradientPoints(size: CGSize, cssAngle: CGFloat) -> (start: CGPoint, end: CGPoint) {
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

func radian(degree: CGFloat) -> CGFloat {
    return degree * .pi / 180
}
