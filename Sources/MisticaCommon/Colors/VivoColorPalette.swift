//
//  VivoColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct VivoColors: MisticaColors {
    static let palette = VivoColorPalette()

    // BACKGROUNDS
    let appBarBackground = palette.white | palette.darkModeGrey
    let background = palette.white | palette.darkModeBlack
    let backgroundContainer = palette.white | palette.darkModeGrey
    let backgroundBrand = palette.vivoPurple | palette.darkModeBlack
    let backgroundOverlay = palette.grey6.withAlphaComponent(0.6) | palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = palette.grey2 | palette.darkModeGrey6
    let backgroundSkeletonInverse = palette.white.withAlphaComponent(0.2) | palette.darkModeGrey6
    let navigationBarBackground = palette.vivoPurple | palette.darkModeBlack
    let backgroundAlternative = palette.grey1 | palette.darkModeGrey
    let backgroundFeedbackBottom = palette.vivoPurple | palette.darkModeBlack
    let skeletonWave = palette.grey2 | palette.grey5

    // BORDERS
    let borderLow = palette.grey1 | palette.darkModeBlack
    let border = palette.grey3 | palette.darkModeGrey
    let borderHigh = palette.grey5
    let borderSelected = palette.vivoPurple

    // BUTTONS
    let buttonDangerBackground = palette.pepper
    let buttonDangerBackgroundSelected = palette.pepperDark
    let buttonDangerBackgroundHover = palette.pepperDark

    let buttonLinkBackgroundSelected = palette.vivoPurpleLight10 | palette.white.withAlphaComponent(0.05)
    let buttonLinkBackgroundInverseSelected = palette.white.withAlphaComponent(0.2) | palette.white.withAlphaComponent(0.05)

    let buttonPrimaryBackground = palette.vivoPurple | palette.vivoPurpleLight80
    let buttonPrimaryBackgroundInverse = palette.white | palette.vivoPurpleLight80
    let buttonPrimaryBackgroundSelected = palette.vivoPurpleDark
    let buttonPrimaryBackgroundHover = palette.vivoPurpleDark
    let buttonPrimaryBackgroundInverseSelected = palette.vivoPurpleLight50 | palette.vivoPurpleDark

    let buttonSecondaryBorder = palette.vivoPurple | palette.vivoPurpleLight80
    let buttonSecondaryBackgroundSelected = palette.vivoPurpleDark
    let buttonSecondaryBorderInverse = palette.white | palette.vivoPurpleLight80
    let buttonSecondaryBorderInverseSelected = palette.vivoPurpleLight50 | palette.vivoPurpleDark

    let textButtonPrimary = palette.white | palette.grey2
    let textButtonPrimaryInverse = palette.vivoPurple | palette.grey2
    let textButtonPrimaryInverseSelected = palette.vivoPurple | palette.grey2

    let textButtonSecondary = palette.vivoPurple | palette.grey2
    let textButtonSecondarySelected = palette.vivoPurpleDark | palette.grey4
    let textButtonSecondaryInverse = palette.white | palette.grey2
    let textButtonSecondaryInverseSelected = palette.white | palette.grey4

    let textLink = palette.vivoPurple | palette.vivoPurpleLight50
    let textLinkInverse = palette.white | palette.vivoPurpleLight50
    let textLinkDanger = palette.pepper
    let textLinkSnackbar = palette.vivoPurpleLight50

    // CONTROLS
    let control = palette.grey3 | palette.darkModeGrey6
    let controlActivated = palette.vivoPurple | palette.vivoPurpleLight80
    let controlError = palette.pepper
    let loadingBar = palette.pink | palette.vivoPurpleLight80
    let loadingBarBackground = palette.pepperLight30 | palette.darkModeGrey6

    // DIVIDERS
    let divider = palette.grey2 | palette.white.withAlphaComponent(0.05)
    let dividerInverse = palette.white | palette.white.withAlphaComponent(0.05)
    let navigationBarDivider = palette.vivoPurple | palette.darkModeBlack

    // FEEDBACKS
    let badge = palette.pepperDark
    let feedbackErrorBackground = palette.pepper
    let feedbackInfoBackground = palette.grey6

    // GLOBAL
    let brand = palette.vivoPurple | palette.vivoPurpleLight80
    let brandHigh = palette.vivoPurpleDark | palette.white.withAlphaComponent(0.05)
    let inverse = palette.white | palette.grey2
    let neutralHigh = palette.grey6 | palette.grey2
    let neutralMedium = palette.grey5
    let neutralLow = palette.grey1 | palette.darkModeGrey6
    let promo = palette.vivoPurple | palette.vivoPurpleLight80
    let highlight = palette.pink

    let textPrimary = palette.grey6 | palette.grey2
    let textPrimaryInverse = palette.white | palette.grey2
    let textSecondary = palette.grey5 | palette.grey4
    let textSecondaryInverse = palette.white | palette.grey4

    // STATES
    let error = palette.pepper
    let success = palette.vivoGreen
    let warning = palette.orange

    // BARS TEXTS
    let textNavigationBarPrimary = palette.white | palette.grey2
    let textNavigationBarSecondary = palette.vivoPurpleLight50 | palette.grey4
    let textNavigationSearchBarHint = palette.vivoPurpleLight50 | palette.grey4
    let textNavigationSearchBarText = palette.white | palette.grey2
    let textAppBar = palette.grey4 | palette.grey5
    let textAppBarSelected = palette.vivoPurple | palette.grey2

    // TAGS
    var successLow = palette.vivoGreenLight10 | palette.white.withAlphaComponent(0.05)
    var warningLow = palette.orangeLight10 | palette.white.withAlphaComponent(0.05)
    var errorLow = palette.pepperLight10 | palette.white.withAlphaComponent(0.05)
    var promoLow = palette.vivoPurpleLight10 | palette.white.withAlphaComponent(0.05)
    var brandLow = palette.vivoPurpleLight10 | palette.white.withAlphaComponent(0.05)
    var successHigh = palette.vivoGreenDark | palette.vivoGreenLight30
    var warningHigh = palette.orangeDark | palette.orangeLight40
    var errorHigh = palette.pepperDark80 | palette.pepperLight40
    var promoHigh = palette.vivoPurple | palette.vivoPurpleLight50
}

