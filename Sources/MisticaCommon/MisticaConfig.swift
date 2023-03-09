//
//  MisticaConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum MisticaConfig {
    public private(set) static var currentColors: MisticaColors = MovistarColors()
    public private(set) static var currentBrandAssets: MisticaBrandAssets = DefaultMisticaBrandAssets()
    public private(set) static var currentStyledControls = [MisticaControlStyle]()

    // MARK: Public Setup

    public static var brandStyle: BrandStyle = .movistar {
        didSet {
            configureColorPalette(for: brandStyle)
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
            currentColors = MovistarColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
        case .vivo:
            currentColors = VivoColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
        case .o2:
            currentColors = O2Colors()
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
