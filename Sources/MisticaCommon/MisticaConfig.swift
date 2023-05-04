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
    public private(set) static var currentFontWeights: MisticaFontWeights = MovistarFontWeights()

    // MARK: Public Setup

    public static var brandStyle: BrandStyle = .movistar {
        didSet {
            configure(for: brandStyle)
            MisticaAppearance.setUp(controls: currentStyledControls)
        }
    }

    public static func styleControls(_ controls: [MisticaControlStyle]) {
        currentStyledControls = controls
        MisticaAppearance.setUp(controls: controls)
    }
}

private extension MisticaConfig {
    static func configure(for _: BrandStyle) {
        switch brandStyle {
        case .movistar:
            currentColors = MovistarColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = MovistarFontWeights()
        case .vivo:
            currentColors = VivoColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = VivoFontWeights()
        case .o2:
            currentColors = O2Colors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = O2FontWeights()
        case .blau:
            currentColors = BlauColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = BlauFontWeights()
        case .custom(let colors, let assets, let fontWeights):
            currentColors = colors
            currentBrandAssets = assets
            currentFontWeights = fontWeights
        }
    }
}
