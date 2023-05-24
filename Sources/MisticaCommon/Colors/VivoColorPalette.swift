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

    let background = VivoColors.palette.white | VivoColors.palette.darkModeBlack
    let backgroundAlternative = VivoColors.palette.grey1 | VivoColors.palette.darkModeBlack
    let backgroundBrand = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack
    let backgroundBrandSecondary = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack
    let backgroundContainer = VivoColors.palette.white | VivoColors.palette.darkModeGrey
    let backgroundContainerHover = VivoColors.palette.grey0 | VivoColors.palette.darkModeGrey7
    let backgroundContainerPressed = VivoColors.palette.grey1 | VivoColors.palette.darkModeGrey8
    let backgroundContainerBrand = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeGrey
    let backgroundContainerBrandHover = VivoColors.palette.vivoPurpleDark50 | VivoColors.palette.darkModeGrey7
    let backgroundContainerBrandPressed = VivoColors.palette.vivoPurpleDark | VivoColors.palette.darkModeGrey8
    let backgroundContainerBrandOverInverse = VivoColors.palette.vivoPurpleDark | VivoColors.palette.darkModeGrey
    let backgroundContainerBrandOverInverseHover = VivoColors.palette.vivoPurpleDark80 | VivoColors.palette.darkModeGrey7
    let backgroundContainerBrandOverInversePressed = VivoColors.palette.vivoPurpleDark90 | VivoColors.palette.darkModeGrey8
    let backgroundContainerAlternative = VivoColors.palette.grey1 | VivoColors.palette.darkModeGrey
    let backgroundContainerAlternativeHover = VivoColors.palette.grey5.withAlphaComponent(0.1) | VivoColors.palette.darkModeGrey7
    let backgroundContainerAlternativePressed = VivoColors.palette.grey5.withAlphaComponent(0.2) | VivoColors.palette.darkModeGrey8
    let backgroundOverlay = VivoColors.palette.grey6.withAlphaComponent(0.6) | VivoColors.palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = VivoColors.palette.grey2 | VivoColors.palette.darkModeGrey6
    let backgroundSkeletonInverse = VivoColors.palette.vivoPurpleDark | VivoColors.palette.darkModeGrey6
    let backgroundFeedbackBottom = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack
    let appBarBackground = VivoColors.palette.white | VivoColors.palette.darkModeGrey
    let navigationBarBackground = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack
    let skeletonWave = VivoColors.palette.grey2 | VivoColors.palette.grey5
    let borderLow = VivoColors.palette.grey1 | VivoColors.palette.darkModeBlack
    let border = VivoColors.palette.grey3 | VivoColors.palette.darkModeGrey
    let borderHigh = VivoColors.palette.grey5
    let borderSelected = VivoColors.palette.vivoPurple
    let buttonDangerBackground = VivoColors.palette.pepper
    let buttonDangerBackgroundSelected = VivoColors.palette.pepperDark
    let buttonDangerBackgroundHover = VivoColors.palette.pepperDark
    let buttonLinkBackgroundSelected = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.white.withAlphaComponent(0.08)
    let buttonLinkBackgroundInverseSelected = VivoColors.palette.white.withAlphaComponent(0.1) | VivoColors.palette.white.withAlphaComponent(0.08)
    let buttonPrimaryBackground = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80
    let buttonPrimaryBackgroundInverse = VivoColors.palette.white | VivoColors.palette.vivoPurpleLight80
    let buttonPrimaryBackgroundSelected = VivoColors.palette.vivoPurpleDark
    let buttonPrimaryBackgroundHover = VivoColors.palette.vivoPurpleDark
    let buttonPrimaryBackgroundInverseSelected = VivoColors.palette.vivoPurpleLight50 | VivoColors.palette.vivoPurpleDark
    let buttonSecondaryBorder = VivoColors.palette.vivoPurple | VivoColors.palette.white
    let buttonSecondaryBorderSelected = VivoColors.palette.vivoPurpleDark | VivoColors.palette.white
    let buttonSecondaryBackgroundHover = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBackgroundSelected = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBorderInverse = VivoColors.palette.white
    let buttonSecondaryBorderInverseSelected = VivoColors.palette.white
    let buttonSecondaryBackgroundInverseHover = VivoColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBackgroundInverseSelected = VivoColors.palette.white.withAlphaComponent(0.15)
    let textButtonPrimary = VivoColors.palette.white | VivoColors.palette.grey2
    let textButtonPrimaryInverse = VivoColors.palette.vivoPurple | VivoColors.palette.grey2
    let textButtonPrimaryInverseSelected = VivoColors.palette.vivoPurple | VivoColors.palette.grey2
    let textButtonSecondary = VivoColors.palette.vivoPurple | VivoColors.palette.grey2
    let textButtonSecondarySelected = VivoColors.palette.vivoPurpleDark | VivoColors.palette.grey2
    let textButtonSecondaryInverse = VivoColors.palette.white | VivoColors.palette.grey2
    let textButtonSecondaryInverseSelected = VivoColors.palette.white | VivoColors.palette.grey2
    let textLink = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight50
    let textLinkInverse = VivoColors.palette.white | VivoColors.palette.vivoPurpleLight50
    let textLinkDanger = VivoColors.palette.pepper
    let textLinkSnackbar = VivoColors.palette.vivoPurpleLight50
    let control = VivoColors.palette.grey3 | VivoColors.palette.darkModeGrey6
    let controlActivated = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80
    let controlError = VivoColors.palette.pepper
    let loadingBar = VivoColors.palette.pink | VivoColors.palette.vivoPurpleLight80
    let loadingBarBackground = VivoColors.palette.pepperLight30 | VivoColors.palette.darkModeGrey6
    let toggleAndroidInactive = VivoColors.palette.grey2 | VivoColors.palette.grey4
    let toggleAndroidBackgroundActive = VivoColors.palette.vivoPurpleLight20 | VivoColors.palette.vivoPurpleLight50
    let iosControlKnob = VivoColors.palette.white | VivoColors.palette.grey2
    let divider = VivoColors.palette.grey2 | VivoColors.palette.white.withAlphaComponent(0.05)
    let dividerInverse = VivoColors.palette.white.withAlphaComponent(0.2) | VivoColors.palette.white.withAlphaComponent(0.05)
    let navigationBarDivider = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack
    let badge = VivoColors.palette.pepperDark
    let feedbackErrorBackground = VivoColors.palette.pepper
    let feedbackInfoBackground = VivoColors.palette.grey6
    let brand = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80
    let brandHigh = VivoColors.palette.vivoPurpleDark | VivoColors.palette.white.withAlphaComponent(0.05)
    let inverse = VivoColors.palette.white | VivoColors.palette.grey2
    let neutralHigh = VivoColors.palette.grey6 | VivoColors.palette.grey2
    let neutralMedium = VivoColors.palette.grey5
    let neutralMediumInverse = VivoColors.palette.grey5
    let neutralLow = VivoColors.palette.grey1 | VivoColors.palette.darkModeGrey6
    let neutralLowAlternative = VivoColors.palette.grey2 | VivoColors.palette.darkModeGrey6
    let textPrimary = VivoColors.palette.grey6 | VivoColors.palette.grey2
    let textPrimaryInverse = VivoColors.palette.white | VivoColors.palette.grey2
    let textSecondary = VivoColors.palette.grey5 | VivoColors.palette.grey4
    let textSecondaryInverse = VivoColors.palette.vivoPurpleLight20 | VivoColors.palette.grey4
    let success = VivoColors.palette.vivoGreen
    let warning = VivoColors.palette.orange
    let error = VivoColors.palette.pepper
    let promo = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80
    let highlight = VivoColors.palette.pink
    let successLow = VivoColors.palette.vivoGreenLight10 | VivoColors.palette.darkModeGrey6
    let warningLow = VivoColors.palette.orangeLight10 | VivoColors.palette.darkModeGrey6
    let errorLow = VivoColors.palette.pepperLight10 | VivoColors.palette.darkModeGrey6
    let promoLow = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.darkModeGrey6
    let brandLow = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.darkModeGrey6
    let successHigh = VivoColors.palette.vivoGreenDark | VivoColors.palette.vivoGreenLight30
    let warningHigh = VivoColors.palette.orangeDark | VivoColors.palette.orangeLight40
    let errorHigh = VivoColors.palette.pepperDark80 | VivoColors.palette.pepperLight40
    let promoHigh = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight50
    let successHighInverse = VivoColors.palette.vivoGreenDark
    let warningHighInverse = VivoColors.palette.orangeDark
    let errorHighInverse = VivoColors.palette.pepperDark80
    let promoHighInverse = VivoColors.palette.vivoPurple
    let textNavigationBarPrimary = VivoColors.palette.white | VivoColors.palette.grey2
    let textNavigationBarSecondary = VivoColors.palette.vivoPurpleLight50 | VivoColors.palette.grey4
    let textNavigationSearchBarHint = VivoColors.palette.vivoPurpleLight50 | VivoColors.palette.grey4
    let textNavigationSearchBarText = VivoColors.palette.white | VivoColors.palette.grey2
    let textAppBar = VivoColors.palette.grey4 | VivoColors.palette.grey5
    let textAppBarSelected = VivoColors.palette.vivoPurple | VivoColors.palette.grey2
    let customTabsBackground = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack
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
    public let vivoPurpleDark50 = UIColor(hex: "#550080")!
    public let vivoPurpleDark80 = UIColor(hex: "#39184E")!
    public let vivoPurpleDark90 = UIColor(hex: "#2B123A")!
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
    public let grey0 = UIColor(hex: "#FAFAFA")!
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
    public let darkModeGrey7 = UIColor(hex: "#303030")!
    public let darkModeGrey8 = UIColor(hex: "#3D3D3D")!
}
