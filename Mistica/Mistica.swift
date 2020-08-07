//
//  Mistica.swift
//  Mistica
//
//  Created by Pablo Bartolome on 08/07/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation

public struct Mistica {
    static var currentColorPalette: ColorPalette = MovistarColorPalette()
    static var currentStyledControls = [MisticaControlStyle]()

    // MARK: Public Setup

    public static var brandStyle: BrandStyle = .movistar {
        didSet {
            configureColorPalette(for: brandStyle)
        }
    }

    public static var themeVariant: ThemeVariant = .standard {
        didSet {
            NotificationCenter.default.post(name: .themeVariantDidChange, object: nil)
            MisticaAppearance.setUp(controls: currentStyledControls)
        }
    }

    public static func styleControls(_ controls: [MisticaControlStyle]) {
        currentStyledControls = controls
        MisticaAppearance.setUp(controls: controls)
    }
}

private extension Mistica {
    static func configureColorPalette(for _: BrandStyle) {
        switch brandStyle {
        case .movistar:
            currentColorPalette = MovistarColorPalette()
        case .vivo:
            currentColorPalette = VivoColorPalette()
        case .o2:
            currentColorPalette = O2ColorPalette()
        case .o2Classic:
            currentColorPalette = O2ClassicColorPalette()
        }
    }
}
