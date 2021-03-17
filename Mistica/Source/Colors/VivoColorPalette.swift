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
    let appBarBackground = VivoColorPalette.white
    let background = VivoColorPalette.white
    let backgroundContainer = VivoColorPalette.white
    let backgroundBrand = VivoColorPalette.vivoPurple
    let backgroundOverlay = VivoColorPalette.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = VivoColorPalette.grey1
    let backgroundSkeletonInverse = VivoColorPalette.white.withAlphaComponent(0.2)
    let navigationBarBackground = VivoColorPalette.vivoPurple
    let backgroundAlternative = VivoColorPalette.grey1
    let backgroundFeedbackBottom = VivoColorPalette.vivoPurple
    let skeletonWave = VivoColorPalette.grey2

    // BORDERS
    let borderLight = VivoColorPalette.grey1
    let border = VivoColorPalette.grey3
    let borderDark = VivoColorPalette.grey5
    let borderSelected = VivoColorPalette.vivoPurple

    // BUTTONS
    let buttonDangerBackground = VivoColorPalette.pepper
    let buttonDangerBackgroundDisabled = VivoColorPalette.pepperLight30
    let buttonDangerBackgroundSelected = VivoColorPalette.pepperDark
    let buttonLinkBackgroundSelected = VivoColorPalette.vivoPurpleLight10
    let buttonLinkBackgroundSelectedInverse = VivoColorPalette.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = VivoColorPalette.vivoPurple
    let buttonPrimaryBackgroundDisabled = VivoColorPalette.vivoPurpleLight20
    let buttonPrimaryBackgroundDisabledInverse = VivoColorPalette.vivoPurpleLight50
    let buttonPrimaryBackgroundInverse = VivoColorPalette.white
    let buttonPrimaryBackgroundSelected = VivoColorPalette.vivoPurpleDark
    let buttonPrimaryBackgroundSelectedInverse = VivoColorPalette.vivoPurpleLight50
    let buttonSecondaryBackground = VivoColorPalette.vivoPurple
    let buttonSecondaryBackgroundDisabled = VivoColorPalette.vivoPurpleLight20
    let buttonSecondaryBackgroundSelected = VivoColorPalette.vivoPurpleDark
    let buttonSecondaryBorderDisabledInverse = VivoColorPalette.vivoPurpleLight50
    let buttonSecondaryBorderInverse = VivoColorPalette.white
    let buttonSecondaryBorderSelectedInverse = VivoColorPalette.vivoPurpleLight50

    let textButtonPrimary = VivoColorPalette.white
    let textButtonPrimaryInverse = VivoColorPalette.vivoPurple
    let textButtonPrimaryInverseDisabled = VivoColorPalette.vivoPurpleLight20
    let textButtonPrimaryInverseSelected = VivoColorPalette.vivoPurple
    let textButtonSecondary = VivoColorPalette.vivoPurple
    let textButtonSecondaryDisabled = VivoColorPalette.vivoPurpleLight20
    let textButtonSecondarySelected = VivoColorPalette.vivoPurpleDark
    let textButtonSecondaryInverse = VivoColorPalette.white
    let textButtonSecondaryInverseDisabled = VivoColorPalette.vivoPurpleLight50
    let textButtonSecondaryInverseSelected = VivoColorPalette.white
    let textLink = VivoColorPalette.vivoPurple
    let textLinkDanger = VivoColorPalette.pepper
    let textLinkDangerDisabled = VivoColorPalette.pepperLight30
    let textLinkDisabled = VivoColorPalette.vivoPurpleLight50
    let textLinkSnackbar = VivoColorPalette.vivoPurpleLight50

    // CONTROLS
    let control = VivoColorPalette.grey3
    let controlActivated = VivoColorPalette.vivoPurple
    let controlError = VivoColorPalette.pepper
    let loadingBar = VivoColorPalette.pink
    let loadingBarBackground = VivoColorPalette.pepperLight30
    let loadingBarBackgroundInverse = VivoColorPalette.vivoPurpleLight50
    let loadingBarInverse = VivoColorPalette.vivoPurple

    // DIVIDERS
    let divider = VivoColorPalette.grey2
    let dividerInverse = VivoColorPalette.white.withAlphaComponent(0.2)
    let navigationBarDivider = VivoColorPalette.vivoPurple

    // FEEDBACKS
    let badge = VivoColorPalette.pepperDark
    let feedbackErrorBackground = VivoColorPalette.pepper
    let feedbackInfoBackground = VivoColorPalette.grey6

    // GLOBAL
    let brand = VivoColorPalette.vivoPurple
    let brandDark = VivoColorPalette.vivoPurpleDark
    let inverse = VivoColorPalette.white
    let neutralHigh = VivoColorPalette.grey6
    let neutralLow = VivoColorPalette.grey3
    let neutralMedium = VivoColorPalette.grey5
    let promo = VivoColorPalette.vivoPurple
    let highlight = VivoColorPalette.pink

    let textPrimary = VivoColorPalette.grey6
    let textPrimaryInverse = VivoColorPalette.white
    let textSecondary = VivoColorPalette.grey5
    let textSecondaryInverse = VivoColorPalette.white
    let textDisabled = VivoColorPalette.grey3
    let textAmount = VivoColorPalette.vivoPurple

    // STATES
    let error = VivoColorPalette.pepper
    let success = VivoColorPalette.vivoGreen
    let warning = VivoColorPalette.orange

    // BARS TEXTS
    let textNavigationBarPrimary = VivoColorPalette.white
    let textNavigationBarSecondary = VivoColorPalette.vivoPurpleLight50
    let textNavigationSearchBarHint = VivoColorPalette.vivoPurpleLight50
    let textNavigationSearchBarText = VivoColorPalette.white
    let textAppBar = VivoColorPalette.grey4
    let textAppBarSelected = VivoColorPalette.vivoPurple

    // GRADIENTS
    let backgroundBrandGradient = [
        VivoColorPalette.vivoPurple,
        VivoColorPalette.vivoPurple,
        VivoColorPalette.vivoPurple,
        VivoColorPalette.vivoPurple
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
}
