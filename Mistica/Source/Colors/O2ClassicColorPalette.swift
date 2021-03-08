//
//  O2ClassicColorsColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2ClassicColors: Colors {
    
    // BACKGROUNDS
    let appBarBackground = O2ClassicColorPalette.white
    let background = O2ClassicColorPalette.white
    let backgroundBrand = O2ClassicColorPalette.o2Blue
    let backgroundOverlay = O2ClassicColorPalette.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = O2ClassicColorPalette.grey1
    let backgroundSkeletonInverse = O2ClassicColorPalette.white.withAlphaComponent(0.2)
    let navigationBarBackground = O2ClassicColorPalette.o2Blue
    let navigationSearchBarBackground = O2ClassicColorPalette.o2BlueDark
    let backgroundAlternative = O2ClassicColorPalette.grey1
    let backgroundFeedbackBottom = O2ClassicColorPalette.o2GradientFourth
    let skeletonWave = O2ClassicColorPalette.grey2

    // BORDERS
    let borderLight = O2ClassicColorPalette.grey1
    let border = O2ClassicColorPalette.grey3
    let borderDark = O2ClassicColorPalette.grey5
    let borderSelected = O2ClassicColorPalette.o2Gem
    
    // BUTTONS
    let buttonDangerBackground = O2ClassicColorPalette.pepper
    let buttonDangerBackgroundDisabled = O2ClassicColorPalette.pepperLight30
    let buttonDangerBackgroundSelected = O2ClassicColorPalette.pepperDark
    let buttonLinkBackgroundSelected = O2ClassicColorPalette.o2SkyBlueLight10
    let buttonLinkBackgroundSelectedInverse = O2ClassicColorPalette.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = O2ClassicColorPalette.o2SkyBlue
    let buttonPrimaryBackgroundDisabled = O2ClassicColorPalette.o2SkyBlueLight50
    let buttonPrimaryBackgroundDisabledInverse = O2ClassicColorPalette.o2SkyBlueLight50
    let buttonPrimaryBackgroundInverse = O2ClassicColorPalette.white
    let buttonPrimaryBackgroundSelected = O2ClassicColorPalette.o2SkyBlueDark
    let buttonPrimaryBackgroundSelectedInverse = O2ClassicColorPalette.o2SkyBlueLight50
    let buttonSecondaryBackground = O2ClassicColorPalette.o2SkyBlue
    let buttonSecondaryBackgroundDisabled = O2ClassicColorPalette.o2SkyBlueLight50
    let buttonSecondaryBackgroundSelected = O2ClassicColorPalette.o2SkyBlueDark
    let buttonSecondaryBorderDisabledInverse = O2ClassicColorPalette.o2SkyBlueLight50
    let buttonSecondaryBorderInverse = O2ClassicColorPalette.white
    let buttonSecondaryBorderSelectedInverse = O2ClassicColorPalette.o2SkyBlueLight50
    
    let textButtonPrimary = O2ClassicColorPalette.white
    let textButtonPrimaryInverse = O2ClassicColorPalette.o2SkyBlue
    let textButtonPrimaryInverseDisabled = O2ClassicColorPalette.o2SkyBlueLight30
    let textButtonPrimaryInverseSelected = O2ClassicColorPalette.o2SkyBlue
    let textButtonSecondary = O2ClassicColorPalette.o2SkyBlue
    let textButtonSecondaryDisabled = O2ClassicColorPalette.o2SkyBlueLight50
    let textButtonSecondarySelected = O2ClassicColorPalette.o2SkyBlueDark
    let textButtonSecondaryInverse = O2ClassicColorPalette.white
    let textButtonSecondaryInverseDisabled = O2ClassicColorPalette.o2SkyBlueLight50
    let textButtonSecondaryInverseSelected = O2ClassicColorPalette.white
    let textLink = O2ClassicColorPalette.o2SkyBlue
    let textLinkDanger = O2ClassicColorPalette.pepper
    let textLinkDangerDisabled = O2ClassicColorPalette.pepperLight30
    let textLinkDisabled = O2ClassicColorPalette.o2SkyBlueLight
    let textLinkSnackbar = O2ClassicColorPalette.o2SkyBlueLight
    
    // CONTROLS
    let control = O2ClassicColorPalette.grey3
    let controlActivated = O2ClassicColorPalette.o2Gem
    let controlError = O2ClassicColorPalette.pepper
    let loadingBar = O2ClassicColorPalette.o2Gem
    let loadingBarBackground = O2ClassicColorPalette.o2GemLight30
    let loadingBarBackgroundInverse = O2ClassicColorPalette.o2GemLight30
    let loadingBarInverse = O2ClassicColorPalette.o2Gem
    
    // DIVIDERS
    let divider = O2ClassicColorPalette.grey2
    let dividerInverse = O2ClassicColorPalette.white.withAlphaComponent(0.2)
    let navigationBarDivider = O2ClassicColorPalette.o2Blue
    
    // FEEDBACKS
    let badge = O2ClassicColorPalette.pepperDark
    let feedbackErrorBackground = O2ClassicColorPalette.pepper
    let feedbackInfoBackground = O2ClassicColorPalette.grey6
    
    // GLOBAL
    let brand = O2ClassicColorPalette.o2Blue
    let inverse = O2ClassicColorPalette.white
    let neutralHigh = O2ClassicColorPalette.grey6
    let neutralLow = O2ClassicColorPalette.grey3
    let neutralMedium = O2ClassicColorPalette.grey5
    let promo = O2ClassicColorPalette.pink
    let highlight = O2ClassicColorPalette.pink
    
    let textPrimary = O2ClassicColorPalette.grey6
    let textPrimaryInverse = O2ClassicColorPalette.white
    let textSecondary = O2ClassicColorPalette.grey5
    let textSecondaryInverse = O2ClassicColorPalette.o2SkyBlueLight
    let textDisabled = O2ClassicColorPalette.grey3
    let textAmount = O2ClassicColorPalette.o2SkyBlue

    // STATES
    let error = O2ClassicColorPalette.pepper
    let success = O2ClassicColorPalette.o2Green
    let warning = O2ClassicColorPalette.orange

    // BARS TEXTS
    let textNavigationBarPrimary = O2ClassicColorPalette.white
    let textNavigationBarSecondary = O2ClassicColorPalette.o2BlueLight60
    let textNavigationSearchBarHint = O2ClassicColorPalette.o2BlueLight60
    let textNavigationSearchBarText = O2ClassicColorPalette.white
    let textAppBar = O2ClassicColorPalette.grey4
    let textAppBarSelected = O2ClassicColorPalette.o2Blue
    
    // GRADIENTS
    let backgroundBrandGradient = [
        O2ClassicColorPalette.o2Blue,
        O2ClassicColorPalette.o2GradientSecond,
        O2ClassicColorPalette.o2GradientThird,
        O2ClassicColorPalette.o2GradientFourth
    ]
}

