//
//  MisticaConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum MisticaConfig {
    static var currentColors: Colors = MovistarColors()
    static var currentStyledControls = [MisticaControlStyle]()

    // MARK: Public Setup

    public static var brandStyle: BrandStyle = .movistar {
        didSet {
            configureColorPalette(for: brandStyle)
        }
    }

    public static var themeVariant: ThemeVariant = .standard {
        didSet {
            MisticaAppearance.setUp(controls: currentStyledControls)
            NotificationCenter.default.post(.themeVariantDidChange)
        }
    }

    public static func styleControls(_ controls: [MisticaControlStyle]) {
        currentStyledControls = controls
        MisticaAppearance.setUp(controls: controls)
    }
}

private extension MisticaConfig {
    static func configureColorPalette(for _: BrandStyle) {
        switch brandStyle {
        case .movistar:
            currentColors = MovistarColors()
        case .vivo:
            currentColors = VivoColors()
        case .o2:
            currentColors = O2Colors()
        case .o2Classic:
            currentColors = O2ClassicColors()
        case .blau:
            currentColors = BlauColors()
        }
    }
}
