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
    public private(set) static var currentCornerRadius: MisticaCornerRadius = MovistarCornerRadius()
    public private(set) static var currentFontSizes: MisticaFontSizes = MovistarFontSizes()

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
            currentCornerRadius = MovistarCornerRadius()
            currentFontSizes = MovistarFontSizes()
        case .vivo:
            currentColors = VivoColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = VivoFontWeights()
            currentCornerRadius = VivoCornerRadius()
            currentFontSizes = VivoFontSizes()
        case .o2:
            currentColors = O2Colors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = O2FontWeights()
            currentCornerRadius = O2CornerRadius()
            currentFontSizes = O2FontSizes()
        case .blau:
            currentColors = BlauColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = BlauFontWeights()
            currentCornerRadius = BlauCornerRadius()
            currentFontSizes = BlauFontSizes()
        case .vivoNew:
            currentColors = VivoNewColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = VivoNewFontWeights()
            currentCornerRadius = VivoNewCornerRadius()
            currentFontSizes = VivoNewFontSizes()
        case .custom(let colors, let assets, let fontWeights, let cornerRadius, let fontSizes):
            currentColors = colors
            currentBrandAssets = assets
            currentFontWeights = fontWeights
            currentCornerRadius = cornerRadius
            currentFontSizes = fontSizes
        }
    }
}
