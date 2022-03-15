//
//  O2ClassicColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2ClassicColors: Colors {
    // BACKGROUNDS
    let appBarBackground = O2ClassicColorPalette.white | O2ClassicColorPalette.darkModeGrey
    let background = O2ClassicColorPalette.white | O2ClassicColorPalette.darkModeBlack
    let backgroundContainer = O2ClassicColorPalette.white | O2ClassicColorPalette.darkModeGrey
    let backgroundBrand = O2ClassicColorPalette.o2Blue | O2ClassicColorPalette.darkModeBlack
    let backgroundOverlay = O2ClassicColorPalette.grey6 | O2ClassicColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = O2ClassicColorPalette.grey1 | O2ClassicColorPalette.darkModeGrey6
    let backgroundSkeletonInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.darkModeGrey6
    let navigationBarBackground = O2ClassicColorPalette.o2Blue | O2ClassicColorPalette.darkModeBlack
    let backgroundAlternative = O2ClassicColorPalette.grey1 | O2ClassicColorPalette.darkModeGrey
    let backgroundFeedbackBottom = O2ClassicColorPalette.o2GradientFourth | O2ClassicColorPalette.darkModeBlack
    let skeletonWave = O2ClassicColorPalette.grey2 | O2ClassicColorPalette.grey5

    // BORDERS
    let borderLight = O2ClassicColorPalette.grey1 | O2ClassicColorPalette.darkModeBlack
    let border = O2ClassicColorPalette.grey3 | O2ClassicColorPalette.darkModeGrey
    let borderDark = O2ClassicColorPalette.grey5 | O2ClassicColorPalette.grey5
    let borderSelected = O2ClassicColorPalette.o2Gem | O2ClassicColorPalette.o2SkyBlue

    // BUTTONS
    let buttonDangerBackground = O2ClassicColorPalette.pepper
    let buttonDangerBackgroundDisabled = O2ClassicColorPalette.pepper20 | O2ClassicColorPalette.darkModeGrey
    let buttonDangerBackgroundSelected = O2ClassicColorPalette.pepper55
    let buttonDangerBackgroundHover = O2ClassicColorPalette.pepper55

    let buttonLinkBackgroundSelected = O2ClassicColorPalette.o2SkyBlueLight10 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    let buttonLinkBackgroundSelectedInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.white.withAlphaComponent(0.05)

    let buttonPrimaryBackground = O2ClassicColorPalette.o2SkyBlue
    let buttonPrimaryBackgroundDisabled = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.darkModeGrey
    let buttonPrimaryBackgroundDisabledInverse = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.darkModeGrey
    let buttonPrimaryBackgroundInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.o2SkyBlue
    let buttonPrimaryBackgroundSelected = O2ClassicColorPalette.o2SkyBlue55
    let buttonPrimaryBackgroundHover = O2ClassicColorPalette.o2SkyBlue55
    let buttonPrimaryBackgroundSelectedInverse = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.o2SkyBlue55

    let buttonSecondaryBackground = O2ClassicColorPalette.o2SkyBlue
    let buttonSecondaryBackgroundDisabled = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.darkModeGrey
    let buttonSecondaryBackgroundSelected = O2ClassicColorPalette.o2SkyBlue55
    let buttonSecondaryBorderDisabledInverse = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.darkModeGrey
    let buttonSecondaryBorderInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.o2SkyBlue
    let buttonSecondaryBorderSelectedInverse = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.o2SkyBlue55

    let textButtonPrimary = O2ClassicColorPalette.white | O2ClassicColorPalette.grey2
    let textButtonPrimaryDisabled = O2ClassicColorPalette.white | O2ClassicColorPalette.grey5
    let textButtonPrimaryInverse = O2ClassicColorPalette.o2SkyBlue | O2ClassicColorPalette.grey2
    let textButtonPrimaryInverseDisabled = O2ClassicColorPalette.o2SkyBlueLight20 | O2ClassicColorPalette.grey5
    let textButtonPrimaryInverseSelected = O2ClassicColorPalette.o2SkyBlue | O2ClassicColorPalette.grey2

    let textButtonSecondary = O2ClassicColorPalette.o2SkyBlue | O2ClassicColorPalette.grey2
    let textButtonSecondaryDisabled = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.grey5
    let textButtonSecondarySelected = O2ClassicColorPalette.o2SkyBlue55 | O2ClassicColorPalette.grey4
    let textButtonSecondaryInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.grey2
    let textButtonSecondaryInverseDisabled = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.grey5
    let textButtonSecondaryInverseSelected = O2ClassicColorPalette.white | O2ClassicColorPalette.grey4

    let textLink = O2ClassicColorPalette.o2SkyBlue | O2ClassicColorPalette.o2SkyBlueLight
    let textLinkInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.o2SkyBlueLight
    let textLinkDanger = O2ClassicColorPalette.pepper
    let textLinkDangerDisabled = O2ClassicColorPalette.pepper20 | O2ClassicColorPalette.grey5
    let textLinkDisabled = O2ClassicColorPalette.o2SkyBlueLight | O2ClassicColorPalette.darkModeGrey6
    let textLinkSnackbar = O2ClassicColorPalette.o2SkyBlueLight | O2ClassicColorPalette.o2SkyBlueLight

    // CONTROLS
    let control = O2ClassicColorPalette.grey3 | O2ClassicColorPalette.darkModeGrey6
    let controlActivated = O2ClassicColorPalette.o2Gem | O2ClassicColorPalette.o2SkyBlue
    let controlError = O2ClassicColorPalette.pepper
    let loadingBar = O2ClassicColorPalette.o2Gem | O2ClassicColorPalette.o2SkyBlue
    let loadingBarBackground = O2ClassicColorPalette.o2GemLight30 | O2ClassicColorPalette.darkModeGrey

    // DIVIDERS
    let divider = O2ClassicColorPalette.grey2 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    let dividerInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    let navigationBarDivider = O2ClassicColorPalette.o2Blue | O2ClassicColorPalette.darkModeBlack

    // FEEDBACKS
    let badge = O2ClassicColorPalette.pepper55
    let feedbackErrorBackground = O2ClassicColorPalette.pepper
    let feedbackInfoBackground = O2ClassicColorPalette.grey6 | O2ClassicColorPalette.darkModeGrey6

    // GLOBAL
    let brand = O2ClassicColorPalette.o2Blue | O2ClassicColorPalette.o2SkyBlue
    let brandDark = O2ClassicColorPalette.o2Blue55 | O2ClassicColorPalette.darkModeGrey6
    let inverse = O2ClassicColorPalette.white | O2ClassicColorPalette.grey2
    let neutralHigh = O2ClassicColorPalette.grey6 | O2ClassicColorPalette.grey2
    let neutralMedium = O2ClassicColorPalette.grey5 | O2ClassicColorPalette.grey5
    let neutralLow = O2ClassicColorPalette.grey3 | O2ClassicColorPalette.darkModeGrey6
    let promo = O2ClassicColorPalette.pink
    let highlight = O2ClassicColorPalette.pink

    let textPrimary = O2ClassicColorPalette.grey6 | O2ClassicColorPalette.grey2
    let textPrimaryInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.grey2
    let textSecondary = O2ClassicColorPalette.grey5 | O2ClassicColorPalette.grey4
    let textSecondaryInverse = O2ClassicColorPalette.white | O2ClassicColorPalette.grey4
    let textDisabled = O2ClassicColorPalette.grey3 | O2ClassicColorPalette.grey5
    let textAmount = O2ClassicColorPalette.o2SkyBlue | O2ClassicColorPalette.o2SkyBlueLight45

    // STATES
    let error = O2ClassicColorPalette.pepper
    let success = O2ClassicColorPalette.o2Green
    let warning = O2ClassicColorPalette.orange

    // BARS TEXTS
    let textNavigationBarPrimary = O2ClassicColorPalette.white | O2ClassicColorPalette.grey2
    let textNavigationBarSecondary = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.grey4
    let textNavigationSearchBarHint = O2ClassicColorPalette.o2SkyBlueLight45 | O2ClassicColorPalette.grey4
    let textNavigationSearchBarText = O2ClassicColorPalette.white | O2ClassicColorPalette.grey2
    let textAppBar = O2ClassicColorPalette.grey4 | O2ClassicColorPalette.grey5
    let textAppBarSelected = O2ClassicColorPalette.o2Blue | O2ClassicColorPalette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [
        O2ClassicColorPalette.o2Blue | O2ClassicColorPalette.darkModeBlack,
        O2ClassicColorPalette.o2GradientSecond | O2ClassicColorPalette.darkModeBlack,
        O2ClassicColorPalette.o2GradientThird | O2ClassicColorPalette.darkModeBlack,
        O2ClassicColorPalette.o2GradientFourth | O2ClassicColorPalette.darkModeBlack
    ]

    // TAGS
    var tagBackgroundSuccess = O2ClassicColorPalette.o2Green10 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundWarning = O2ClassicColorPalette.orange10 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundError = O2ClassicColorPalette.pepper10 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundPromo = O2ClassicColorPalette.pink10 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundActive = O2ClassicColorPalette.o2Blue10 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundInactive = O2ClassicColorPalette.grey1 | O2ClassicColorPalette.white.withAlphaComponent(0.05)
    var textTagSuccess = O2ClassicColorPalette.o2Green75 | O2ClassicColorPalette.o2Green40
    var textTagWarning = O2ClassicColorPalette.orange80 | O2ClassicColorPalette.orange40
    var textTagError = O2ClassicColorPalette.pepper70 | O2ClassicColorPalette.pepper40
    var textTagPromo = O2ClassicColorPalette.pink60 | O2ClassicColorPalette.pink40
    var textTagActive = O2ClassicColorPalette.o2Blue | O2ClassicColorPalette.o2Blue30
    var textTagInactive = O2ClassicColorPalette.grey5 | O2ClassicColorPalette.grey4
}

