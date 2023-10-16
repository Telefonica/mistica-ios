//
//  VivoNewColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct VivoNewColors: MisticaColors {
    static let palette = VivoNewColorPalette()

    let background = VivoNewColors.palette.white | VivoNewColors.palette.darkModeBlack
    let backgroundAlternative = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeBlack
    let backgroundBrand = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack
    let backgroundBrandSecondary = VivoNewColors.palette.vivoPurpleLight90 | VivoNewColors.palette.darkModeBlack
    let backgroundContainer = VivoNewColors.palette.white | VivoNewColors.palette.darkModeGrey
    let backgroundContainerHover = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.03) | VivoNewColors.palette.white.withAlphaComponent(0.03)
    let backgroundContainerPressed = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.05) | VivoNewColors.palette.white.withAlphaComponent(0.05)
    let backgroundContainerBrand = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeGrey
    let backgroundContainerBrandHover = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.2) | VivoNewColors.palette.white.withAlphaComponent(0.03)
    let backgroundContainerBrandPressed = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.4) | VivoNewColors.palette.white.withAlphaComponent(0.05)
    let backgroundContainerBrandOverInverse = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.darkModeGrey
    let backgroundContainerAlternative = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeGrey
    let backgroundOverlay = VivoNewColors.palette.grey6.withAlphaComponent(0.6) | VivoNewColors.palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = VivoNewColors.palette.grey2 | VivoNewColors.palette.darkModeGrey6
    let backgroundSkeletonInverse = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.darkModeGrey6
    let backgroundFeedbackBottom = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack
    let appBarBackground = VivoNewColors.palette.white | VivoNewColors.palette.darkModeGrey
    let navigationBarBackground = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack
    let skeletonWave = VivoNewColors.palette.grey2 | VivoNewColors.palette.grey5
    let borderLow = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeBlack
    let border = VivoNewColors.palette.grey3 | VivoNewColors.palette.darkModeGrey
    let borderHigh = VivoNewColors.palette.grey5
    let borderSelected = VivoNewColors.palette.vivoPurple
    let coverBackgroundHover = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.25)
    let coverBackgroundPressed = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.35)
    let buttonDangerBackground = VivoNewColors.palette.pepper
    let buttonDangerBackgroundSelected = VivoNewColors.palette.pepperDark
    let buttonDangerBackgroundHover = VivoNewColors.palette.pepperDark
    let buttonLinkBackgroundSelected = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.white.withAlphaComponent(0.08)
    let buttonLinkBackgroundInverseSelected = VivoNewColors.palette.white.withAlphaComponent(0.1) | VivoNewColors.palette.white.withAlphaComponent(0.08)
    let buttonPrimaryBackground = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80
    let buttonPrimaryBackgroundInverse = VivoNewColors.palette.white | VivoNewColors.palette.vivoPurpleLight80
    let buttonPrimaryBackgroundSelected = VivoNewColors.palette.vivoPurpleDark
    let buttonPrimaryBackgroundHover = VivoNewColors.palette.vivoPurpleDark
    let buttonPrimaryBackgroundInverseSelected = VivoNewColors.palette.vivoPurpleLight50 | VivoNewColors.palette.vivoPurpleDark
    let buttonSecondaryBorder = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.white
    let buttonSecondaryBorderSelected = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.white
    let buttonSecondaryBackgroundHover = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBackgroundSelected = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBorderInverse = VivoNewColors.palette.white
    let buttonSecondaryBorderInverseSelected = VivoNewColors.palette.white
    let buttonSecondaryBackgroundInverseHover = VivoNewColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBackgroundInverseSelected = VivoNewColors.palette.white.withAlphaComponent(0.15)
    let textButtonPrimary = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let textButtonPrimaryInverse = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2
    let textButtonPrimaryInverseSelected = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2
    let textButtonSecondary = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2
    let textButtonSecondarySelected = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.grey2
    let textButtonSecondaryInverse = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let textButtonSecondaryInverseSelected = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let textLink = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight50
    let textLinkInverse = VivoNewColors.palette.white | VivoNewColors.palette.vivoPurpleLight50
    let textLinkDanger = VivoNewColors.palette.pepper
    let textLinkSnackbar = VivoNewColors.palette.vivoPurpleLight20 | VivoNewColors.palette.vivoPurpleLight50
    let control = VivoNewColors.palette.grey3 | VivoNewColors.palette.darkModeGrey6
    let controlActivated = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80
    let controlError = VivoNewColors.palette.pepper
    let loadingBar = VivoNewColors.palette.pink | VivoNewColors.palette.vivoPurpleLight80
    let loadingBarBackground = VivoNewColors.palette.pepperLight30 | VivoNewColors.palette.darkModeGrey6
    let toggleAndroidInactive = VivoNewColors.palette.grey2 | VivoNewColors.palette.grey4
    let toggleAndroidBackgroundActive = VivoNewColors.palette.vivoPurpleLight20 | VivoNewColors.palette.vivoPurpleLight50
    let iosControlKnob = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let divider = VivoNewColors.palette.grey2 | VivoNewColors.palette.white.withAlphaComponent(0.05)
    let dividerInverse = VivoNewColors.palette.white.withAlphaComponent(0.2) | VivoNewColors.palette.white.withAlphaComponent(0.05)
    let navigationBarDivider = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack
    let badge = VivoNewColors.palette.pepperDark
    let feedbackErrorBackground = VivoNewColors.palette.pepper
    let feedbackInfoBackground = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.grey6
    let brand = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80
    let brandHigh = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.white.withAlphaComponent(0.05)
    let inverse = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let neutralHigh = VivoNewColors.palette.grey6 | VivoNewColors.palette.grey2
    let neutralMedium = VivoNewColors.palette.grey5
    let neutralMediumInverse = VivoNewColors.palette.grey5
    let neutralLow = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeGrey6
    let neutralLowAlternative = VivoNewColors.palette.grey2 | VivoNewColors.palette.darkModeGrey6
    let textPrimary = VivoNewColors.palette.grey6 | VivoNewColors.palette.grey2
    let textPrimaryInverse = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let textSecondary = VivoNewColors.palette.grey5 | VivoNewColors.palette.grey4
    let textSecondaryInverse = VivoNewColors.palette.vivoPurpleLight20 | VivoNewColors.palette.grey4
    let success = VivoNewColors.palette.vivoGreen
    let warning = VivoNewColors.palette.orange
    let error = VivoNewColors.palette.pepper
    let promo = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80
    let highlight = VivoNewColors.palette.pink
    let successLow = VivoNewColors.palette.vivoGreenLight10 | VivoNewColors.palette.darkModeGrey6
    let warningLow = VivoNewColors.palette.orangeLight10 | VivoNewColors.palette.darkModeGrey6
    let errorLow = VivoNewColors.palette.pepperLight10 | VivoNewColors.palette.darkModeGrey6
    let promoLow = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6
    let brandLow = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6
    let successHigh = VivoNewColors.palette.vivoGreenDark | VivoNewColors.palette.vivoGreenLight30
    let warningHigh = VivoNewColors.palette.orangeDark | VivoNewColors.palette.orangeLight40
    let errorHigh = VivoNewColors.palette.pepperDark80 | VivoNewColors.palette.pepperLight40
    let promoHigh = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight50
    let successHighInverse = VivoNewColors.palette.vivoGreenDark
    let warningHighInverse = VivoNewColors.palette.orangeDark
    let errorHighInverse = VivoNewColors.palette.pepperDark80
    let promoHighInverse = VivoNewColors.palette.vivoPurple
    let textNavigationBarPrimary = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let textNavigationBarSecondary = VivoNewColors.palette.vivoPurpleLight50 | VivoNewColors.palette.grey4
    let textNavigationSearchBarHint = VivoNewColors.palette.vivoPurpleLight50 | VivoNewColors.palette.grey4
    let textNavigationSearchBarText = VivoNewColors.palette.white | VivoNewColors.palette.grey2
    let textAppBar = VivoNewColors.palette.grey4 | VivoNewColors.palette.grey5
    let textAppBarSelected = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2
    let customTabsBackground = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack
}

public struct VivoNewColorPalette {
    public init() {}
    public let vivoPurple = UIColor(hex: "#660099")!
    public let vivoPurpleDark = UIColor(hex: "#461E5F")!
    public let vivoPurpleLight10 = UIColor(hex: "#EFE5F4")!
    public let vivoPurpleLight20 = UIColor(hex: "#E0CCEB")!
    public let vivoPurpleLight50 = UIColor(hex: "#B280CC")!
    public let vivoPurpleLight80 = UIColor(hex: "#8433AD")!
    public let vivoPurpleLight90 = UIColor(hex: "#751AA3")!
    public let vivoGreen = UIColor(hex: "#99CC33")!
    public let vivoGreenDark = UIColor(hex: "#225C3D")!
    public let vivoGreenLight10 = UIColor(hex: "#EDF8E8")!
    public let vivoGreen25 = UIColor(hex: "#D6EBAD")!
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
