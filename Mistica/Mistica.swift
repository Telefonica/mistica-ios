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

    // MARK: Public Setup

    public static var brandStyle: BrandStyle = .movistar {
        didSet {
            configureColorPalette(for: brandStyle)
            MisticaAppearance.configure()
        }
    }

    public static var themeVariant: ThemeVariant = .standard {
        didSet {
            MisticaAppearance.configure()
            NotificationCenter.default.post(name: .themeVariantDidChange, object: nil)
        }
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
