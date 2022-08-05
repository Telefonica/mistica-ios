//
//  MisticaConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum MisticaConfig {
    static var currentColors: MisticaColors = MovistarColors()
    static var currentBrandAssets: MisticaBrandAssets = DefaultMisticaBrandAssets()
    static var currentStyledControls = [MisticaControlStyle]()

    // MARK: Public Setup

    public static var brandStyle: BrandStyle = .movistar {
        didSet {
            configureColorPalette(for: brandStyle)
            MisticaAppearance.setUp(controls: currentStyledControls)
        }
    }

    public static var themeVariant: ThemeVariant = .standard {
        didSet {
            MisticaAppearance.setUp(controls: currentStyledControls)
            NotificationCenter.default.post(name: .themeVariantDidChange, object: nil)
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
            currentBrandAssets = DefaultMisticaBrandAssets()
        case .vivo:
            currentColors = VivoColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
        case .o2:
            currentColors = O2Colors()
            currentBrandAssets = DefaultMisticaBrandAssets()
        case .o2Classic:
            currentColors = O2ClassicColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
        case .blau:
            currentColors = BlauColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
        case .custom(let colors, let assets):
            currentColors = colors
            currentBrandAssets = assets
        }
    }
}
