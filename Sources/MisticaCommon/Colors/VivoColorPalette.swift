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

    let backgroundBrand = MisticaColor.solid(VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack)

    let backgroundBrandSecondary = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack

    let appBarBackground = VivoColors.palette.white | VivoColors.palette.darkModeGrey

    let background = VivoColors.palette.white | VivoColors.palette.darkModeBlack

    let backgroundContainer = VivoColors.palette.white | VivoColors.palette.darkModeGrey

    let backgroundContainerError = VivoColors.palette.pepperLight10 | VivoColors.palette.darkModeGrey

    let backgroundContainerHover = VivoColors.palette.darkModeBlack.withAlphaComponent(0.05) | VivoColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerPressed = VivoColors.palette.darkModeBlack.withAlphaComponent(0.08) | VivoColors.palette.white.withAlphaComponent(0.08)

    let backgroundContainerBrand = MisticaColor.solid(VivoColors.palette.vivoPurple | VivoColors.palette.darkModeGrey)

    let backgroundContainerBrandHover = VivoColors.palette.darkModeBlack.withAlphaComponent(0.2) | VivoColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = VivoColors.palette.darkModeBlack.withAlphaComponent(0.4) | VivoColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = VivoColors.palette.vivoPurpleDark | VivoColors.palette.darkModeGrey

    let backgroundContainerAlternative = VivoColors.palette.grey1 | VivoColors.palette.darkModeGrey

    let backgroundOverlay = VivoColors.palette.grey6.withAlphaComponent(0.6) | VivoColors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = VivoColors.palette.grey2 | VivoColors.palette.darkModeGrey6

    let backgroundSkeletonInverse = VivoColors.palette.vivoPurpleDark | VivoColors.palette.darkModeGrey6

    let navigationBarBackground = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack

    let backgroundAlternative = VivoColors.palette.grey1 | VivoColors.palette.darkModeBlack

    let backgroundBrandTop = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack

    let backgroundBrandBottom = VivoColors.palette.vivoPurple | VivoColors.palette.darkModeBlack

    let skeletonWave = VivoColors.palette.grey2 | VivoColors.palette.grey5

    let borderLow = VivoColors.palette.grey1 | VivoColors.palette.darkModeBlack

    let border = VivoColors.palette.grey3 | VivoColors.palette.darkModeGrey

    let borderHigh = VivoColors.palette.grey5

    let borderSelected = VivoColors.palette.vivoPurple

    let coverBackgroundHover = VivoColors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = VivoColors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = VivoColors.palette.pepper

    let buttonDangerBackgroundPressed = VivoColors.palette.pepperDark

    let buttonDangerBackgroundHover = VivoColors.palette.pepperDark

    let buttonLinkDangerBackgroundPressed = VivoColors.palette.pepperLight10 | VivoColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkDangerBackgroundInverse = VivoColors.palette.white | VivoColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundInversePressed = VivoColors.palette.pepperLight10 | VivoColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundPressed = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundInversePressed = VivoColors.palette.white.withAlphaComponent(0.1) | VivoColors.palette.white.withAlphaComponent(0.08)

    let buttonPrimaryBackground = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80

    let buttonPrimaryBackgroundInverse = VivoColors.palette.white | VivoColors.palette.vivoPurpleLight80

    let buttonPrimaryBackgroundPressed = VivoColors.palette.vivoPurpleDark

    let buttonPrimaryBackgroundHover = VivoColors.palette.vivoPurpleDark

    let buttonPrimaryBackgroundInversePressed = VivoColors.palette.vivoPurpleLight50 | VivoColors.palette.vivoPurpleDark

    let buttonSecondaryBorder = VivoColors.palette.vivoPurple | VivoColors.palette.white

    let buttonSecondaryBorderPressed = VivoColors.palette.vivoPurpleDark | VivoColors.palette.white

    let buttonSecondaryBorderInverse = VivoColors.palette.white

    let buttonSecondaryBackgroundHover = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundPressed = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBorderInversePressed = VivoColors.palette.white

    let buttonSecondaryBackgroundInverseHover = VivoColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInversePressed = VivoColors.palette.white.withAlphaComponent(0.15)

    let textButtonPrimary = VivoColors.palette.white | VivoColors.palette.grey2

    let textButtonPrimaryInverse = VivoColors.palette.vivoPurple | VivoColors.palette.grey2

    let textButtonPrimaryInversePressed = VivoColors.palette.vivoPurple | VivoColors.palette.grey2

    let textButtonSecondary = VivoColors.palette.vivoPurple | VivoColors.palette.grey2

    let textButtonSecondaryPressed = VivoColors.palette.vivoPurpleDark | VivoColors.palette.grey2

    let textButtonSecondaryInverse = VivoColors.palette.white | VivoColors.palette.grey2

    let textButtonSecondaryInversePressed = VivoColors.palette.white | VivoColors.palette.grey2

    let textLink = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight50

    let textLinkInverse = VivoColors.palette.white | VivoColors.palette.vivoPurpleLight50

    let textLinkDanger = VivoColors.palette.pepper

    let textLinkSnackbar = VivoColors.palette.vivoPurpleLight50

    let textActivated = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80

    let textBrand = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80

    let control = VivoColors.palette.grey3 | VivoColors.palette.darkModeGrey6

    let controlActivated = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80

    let controlInverse = VivoColors.palette.vivoPurpleLight50 | VivoColors.palette.darkModeGrey6

    let controlActivatedInverse = VivoColors.palette.white | VivoColors.palette.vivoPurpleLight80

    let controlError = VivoColors.palette.pepper

    let barTrack = VivoColors.palette.grey3 | VivoColors.palette.darkModeGrey6

    let barTrackInverse = VivoColors.palette.white.withAlphaComponent(0.5) | VivoColors.palette.darkModeGrey6

    let loadingBar = VivoColors.palette.pink | VivoColors.palette.vivoPurpleLight80

    let loadingBarBackground = VivoColors.palette.pepperLight30 | VivoColors.palette.darkModeGrey6

    let toggleAndroidInactive = VivoColors.palette.grey2 | VivoColors.palette.grey4

    let toggleAndroidBackgroundActive = VivoColors.palette.vivoPurpleLight20 | VivoColors.palette.vivoPurpleLight50

    let iosControlKnob = VivoColors.palette.white | VivoColors.palette.grey2

    let controlKnobInverse = VivoColors.palette.vivoPurple | VivoColors.palette.grey2

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

    let error = VivoColors.palette.pepper

    let textError = VivoColors.palette.pepper

    let textErrorInverse = VivoColors.palette.white | VivoColors.palette.pepper

    let success = VivoColors.palette.vivoGreen

    let warning = VivoColors.palette.orange

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

    let tagTextPromo = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight50

    let tagTextActive = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80

    let tagTextInactive = VivoColors.palette.grey5

    let tagTextSuccess = VivoColors.palette.vivoGreenDark | VivoColors.palette.vivoGreenLight30

    let tagTextWarning = VivoColors.palette.orangeDark | VivoColors.palette.orangeLight40

    let tagTextError = VivoColors.palette.pepperDark80 | VivoColors.palette.pepperLight40

    let tagBackgroundPromo = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundActive = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundInactive = VivoColors.palette.grey1 | VivoColors.palette.darkModeGrey6

    let tagBackgroundSuccess = VivoColors.palette.vivoGreenLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundWarning = VivoColors.palette.orangeLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundError = VivoColors.palette.pepperLight10 | VivoColors.palette.darkModeGrey6

    let tagTextPromoInverse = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight50

    let tagTextActiveInverse = VivoColors.palette.vivoPurple | VivoColors.palette.vivoPurpleLight80

    let tagTextInactiveInverse = VivoColors.palette.grey5

    let tagTextSuccessInverse = VivoColors.palette.vivoGreenDark | VivoColors.palette.vivoGreenLight30

    let tagTextWarningInverse = VivoColors.palette.orangeDark | VivoColors.palette.orangeLight40

    let tagTextErrorInverse = VivoColors.palette.pepperDark80 | VivoColors.palette.pepperLight40

    let tagBackgroundPromoInverse = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundActiveInverse = VivoColors.palette.vivoPurpleLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundInactiveInverse = VivoColors.palette.grey1 | VivoColors.palette.darkModeGrey6

    let tagBackgroundSuccessInverse = VivoColors.palette.vivoGreenLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundWarningInverse = VivoColors.palette.orangeLight10 | VivoColors.palette.darkModeGrey6

    let tagBackgroundErrorInverse = VivoColors.palette.pepperLight10 | VivoColors.palette.darkModeGrey6

    let cardContentOverlay = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            VivoColors.palette.grey6.withAlphaComponent(0),
            VivoColors.palette.grey6.withAlphaComponent(0.4),
            VivoColors.palette.grey6.withAlphaComponent(0.7)
        ],
        stops: [0, 0.3, 1],
        angle: 180
    ))
}

public struct VivoColorPalette: Sendable {
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
