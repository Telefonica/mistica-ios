//
//  MisticaGradient.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public struct MisticaGradient {
    public let colors: [UIColor]
    public let stops: [CGFloat]
    public let angle: CGFloat
    
    public init(colors: [UIColor], stops: [CGFloat], angle: CGFloat) {
        self.colors = colors
        self.stops = stops
        self.angle = angle
    }
}