public enum O2ClassicColorPalette {
    public static let o2Blue = UIColor(hex: "#032B5A")!
    public static let o2BlueDark = UIColor(hex: "#04264E")!
    public static let o2BlueLight60 = UIColor(hex: "#6C8BAF")!
    public static let o2SkyBlue = UIColor(hex: "#0090D0")!
    public static let o2SkyBlueDark = UIColor(hex: "#057DB2")!
    public static let o2SkyBlueLight = UIColor(hex: "#65B4E4")!
    public static let o2SkyBlueLight50 = UIColor(hex: "#80C7E7")!
    public static let o2SkyBlueLight30 = UIColor(hex: "#D0E8F6")!
    public static let o2SkyBlueLight10 = UIColor(hex: "#E9F5FB")!
    public static let o2DeepSkyBlue = UIColor(hex: "#7FD4FE")!
    public static let o2Gem = UIColor(hex: "#01B7B4")!
    public static let o2GemDark = UIColor(hex: "#099E9B")!
    public static let o2GemLight30 = UIColor(hex: "#99E2E1")!
    public static let o2Yellow = UIColor(hex: "#FFCC00")!
    public static let o2Green = UIColor(hex: "#84B50F")!
    public static let o2GreenLight = UIColor(hex: "#DAE8B7")!
    public static let pepper = UIColor(hex: "#FF374A")!
    public static let pepperDark = UIColor(hex: "#D73241")!
    public static let pepperLight30 = UIColor(hex: "#FFC3C8")!
    public static let orange = UIColor(hex: "#FF7F41")!
    public static let orangeLight = UIColor(hex: "#FFD6C2")!
    public static let coral = UIColor(hex: "#FF706E")!
    public static let pink = UIColor(hex: "#EB3C7D")!
    public static let o2GradientSecond = UIColor(hex: "#0B4680")!
    public static let o2GradientThird = UIColor(hex: "#0D71AD")!
    public static let o2GradientFourth = UIColor(hex: "#449ED0")!
    public static let grey1 = UIColor(hex: "#F6F6F6")!
    public static let grey2 = UIColor(hex: "#EEEEEE")!
    public static let grey3 = UIColor(hex: "#DDDDDD")!
    public static let grey4 = UIColor(hex: "#999999")!
    public static let grey5 = UIColor(hex: "#757575")!
    public static let grey6 = UIColor(hex: "#000033")!
    public static let white = UIColor(hex: "#FFFFFF")!
}
