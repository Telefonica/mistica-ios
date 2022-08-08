//
//  O2ClassicColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2ClassicColors: MisticaColors {
    static let palette = O2ClassicColorPalette()

    // BACKGROUNDS
    let appBarBackground = palette.white | palette.darkModeGrey
    let background = palette.white | palette.darkModeBlack
    let backgroundContainer = palette.white | palette.darkModeGrey
    let backgroundBrand = palette.o2Blue | palette.darkModeBlack
    let backgroundOverlay = palette.grey6.withAlphaComponent(0.6) | palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = palette.grey1 | palette.darkModeGrey6
    let backgroundSkeletonInverse = palette.white.withAlphaComponent(0.2) | palette.darkModeGrey6
    let navigationBarBackground = palette.o2Blue | palette.darkModeBlack
    let backgroundAlternative = palette.grey1 | palette.darkModeGrey
    let backgroundFeedbackBottom = palette.o2GradientFourth | palette.darkModeBlack
    let skeletonWave = palette.grey2 | palette.grey5

    // BORDERS
    let borderLight = palette.grey1 | palette.darkModeBlack
    let border = palette.grey3 | palette.darkModeGrey
    let borderDark = palette.grey5
    let borderSelected = palette.o2Gem | palette.o2SkyBlue

    // BUTTONS
    let buttonDangerBackground = palette.pepper
    let buttonDangerBackgroundSelected = palette.pepper55
    let buttonDangerBackgroundHover = palette.pepper55

    let buttonLinkBackgroundSelected = palette.o2SkyBlueLight10 | palette.white.withAlphaComponent(0.05)
    let buttonLinkBackgroundSelectedInverse = palette.white.withAlphaComponent(0.2) | palette.white.withAlphaComponent(0.05)

    let buttonPrimaryBackground = palette.o2SkyBlue
    let buttonPrimaryBackgroundInverse = palette.white | palette.o2SkyBlue
    let buttonPrimaryBackgroundSelected = palette.o2SkyBlue55
    let buttonPrimaryBackgroundHover = palette.o2SkyBlue55
    let buttonPrimaryBackgroundSelectedInverse = palette.o2SkyBlueLight45 | palette.o2SkyBlue55

    let buttonSecondaryBackground = palette.o2SkyBlue
    let buttonSecondaryBackgroundSelected = palette.o2SkyBlue55
    let buttonSecondaryBorderInverse = palette.white | palette.o2SkyBlue
    let buttonSecondaryBorderSelectedInverse = palette.o2SkyBlueLight45 | palette.o2SkyBlue55

    let textButtonPrimary = palette.white | palette.grey2
    let textButtonPrimaryInverse = palette.o2SkyBlue | palette.grey2
    let textButtonPrimaryInverseSelected = palette.o2SkyBlue | palette.grey2

    let textButtonSecondary = palette.o2SkyBlue | palette.grey2
    let textButtonSecondarySelected = palette.o2SkyBlue55 | palette.grey4
    let textButtonSecondaryInverse = palette.white | palette.grey2
    let textButtonSecondaryInverseSelected = palette.white | palette.grey4

    let textLink = palette.o2SkyBlue | palette.o2SkyBlueLight
    let textLinkInverse = palette.white | palette.o2SkyBlueLight
    let textLinkDanger = palette.pepper
    let textLinkSnackbar = palette.o2SkyBlueLight

    // CONTROLS
    let control = palette.grey3 | palette.darkModeGrey6
    let controlActivated = palette.o2Gem | palette.o2SkyBlue
    let controlError = palette.pepper
    let loadingBar = palette.o2Gem | palette.o2SkyBlue
    let loadingBarBackground = palette.o2GemLight30 | palette.darkModeGrey6

    // DIVIDERS
    let divider = palette.grey2 | palette.white.withAlphaComponent(0.05)
    let dividerInverse = palette.white.withAlphaComponent(0.2) | palette.white.withAlphaComponent(0.05)
    let navigationBarDivider = palette.o2Blue | palette.darkModeBlack

    // FEEDBACKS
    let badge = palette.pepper55
    let feedbackErrorBackground = palette.pepper
    let feedbackInfoBackground = palette.grey6 | palette.darkModeGrey6

    // GLOBAL
    let brand = palette.o2Blue | palette.o2SkyBlue
    let brandHigh = palette.o2Blue55 | palette.white.withAlphaComponent(0.05)
    let inverse = palette.white | palette.grey2
    let neutralHigh = palette.grey6 | palette.grey2
    let neutralMedium = palette.grey5
    let neutralLow = palette.grey1 | palette.darkModeGrey6
    let promo = palette.pink
    let highlight = palette.pink

    let textPrimary = palette.grey6 | palette.grey2
    let textPrimaryInverse = palette.white | palette.grey2
    let textSecondary = palette.grey5 | palette.grey4
    let textSecondaryInverse = palette.white | palette.grey4

    // STATES
    let error = palette.pepper
    let success = palette.o2Green
    let warning = palette.orange

    // BARS TEXTS
    let textNavigationBarPrimary = palette.white | palette.grey2
    let textNavigationBarSecondary = palette.o2SkyBlueLight45 | palette.grey4
    let textNavigationSearchBarHint = palette.o2SkyBlueLight45 | palette.grey4
    let textNavigationSearchBarText = palette.white | palette.grey2
    let textAppBar = palette.grey4 | palette.grey5
    let textAppBarSelected = palette.o2Blue | palette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [
        palette.o2Blue | palette.darkModeBlack,
        palette.o2GradientSecond | palette.darkModeBlack,
        palette.o2GradientThird | palette.darkModeBlack,
        palette.o2GradientFourth | palette.darkModeBlack
    ]

    // TAGS
    var successLow = palette.o2Green10 | palette.white.withAlphaComponent(0.05)
    var warningLow = palette.orange10 | palette.white.withAlphaComponent(0.05)
    var errorLow = palette.pepper10 | palette.white.withAlphaComponent(0.05)
    var promoLow = palette.pink10 | palette.white.withAlphaComponent(0.05)
    var brandLow = palette.o2Blue10 | palette.white.withAlphaComponent(0.05)
    var successHigh = palette.o2Green75 | palette.o2Green40
    var warningHigh = palette.orange80 | palette.orange40
    var errorHigh = palette.pepper70 | palette.pepper40
    var promoHigh = palette.pink60 | palette.pink40
}

