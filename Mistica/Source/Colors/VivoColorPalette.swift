//
//  VivoColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct VivoColors: Colors {
    // BACKGROUNDS
    let appBarBackground = VivoColorPalette.white | VivoColorPalette.darkModeGrey
    let background = VivoColorPalette.white | VivoColorPalette.darkModeBlack
    let backgroundContainer = VivoColorPalette.white | VivoColorPalette.darkModeGrey
    let backgroundBrand = VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack
    let backgroundOverlay = VivoColorPalette.grey6.withAlphaComponent(0.6) | VivoColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = VivoColorPalette.grey1 | VivoColorPalette.darkModeGrey6
    let backgroundSkeletonInverse = VivoColorPalette.white.withAlphaComponent(0.2) | VivoColorPalette.darkModeGrey6
    let navigationBarBackground = VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack
    let backgroundAlternative = VivoColorPalette.grey1 | VivoColorPalette.darkModeGrey
    let backgroundFeedbackBottom = VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack

    let skeletonWave = VivoColorPalette.grey2 | VivoColorPalette.grey5

    // BORDERS
    let borderLight = VivoColorPalette.grey1 | VivoColorPalette.darkModeBlack
    let border = VivoColorPalette.grey3 | VivoColorPalette.darkModeGrey
    let borderDark = VivoColorPalette.grey5 | VivoColorPalette.grey5
    let borderSelected = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight80

    // BUTTONS
    let buttonDangerBackground = VivoColorPalette.pepper
    let buttonDangerBackgroundDisabled = VivoColorPalette.pepperLight30 | VivoColorPalette.darkModeGrey
    let buttonDangerBackgroundSelected = VivoColorPalette.pepperDark
    let buttonDangerBackgroundHover = VivoColorPalette.pepperDark

    let buttonLinkBackgroundSelected = VivoColorPalette.vivoPurpleLight10 | VivoColorPalette.darkModeGrey
    let buttonLinkBackgroundSelectedInverse = VivoColorPalette.white.withAlphaComponent(0.2) | VivoColorPalette.darkModeGrey

    let buttonPrimaryBackground = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight80
    let buttonPrimaryBackgroundDisabled = VivoColorPalette.vivoPurpleLight20 | VivoColorPalette.darkModeGrey
    let buttonPrimaryBackgroundDisabledInverse = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.darkModeGrey
    let buttonPrimaryBackgroundInverse = VivoColorPalette.white | VivoColorPalette.vivoPurpleLight80
    let buttonPrimaryBackgroundSelected = VivoColorPalette.vivoPurpleDark | VivoColorPalette.vivoPurpleDark
    let buttonPrimaryBackgroundHover = VivoColorPalette.vivoPurpleDark | VivoColorPalette.vivoPurpleDark
    let buttonPrimaryBackgroundSelectedInverse = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.vivoPurpleDark

    let buttonSecondaryBackground = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight80
    let buttonSecondaryBackgroundDisabled = VivoColorPalette.vivoPurpleLight20 | VivoColorPalette.darkModeGrey
    let buttonSecondaryBackgroundSelected = VivoColorPalette.vivoPurpleDark | VivoColorPalette.vivoPurpleDark
    let buttonSecondaryBorderDisabledInverse = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.darkModeGrey
    let buttonSecondaryBorderInverse = VivoColorPalette.white | VivoColorPalette.vivoPurpleLight80
    let buttonSecondaryBorderSelectedInverse = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.vivoPurpleDark

    let textButtonPrimary = VivoColorPalette.white | VivoColorPalette.grey2
    let textButtonPrimaryDisabled = VivoColorPalette.white | VivoColorPalette.grey5
    let textButtonPrimaryInverse = VivoColorPalette.vivoPurple | VivoColorPalette.grey2
    let textButtonPrimaryInverseDisabled = VivoColorPalette.vivoPurpleLight20 | VivoColorPalette.grey5
    let textButtonPrimaryInverseSelected = VivoColorPalette.vivoPurple | VivoColorPalette.grey2

    let textButtonSecondary = VivoColorPalette.vivoPurple | VivoColorPalette.grey2
    let textButtonSecondaryDisabled = VivoColorPalette.vivoPurpleLight20 | VivoColorPalette.grey5
    let textButtonSecondarySelected = VivoColorPalette.vivoPurpleDark | VivoColorPalette.grey4
    let textButtonSecondaryInverse = VivoColorPalette.white | VivoColorPalette.grey2
    let textButtonSecondaryInverseDisabled = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.grey5
    let textButtonSecondaryInverseSelected = VivoColorPalette.white | VivoColorPalette.grey4

    let textLink = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight50
    let textLinkDanger = VivoColorPalette.pepper
    let textLinkDangerDisabled = VivoColorPalette.pepperLight30
    let textLinkDisabled = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.grey5
    let textLinkSnackbar = VivoColorPalette.vivoPurpleLight50

    // CONTROLS
    let control = VivoColorPalette.grey3 | VivoColorPalette.grey5
    let controlActivated = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight80
    let controlError = VivoColorPalette.pepper
    let loadingBar = VivoColorPalette.pink | VivoColorPalette.vivoPurpleLight80
    let loadingBarBackground = VivoColorPalette.pepperLight30 | VivoColorPalette.darkModeGrey6
    let loadingBarBackgroundInverse = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.grey1
    let loadingBarInverse = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight80

    // DIVIDERS
    let divider = VivoColorPalette.grey2 | VivoColorPalette.darkModeGrey6
    let dividerInverse = VivoColorPalette.white.withAlphaComponent(0.2) | VivoColorPalette.darkModeGrey6
    let navigationBarDivider = VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack

    // FEEDBACKS
    let badge = VivoColorPalette.pepperDark
    let feedbackErrorBackground = VivoColorPalette.pepper
    let feedbackInfoBackground = VivoColorPalette.grey6 | VivoColorPalette.darkModeGrey6

    // GLOBAL
    let brand = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight80
    let brandDark = VivoColorPalette.vivoPurpleDark | VivoColorPalette.darkModeGrey6
    let inverse = VivoColorPalette.white | VivoColorPalette.grey2
    let neutralHigh = VivoColorPalette.grey6 | VivoColorPalette.grey4
    let neutralMedium = VivoColorPalette.grey5 | VivoColorPalette.grey5
    let neutralLow = VivoColorPalette.grey3 | VivoColorPalette.darkModeGrey6
    let promo = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight80
    let highlight = VivoColorPalette.pink

    let textPrimary = VivoColorPalette.grey6 | VivoColorPalette.grey2
    let textPrimaryInverse = VivoColorPalette.white | VivoColorPalette.grey2
    let textSecondary = VivoColorPalette.grey5 | VivoColorPalette.grey4
    let textSecondaryInverse = VivoColorPalette.white | VivoColorPalette.grey4
    let textDisabled = VivoColorPalette.grey3 | VivoColorPalette.grey5
    let textAmount = VivoColorPalette.vivoPurple | VivoColorPalette.vivoPurpleLight50

    // STATES
    let error = VivoColorPalette.pepper
    let success = VivoColorPalette.vivoGreen
    let warning = VivoColorPalette.orange

    // BARS TEXTS
    let textNavigationBarPrimary = VivoColorPalette.white | VivoColorPalette.grey2
    let textNavigationBarSecondary = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.grey4
    let textNavigationSearchBarHint = VivoColorPalette.vivoPurpleLight50 | VivoColorPalette.grey4
    let textNavigationSearchBarText = VivoColorPalette.white | VivoColorPalette.grey2
    let textAppBar = VivoColorPalette.grey4 | VivoColorPalette.grey5
    let textAppBarSelected = VivoColorPalette.vivoPurple | VivoColorPalette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [
        VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack,
        VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack,
        VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack,
        VivoColorPalette.vivoPurple | VivoColorPalette.darkModeBlack
    ]
}

