//
//  MisticaConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum MisticaConfig {
    static var currentColorPalette: ColorPalette = MovistarColorPalette()
    static var currentAppColorPalette: AppColorPalette = MovistarAppColorPalette()
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

private extension MisticaConfig {
    static func configureColorPalette(for _: BrandStyle) {
        switch brandStyle {
        case .movistar:
            currentColorPalette = MovistarColorPalette()
            currentAppColorPalette = MovistarAppColorPalette()
        case .vivo:
            currentColorPalette = VivoColorPalette()
            currentAppColorPalette = VivoAppColorPalette()
        case .o2:
            currentColorPalette = O2ColorPalette()
            currentAppColorPalette = O2AppColorPalette()
        case .o2Classic:
            currentColorPalette = O2ClassicColorPalette()
            currentAppColorPalette = O2ClassicAppColorPalette()
        }
    }
}