public struct VivoColorPalette {
    public init() {}

    public let vivoPurple = UIColor(hex: "#660099")!
    public let vivoPurpleDark = UIColor(hex: "#461E5F")!
    public let vivoPurpleLight10 = UIColor(hex: "#EFE5F4")!
    public let vivoPurpleLight20 = UIColor(hex: "#E0CCEB")!
    public let vivoPurpleLight50 = UIColor(hex: "#B280CC")!
    public let vivoPurpleLight80 = UIColor(hex: "#8433AD")!
    public let vivoPurpleLight90 = UIColor(hex: "#751AA3")!

    public let vivoGreen = UIColor(hex: "#99CC33")!
    public let vivoGreen25 = UIColor(hex: "#D6EBAD")!
    public let vivoGreenDark = UIColor(hex: "#225C3D")!
    public let vivoGreenLight10 = UIColor(hex: "#EDF8E8")!
    public let vivoGreenLight30 = UIColor(hex: "#91AE9E")!

    public let vivoBlue = UIColor(hex: "#00ABDB")!

    public let orange = UIColor(hex: "#FF9900")!
    public let orange25 = UIColor(hex: "#FFD699")!
    public let orangeDark = UIColor(hex: "#972A1D")!
    public let orangeLight10 = UIColor(hex: "#FFEFE1")!
    public let orangeLight40 = UIColor(hex: "#FFB84C")!

    public let pink = UIColor(hex: "#EB3D7D")!

    public let pepper = UIColor(hex: "#CC1F59")!
    public let pepperDark = UIColor(hex: "#B71D63")!
    public let pepperDark80 = UIColor(hex: "#8F2052")!
    public let pepperLight10 = UIColor(hex: "#FCE4EF")!
    public let pepperLight30 = UIColor(hex: "#F7B1CB")!
    public let pepperLight40 = UIColor(hex: "#DB628B")!

    public let grey1 = UIColor(hex: "#F6F6F6")!
    public let grey2 = UIColor(hex: "#EEEEEE")!
    public let grey3 = UIColor(hex: "#DDDDDD")!
    public let grey4 = UIColor(hex: "#999999")!
    public let grey5 = UIColor(hex: "#666666")!
    public let grey6 = UIColor(hex: "#000000")!
    public let white = UIColor(hex: "#FFFFFF")!

    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
}