public struct O2ClassicColorPalette {
    public init() { }

    public let o2Blue = UIColor(hex: "#032B5A")!
    public let o2Blue10 = UIColor(hex: "#E6EAEE")!
    public let o2Blue30 = UIColor(hex: "#8195AC")!
    public let o2Blue45 = UIColor(hex: "#6C8BAF")!
    public let o2Blue55 = UIColor(hex: "#04264E")!

    public let o2SkyBlue = UIColor(hex: "#0090D0")!
    public let o2SkyBlue55 = UIColor(hex: "#057DB2")!

    public let o2SkyBlueLight = UIColor(hex: "#65B4E4")!
    public let o2SkyBlueLight10 = UIColor(hex: "#E9F5FB")!
    public let o2SkyBlueLight20 = UIColor(hex: "#D0E8F6")!
    public let o2SkyBlueLight45 = UIColor(hex: "#80C7E7")!

    public let o2DeepSkyBlue = UIColor(hex: "#7FD4FE")!

    public let o2Gem = UIColor(hex: "#01B7B4")!
    public let o2GemDark = UIColor(hex: "#099E9B")!
    public let o2GemLight30 = UIColor(hex: "#99E2E1")!

    public let o2Yellow = UIColor(hex: "#FFCC00")!

    public let o2Green = UIColor(hex: "#84B50F")!
    public let o2Green10 = UIColor(hex: "#F3F8E7")!
    public let o2Green40 = UIColor(hex: "#A9CB57")!
    public let o2Green75 = UIColor(hex: "#4D621D")!

    public let pepper = UIColor(hex: "#FF374A")!
    public let pepper10 = UIColor(hex: "#FFEBED")!
    public let pepper20 = UIColor(hex: "#FFC3C8")!
    public let pepper40 = UIColor(hex: "#FF7380")!
    public let pepper55 = UIColor(hex: "#D73241")!
    public let pepper70 = UIColor(hex: "#B22634")!

    public let orange = UIColor(hex: "#FF7F41")!
    public let orange10 = UIColor(hex: "#FFF2EC")!
    public let orange40 = UIColor(hex: "#FFA57A")!
    public let orange80 = UIColor(hex: "#73391D")!
    public let coral = UIColor(hex: "#FF706E")!

    public let pink = UIColor(hex: "#EB3C7D")!
    public let pink10 = UIColor(hex: "#FDEBF2")!
    public let pink40 = UIColor(hex: "#F59DBE")!
    public let pink60 = UIColor(hex: "#BC3064")!

    public let o2GradientFirst = UIColor(hex: "#102550")!
    public let o2GradientSecond = UIColor(hex: "#0B4680")!
    public let o2GradientThird = UIColor(hex: "#0D71AD")!
    public let o2GradientFourth = UIColor(hex: "#449ED0")!

    public let grey1 = UIColor(hex: "#F6F6F6")!
    public let grey2 = UIColor(hex: "#EEEEEE")!
    public let grey3 = UIColor(hex: "#DDDDDD")!
    public let grey4 = UIColor(hex: "#999999")!
    public let grey5 = UIColor(hex: "#757575")!
    public let grey6 = UIColor(hex: "#000033")!
    public let white = UIColor(hex: "#FFFFFF")!

    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
}