public enum O2ClassicColorPalette {
    public static let o2Blue = UIColor(hex: "#032B5A")!
    public static let o2Blue10 = UIColor(hex: "#E6EAEE")!
    public static let o2Blue30 = UIColor(hex: "#8195AC")!
    public static let o2Blue45 = UIColor(hex: "#6C8BAF")!
    public static let o2Blue55 = UIColor(hex: "#04264E")!

    public static let o2SkyBlue = UIColor(hex: "#0090D0")!
    public static let o2SkyBlue55 = UIColor(hex: "#057DB2")!

    public static let o2SkyBlueLight = UIColor(hex: "#65B4E4")!
    public static let o2SkyBlueLight10 = UIColor(hex: "#E9F5FB")!
    public static let o2SkyBlueLight20 = UIColor(hex: "#D0E8F6")!
    public static let o2SkyBlueLight45 = UIColor(hex: "#80C7E7")!

    public static let o2DeepSkyBlue = UIColor(hex: "#7FD4FE")!

    public static let o2Gem = UIColor(hex: "#01B7B4")!
    public static let o2GemDark = UIColor(hex: "#099E9B")!
    public static let o2GemLight30 = UIColor(hex: "#99E2E1")!

    public static let o2Yellow = UIColor(hex: "#FFCC00")!