public enum VivoColorPalette {
    public static let vivoPurple = UIColor(hex: "#660099")!
    public static let vivoPurpleDark = UIColor(hex: "#461E5F")!
    public static let vivoPurpleLight90 = UIColor(hex: "#751AA3")!
    public static let vivoPurpleLight80 = UIColor(hex: "#8433AD")!
    public static let vivoPurpleLight50 = UIColor(hex: "#B280CC")!
    public static let vivoPurpleLight20 = UIColor(hex: "#E0CCEB")!
    public static let vivoPurpleLight10 = UIColor(hex: "#EFE5F4")!
    public static let vivoGreen = UIColor(hex: "#99CC33")!
    public static let vivoGreenDark = UIColor(hex: "#33A14A")!
    public static let vivoGreenLight40 = UIColor(hex: "#D6EAAD")!
    public static let vivoBlue = UIColor(hex: "#00ABDB")!
    public static let orange = UIColor(hex: "#FF9900")!
    public static let orangeDark = UIColor(hex: "#FA6324")!
    public static let orangeLight = UIColor(hex: "#FFD699")!
    public static let pink = UIColor(hex: "#EB3D7D")!
    public static let pepper = UIColor(hex: "#CC1F59")!
    public static let pepperDark = UIColor(hex: "#B71D63")!
    public static let pepperLight30 = UIColor(hex: "#F7B1CB")!
    public static let grey1 = UIColor(hex: "#F6F6F6")!
    public static let grey2 = UIColor(hex: "#EEEEEE")!
    public static let grey3 = UIColor(hex: "#DDDDDD")!
    public static let grey4 = UIColor(hex: "#999999")!
    public static let grey5 = UIColor(hex: "#666666")!
    public static let grey6 = UIColor(hex: "#000000")!
    public static let white = UIColor(hex: "#FFFFFF")!

    public static let darkModeBlack = UIColor(hex: "#191919")!
    public static let darkModeGrey = UIColor(hex: "#242424")!
    public static let darkModeGrey6 = UIColor(hex: "#313235")!
}
