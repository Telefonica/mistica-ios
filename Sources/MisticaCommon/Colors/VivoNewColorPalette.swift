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

    let backgroundBrand = MisticaColor.solid(VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack)

    let backgroundBrandSecondary = VivoNewColors.palette.vivoPurpleLight80 | VivoNewColors.palette.darkModeBlack

    let backgroundContainer = VivoNewColors.palette.white | VivoNewColors.palette.darkModeGrey

    let backgroundContainerError = VivoNewColors.palette.pepperLight10 | VivoNewColors.palette.darkModeGrey

    let backgroundContainerHover = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.05) | VivoNewColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerPressed = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.08) | VivoNewColors.palette.white.withAlphaComponent(0.08)

    let backgroundContainerBrand = MisticaColor.solid(VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeGrey)

    let backgroundContainerBrandHover = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.2) | VivoNewColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.4) | VivoNewColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.darkModeGrey

    let backgroundContainerAlternative = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeGrey

    let backgroundOverlay = VivoNewColors.palette.grey6.withAlphaComponent(0.6) | VivoNewColors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = VivoNewColors.palette.grey3 | VivoNewColors.palette.darkModeGrey6

    let backgroundSkeletonInverse = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.darkModeGrey6

    let backgroundBrandTop = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack

    let backgroundBrandBottom = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack

    let appBarBackground = VivoNewColors.palette.white | VivoNewColors.palette.darkModeGrey

    let navigationBarBackground = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.darkModeBlack

    let skeletonWave = VivoNewColors.palette.grey2 | VivoNewColors.palette.grey5

    let borderLow = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeBlack

    let border = VivoNewColors.palette.grey3 | VivoNewColors.palette.darkModeGrey

    let borderHigh = VivoNewColors.palette.grey5

    let borderSelected = VivoNewColors.palette.vivoPurple

    let completedStep = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let completedStepInverse = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.vivoPurpleLight80

    let coverBackgroundHover = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = VivoNewColors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = VivoNewColors.palette.pepper

    let buttonDangerBackgroundPressed = VivoNewColors.palette.pepperDark

    let buttonDangerBackgroundHover = VivoNewColors.palette.pepperDark

    let buttonLinkDangerBackgroundPressed = VivoNewColors.palette.pepperLight10 | VivoNewColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkDangerBackgroundInverse = VivoNewColors.palette.white | VivoNewColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundInversePressed = VivoNewColors.palette.pepperLight10 | VivoNewColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundPressed = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundInversePressed = VivoNewColors.palette.white.withAlphaComponent(0.1) | VivoNewColors.palette.white.withAlphaComponent(0.08)

    let buttonPrimaryBackground = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let buttonPrimaryBackgroundInverse = VivoNewColors.palette.white | VivoNewColors.palette.vivoPurpleLight80

    let buttonPrimaryBackgroundPressed = VivoNewColors.palette.vivoPurpleDark

    let buttonPrimaryBackgroundHover = VivoNewColors.palette.vivoPurpleDark

    let buttonPrimaryBackgroundInversePressed = VivoNewColors.palette.vivoPurpleLight50 | VivoNewColors.palette.vivoPurpleDark

    let buttonSecondaryBorder = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.white

    let buttonSecondaryBorderPressed = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.white

    let buttonSecondaryBorderInverse = VivoNewColors.palette.white

    let buttonSecondaryBackgroundHover = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundPressed = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBorderInversePressed = VivoNewColors.palette.white

    let buttonSecondaryBackgroundInverseHover = VivoNewColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInversePressed = VivoNewColors.palette.white.withAlphaComponent(0.15)

    let textButtonPrimary = VivoNewColors.palette.white | VivoNewColors.palette.grey2

    let textButtonPrimaryInverse = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2

    let textButtonPrimaryInversePressed = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2

    let textButtonSecondary = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2

    let textButtonSecondaryPressed = VivoNewColors.palette.vivoPurpleDark | VivoNewColors.palette.grey2

    let textButtonSecondaryInverse = VivoNewColors.palette.white | VivoNewColors.palette.grey2

    let textButtonSecondaryInversePressed = VivoNewColors.palette.white | VivoNewColors.palette.grey2

    let textLink = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight50

    let textLinkInverse = VivoNewColors.palette.white | VivoNewColors.palette.vivoPurpleLight50

    let textLinkDanger = VivoNewColors.palette.pepper

    let textLinkSnackbar = VivoNewColors.palette.vivoPurpleLight20 | VivoNewColors.palette.vivoPurpleLight50

    let textActivated = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let textBrand = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let inputBorder = VivoNewColors.palette.grey4 | VivoNewColors.palette.darkModeGrey5

    let control = VivoNewColors.palette.grey4 | VivoNewColors.palette.darkModeGrey6

    let controlActivated = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let controlInverse = VivoNewColors.palette.vivoPurpleLight50 | VivoNewColors.palette.darkModeGrey6

    let controlActivatedInverse = VivoNewColors.palette.white | VivoNewColors.palette.vivoPurpleLight80

    let controlError = VivoNewColors.palette.pepper

    let barTrack = VivoNewColors.palette.grey3 | VivoNewColors.palette.darkModeGrey6

    let barTrackInverse = VivoNewColors.palette.white.withAlphaComponent(0.5) | VivoNewColors.palette.darkModeGrey6

    let loadingBar = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let loadingBarBackground = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6

    let toggleAndroidInactive = VivoNewColors.palette.grey2 | VivoNewColors.palette.grey4

    let toggleAndroidBackgroundActive = VivoNewColors.palette.vivoPurpleLight20 | VivoNewColors.palette.vivoPurpleLight50

    let iosControlKnob = VivoNewColors.palette.white | VivoNewColors.palette.grey2

    let controlKnobInverse = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2

    let divider = VivoNewColors.palette.grey3 | VivoNewColors.palette.white.withAlphaComponent(0.05)

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

    let textSecondary = VivoNewColors.palette.grey5 | VivoNewColors.palette.grey3

    let textSecondaryInverse = VivoNewColors.palette.vivoPurpleLight20 | VivoNewColors.palette.grey3

    let error = VivoNewColors.palette.pepper

    let textError = VivoNewColors.palette.pepper

    let textErrorInverse = VivoNewColors.palette.white | VivoNewColors.palette.pepper

    let success = VivoNewColors.palette.vivoGreen

    let warning = VivoNewColors.palette.orange

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

    let textAppBar = VivoNewColors.palette.grey5

    let textAppBarSelected = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.grey2

    let customTabsBackground = VivoNewColors.palette.white | VivoNewColors.palette.darkModeBlack

    let tagTextPromo = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight50

    let tagTextActive = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let tagTextInactive = VivoNewColors.palette.grey5

    let tagTextInfo = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let tagTextSuccess = VivoNewColors.palette.vivoGreenDark | VivoNewColors.palette.vivoGreenLight30

    let tagTextWarning = VivoNewColors.palette.orangeDark | VivoNewColors.palette.orangeLight40

    let tagTextError = VivoNewColors.palette.pepperDark80 | VivoNewColors.palette.pepperLight40

    let tagBackgroundPromo = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundActive = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundInactive = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundInfo = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundSuccess = VivoNewColors.palette.vivoGreenLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundWarning = VivoNewColors.palette.orangeLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundError = VivoNewColors.palette.pepperLight10 | VivoNewColors.palette.darkModeGrey6

    let tagTextPromoInverse = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight50

    let tagTextActiveInverse = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let tagTextInactiveInverse = VivoNewColors.palette.grey5

    let tagTextInfoInverse = VivoNewColors.palette.vivoPurple | VivoNewColors.palette.vivoPurpleLight80

    let tagTextSuccessInverse = VivoNewColors.palette.vivoGreenDark | VivoNewColors.palette.vivoGreenLight30

    let tagTextWarningInverse = VivoNewColors.palette.orangeDark | VivoNewColors.palette.orangeLight40

    let tagTextErrorInverse = VivoNewColors.palette.pepperDark80 | VivoNewColors.palette.pepperLight40

    let tagBackgroundPromoInverse = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundActiveInverse = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundInactiveInverse = VivoNewColors.palette.grey1 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundInfoInverse = VivoNewColors.palette.vivoPurpleLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundSuccessInverse = VivoNewColors.palette.vivoGreenLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundWarningInverse = VivoNewColors.palette.orangeLight10 | VivoNewColors.palette.darkModeGrey6

    let tagBackgroundErrorInverse = VivoNewColors.palette.pepperLight10 | VivoNewColors.palette.darkModeGrey6

    let cardContentOverlay = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            VivoNewColors.palette.grey6.withAlphaComponent(0),
            VivoNewColors.palette.grey6.withAlphaComponent(0.4),
            VivoNewColors.palette.grey6.withAlphaComponent(0.7)
        ],
        stops: [0, 0.3, 1],
        angle: 180
    ))
}

public struct VivoNewColorPalette: Sendable {
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
    public let grey4 = UIColor(hex: "#8A8C90")!
    public let grey5 = UIColor(hex: "#666666")!
    public let grey6 = UIColor(hex: "#000000")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey5 = UIColor(hex: "#6D7D88")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
}