    public static let o2Green = UIColor(hex: "#84B50F")!
    public static let o2Green10 = UIColor(hex: "#F3F8E7")!
    public static let o2Green40 = UIColor(hex: "#A9CB57")!
    public static let o2Green75 = UIColor(hex: "#4D621D")!

    public static let pepper = UIColor(hex: "#FF374A")!
    public static let pepper10 = UIColor(hex: "#FFEBED")!
    public static let pepper20 = UIColor(hex: "#FFC3C8")!
    public static let pepper40 = UIColor(hex: "#FF7380")!
    public static let pepper55 = UIColor(hex: "#D73241")!
    public static let pepper70 = UIColor(hex: "#B22634")!

    public static let orange = UIColor(hex: "#FF7F41")!
    public static let orange10 = UIColor(hex: "#FFF2EC")!
    public static let orange40 = UIColor(hex: "#FFA57A")!
    public static let orange80 = UIColor(hex: "#73391D")!
    public static let coral = UIColor(hex: "#FF706E")!

    public static let pink = UIColor(hex: "#EB3C7D")!
    public static let pink10 = UIColor(hex: "#FDEBF2")!
    public static let pink40 = UIColor(hex: "#F59DBE")!
    public static let pink60 = UIColor(hex: "#BC3064")!

    public static let o2GradientFirst = UIColor(hex: "#102550")!
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

    public static let darkModeBlack = UIColor(hex: "#191919")!
    public static let darkModeGrey = UIColor(hex: "#242424")!
    public static let darkModeGrey6 = UIColor(hex: "#313235")!
}
