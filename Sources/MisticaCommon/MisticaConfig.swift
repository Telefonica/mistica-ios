//
//  MisticaConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum MisticaConfig: @unchecked Sendable {
    private static let concurrentQueue = DispatchQueue(label: "com.misticaConfig.queue")

    nonisolated(unsafe) private static var _currentColors: MisticaColors = MovistarColors()
    nonisolated(unsafe) private static var _currentBrandAssets: MisticaBrandAssets = DefaultMisticaBrandAssets()
    nonisolated(unsafe) private static var _currentStyledControls = [MisticaControlStyle]()
    nonisolated(unsafe) private static var _currentFontWeights: MisticaFontWeights = MovistarFontWeights()
    nonisolated(unsafe) private static var _currentCornerRadius: MisticaCornerRadius = MovistarCornerRadius()
    nonisolated(unsafe) private static var _currentFontSizes: MisticaFontSizes = MovistarFontSizes()

    public static var currentColors: MisticaColors {
        get {
            concurrentQueue.sync { _currentColors }
        }
        set {
            concurrentQueue.async { _currentColors = newValue }
        }
    }

    public static var currentBrandAssets: MisticaBrandAssets {
        get {
            concurrentQueue.sync { _currentBrandAssets }
        }
        set {
            concurrentQueue.async { _currentBrandAssets = newValue }
        }
    }

    public static var currentStyledControls: [MisticaControlStyle] {
        get {
            concurrentQueue.sync { _currentStyledControls }
        }
        set {
            concurrentQueue.async { _currentStyledControls = newValue }
        }
    }

    public static var currentFontWeights: MisticaFontWeights {
        get {
            concurrentQueue.sync { _currentFontWeights }
        }
        set {
            concurrentQueue.async { _currentFontWeights = newValue }
        }
    }

    public static var currentCornerRadius: MisticaCornerRadius {
        get {
            concurrentQueue.sync { _currentCornerRadius }
        }
        set {
            concurrentQueue.async { _currentCornerRadius = newValue }
        }
    }

    public static var currentFontSizes: MisticaFontSizes {
        get {
            concurrentQueue.sync { _currentFontSizes }
        }
        set {
            concurrentQueue.async { _currentFontSizes = newValue }
        }
    }

    // MARK: Public Setup

    nonisolated(unsafe) public static var brandStyle: BrandStyle = .movistar {
        didSet {
            configure(for: brandStyle)
            Task { @MainActor in
                MisticaAppearance.setUp(controls: currentStyledControls)
            }
        }
    }

    @MainActor public static func styleControls(_ controls: [MisticaControlStyle]) {
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
        case .o2New:
            currentColors = O2NewColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = O2NewFontWeights()
            currentCornerRadius = O2NewCornerRadius()
            currentFontSizes = O2NewFontSizes()
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
        case .telefonica:
            currentColors = TelefonicaColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = TelefonicaFontWeights()
            currentCornerRadius = TelefonicaCornerRadius()
            currentFontSizes = TelefonicaFontSizes()
        case .tu:
            currentColors = TuColors()
            currentBrandAssets = DefaultMisticaBrandAssets()
            currentFontWeights = TuFontWeights()
            currentCornerRadius = TuCornerRadius()
            currentFontSizes = TuFontSizes()
        case .custom(let colors, let assets, let fontWeights, let cornerRadius, let fontSizes):
            currentColors = colors
            currentBrandAssets = assets
            currentFontWeights = fontWeights
            currentCornerRadius = cornerRadius
            currentFontSizes = fontSizes
        }
    }
}
