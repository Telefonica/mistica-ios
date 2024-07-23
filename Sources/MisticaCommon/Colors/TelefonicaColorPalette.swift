//
//  TelefonicaColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct TelefonicaColors: MisticaColors {
    static let palette = TelefonicaColorPalette()

    let backgroundBrand = MisticaColor.solid(TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeBlack)

    let backgroundBrandSecondary = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeBlack

    let appBarBackground = TelefonicaColors.palette.white | TelefonicaColors.palette.darkModeGrey

    let background = TelefonicaColors.palette.white | TelefonicaColors.palette.darkModeBlack

    let backgroundContainer = TelefonicaColors.palette.white | TelefonicaColors.palette.darkModeGrey

    let backgroundContainerError = TelefonicaColors.palette.coral10 | TelefonicaColors.palette.darkModeGrey

    let backgroundContainerHover = TelefonicaColors.palette.telefonicaBlue.withAlphaComponent(0.03) | TelefonicaColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerPressed = TelefonicaColors.palette.telefonicaBlue.withAlphaComponent(0.05) | TelefonicaColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrand = MisticaColor.solid(TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeGrey)

    let backgroundContainerBrandHover = TelefonicaColors.palette.darkModeBlack.withAlphaComponent(0.2) | TelefonicaColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = TelefonicaColors.palette.darkModeBlack.withAlphaComponent(0.4) | TelefonicaColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = TelefonicaColors.palette.telefonicaBlue70 | TelefonicaColors.palette.darkModeGrey

    let backgroundContainerAlternative = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.darkModeGrey

    let backgroundOverlay = TelefonicaColors.palette.grey6.withAlphaComponent(0.8) | TelefonicaColors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = TelefonicaColors.palette.grey2 | TelefonicaColors.palette.grey6

    let backgroundSkeletonInverse = TelefonicaColors.palette.telefonicaBlue70 | TelefonicaColors.palette.grey6

    let navigationBarBackground = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeBlack

    let backgroundAlternative = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.darkModeBlack

    let backgroundBrandTop = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeBlack

    let backgroundBrandBottom = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeBlack

    let skeletonWave = TelefonicaColors.palette.grey2 | TelefonicaColors.palette.grey5

    let borderLow = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.darkModeBlack

    let border = TelefonicaColors.palette.grey2 | TelefonicaColors.palette.darkModeGrey

    let borderHigh = TelefonicaColors.palette.grey5

    let borderSelected = TelefonicaColors.palette.telefonicaBlue

    let coverBackgroundHover = TelefonicaColors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = TelefonicaColors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = TelefonicaColors.palette.coral

    let buttonDangerBackgroundSelected = TelefonicaColors.palette.coral80

    let buttonDangerBackgroundHover = TelefonicaColors.palette.coral80

    let buttonLinkDangerBackgroundSelected = TelefonicaColors.palette.coral10 | TelefonicaColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkDangerBackgroundInverse = TelefonicaColors.palette.white | TelefonicaColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundInverseSelected = TelefonicaColors.palette.coral10 | TelefonicaColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundSelected = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundInverseSelected = TelefonicaColors.palette.white.withAlphaComponent(0.08)

    let buttonPrimaryBackground = TelefonicaColors.palette.telefonicaBlue

    let buttonPrimaryBackgroundInverse = TelefonicaColors.palette.white | TelefonicaColors.palette.telefonicaBlue

    let buttonPrimaryBackgroundSelected = TelefonicaColors.palette.telefonicaBlue70

    let buttonPrimaryBackgroundHover = TelefonicaColors.palette.telefonicaBlue70

    let buttonPrimaryBackgroundInverseSelected = TelefonicaColors.palette.telefonicaBlue30 | TelefonicaColors.palette.telefonicaBlue70

    let buttonSecondaryBorder = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.white

    let buttonSecondaryBorderSelected = TelefonicaColors.palette.telefonicaBlue70 | TelefonicaColors.palette.white

    let buttonSecondaryBorderInverse = TelefonicaColors.palette.white

    let buttonSecondaryBackgroundHover = TelefonicaColors.palette.telefonicaBlue10 | TelefonicaColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundSelected = TelefonicaColors.palette.telefonicaBlue10 | TelefonicaColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBorderInverseSelected = TelefonicaColors.palette.white

    let buttonSecondaryBackgroundInverseHover = TelefonicaColors.palette.white.withAlphaComponent(0.1) | TelefonicaColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInverseSelected = TelefonicaColors.palette.white.withAlphaComponent(0.1) | TelefonicaColors.palette.white.withAlphaComponent(0.15)

    let textButtonPrimary = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let textButtonPrimaryInverse = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.grey2

    let textButtonPrimaryInverseSelected = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.grey2

    let textButtonSecondary = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.grey2

    let textButtonSecondarySelected = TelefonicaColors.palette.telefonicaBlue70 | TelefonicaColors.palette.grey2

    let textButtonSecondaryInverse = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let textButtonSecondaryInverseSelected = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let textLink = TelefonicaColors.palette.telefonicaBlue

    let textLinkInverse = TelefonicaColors.palette.white | TelefonicaColors.palette.telefonicaBlue

    let textLinkDanger = TelefonicaColors.palette.coral

    let textLinkSnackbar = TelefonicaColors.palette.telefonicaBlue30

    let textActivated = TelefonicaColors.palette.telefonicaBlue

    let textBrand = TelefonicaColors.palette.telefonicaBlue

    let control = TelefonicaColors.palette.grey3 | TelefonicaColors.palette.darkModeGrey6

    let controlActivated = TelefonicaColors.palette.telefonicaBlue

    let controlInverse = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.darkModeGrey6

    let controlActivatedInverse = TelefonicaColors.palette.white | TelefonicaColors.palette.telefonicaBlue

    let controlError = TelefonicaColors.palette.coral

    let barTrack = TelefonicaColors.palette.grey3 | TelefonicaColors.palette.darkModeGrey6

    let loadingBar = TelefonicaColors.palette.telefonicaBlue30 | TelefonicaColors.palette.telefonicaBlue

    let loadingBarBackground = TelefonicaColors.palette.telefonicaBlue70 | TelefonicaColors.palette.grey6

    let toggleAndroidInactive = TelefonicaColors.palette.grey2 | TelefonicaColors.palette.grey4

    let toggleAndroidBackgroundActive = TelefonicaColors.palette.grey2 | TelefonicaColors.palette.telefonicaBlue20

    let iosControlKnob = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let divider = TelefonicaColors.palette.grey2 | TelefonicaColors.palette.white.withAlphaComponent(0.05)

    let dividerInverse = TelefonicaColors.palette.white.withAlphaComponent(0.2) | TelefonicaColors.palette.white.withAlphaComponent(0.05)

    let navigationBarDivider = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeBlack

    let badge = TelefonicaColors.palette.coral70

    let feedbackErrorBackground = TelefonicaColors.palette.coral

    let feedbackInfoBackground = TelefonicaColors.palette.grey9 | TelefonicaColors.palette.grey8

    let brand = TelefonicaColors.palette.telefonicaBlue

    let brandHigh = TelefonicaColors.palette.telefonicaBlue70 | TelefonicaColors.palette.white.withAlphaComponent(0.05)

    let inverse = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let neutralHigh = TelefonicaColors.palette.grey9 | TelefonicaColors.palette.grey2

    let neutralMedium = TelefonicaColors.palette.grey5

    let neutralMediumInverse = TelefonicaColors.palette.grey5

    let neutralLow = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.darkModeGrey6

    let neutralLowAlternative = TelefonicaColors.palette.grey2 | TelefonicaColors.palette.darkModeGrey6

    let textPrimary = TelefonicaColors.palette.grey9 | TelefonicaColors.palette.grey2

    let textPrimaryInverse = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let textSecondary = TelefonicaColors.palette.grey5 | TelefonicaColors.palette.grey4

    let textSecondaryInverse = TelefonicaColors.palette.telefonicaBlue10 | TelefonicaColors.palette.grey4

    let error = TelefonicaColors.palette.coral

    let textError = TelefonicaColors.palette.coral

    let textErrorInverse = TelefonicaColors.palette.white | TelefonicaColors.palette.coral

    let success = TelefonicaColors.palette.turquoise

    let warning = TelefonicaColors.palette.ambar

    let promo = TelefonicaColors.palette.orchid

    let highlight = TelefonicaColors.palette.coral40

    let successLow = TelefonicaColors.palette.turquoise10 | TelefonicaColors.palette.darkModeGrey6

    let warningLow = TelefonicaColors.palette.ambar10 | TelefonicaColors.palette.darkModeGrey6

    let errorLow = TelefonicaColors.palette.coral10 | TelefonicaColors.palette.darkModeGrey6

    let promoLow = TelefonicaColors.palette.orchid10 | TelefonicaColors.palette.darkModeGrey6

    let brandLow = TelefonicaColors.palette.telefonicaBlue10 | TelefonicaColors.palette.darkModeGrey6

    let successHigh = TelefonicaColors.palette.turquoise70 | TelefonicaColors.palette.turquoise40

    let warningHigh = TelefonicaColors.palette.ambar70 | TelefonicaColors.palette.ambar40

    let errorHigh = TelefonicaColors.palette.coral70 | TelefonicaColors.palette.coral40

    let promoHigh = TelefonicaColors.palette.orchid70 | TelefonicaColors.palette.orchid40

    let successHighInverse = TelefonicaColors.palette.turquoise70

    let warningHighInverse = TelefonicaColors.palette.ambar70

    let errorHighInverse = TelefonicaColors.palette.coral70

    let promoHighInverse = TelefonicaColors.palette.orchid70

    let textNavigationBarPrimary = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let textNavigationBarSecondary = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.grey4

    let textNavigationSearchBarHint = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.grey4

    let textNavigationSearchBarText = TelefonicaColors.palette.white | TelefonicaColors.palette.grey2

    let textAppBar = TelefonicaColors.palette.grey4 | TelefonicaColors.palette.grey5

    let textAppBarSelected = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.grey2

    let customTabsBackground = TelefonicaColors.palette.telefonicaBlue | TelefonicaColors.palette.darkModeBlack

    let tagTextPromo = TelefonicaColors.palette.orchid70 | TelefonicaColors.palette.orchid40

    let tagTextActive = TelefonicaColors.palette.telefonicaBlue

    let tagTextInactive = TelefonicaColors.palette.grey5

    let tagTextSuccess = TelefonicaColors.palette.turquoise70 | TelefonicaColors.palette.turquoise40

    let tagTextWarning = TelefonicaColors.palette.ambar70 | TelefonicaColors.palette.ambar40

    let tagTextError = TelefonicaColors.palette.coral70 | TelefonicaColors.palette.coral40

    let tagBackgroundPromo = TelefonicaColors.palette.orchid10 | TelefonicaColors.palette.darkModeGrey6

    let tagBackgroundActive = TelefonicaColors.palette.telefonicaBlue10 | TelefonicaColors.palette.darkModeGrey6

    let tagBackgroundInactive = TelefonicaColors.palette.grey1 | TelefonicaColors.palette.darkModeGrey6

    let tagBackgroundSuccess = TelefonicaColors.palette.turquoise10 | TelefonicaColors.palette.darkModeGrey6

    let tagBackgroundWarning = TelefonicaColors.palette.ambar10 | TelefonicaColors.palette.darkModeGrey6

    let tagBackgroundError = TelefonicaColors.palette.coral10 | TelefonicaColors.palette.darkModeGrey6

    let cardContentOverlay = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            TelefonicaColors.palette.black.withAlphaComponent(0),
            TelefonicaColors.palette.black.withAlphaComponent(0.4),
            TelefonicaColors.palette.black.withAlphaComponent(0.7)
        ],
        stops: [0, 0.3, 1],
        angle: 180
    ))
}

public struct TelefonicaColorPalette {
    public init() {}
    public let telefonicaBlue = UIColor(hex: "#0066FF")!
    public let telefonicaBlue10 = UIColor(hex: "#E5F0FF")!
    public let telefonicaBlue20 = UIColor(hex: "#B2D1FF")!
    public let telefonicaBlue30 = UIColor(hex: "#80B3FF")!
    public let telefonicaBlue70 = UIColor(hex: "#0356C9")!
    public let ambar = UIColor(hex: "#EAC344")!
    public let ambar10 = UIColor(hex: "#FDF9EC")!
    public let ambar40 = UIColor(hex: "#F0D57C")!
    public let ambar70 = UIColor(hex: "#69581F")!
    public let coral = UIColor(hex: "#E66C64")!
    public let coral10 = UIColor(hex: "#FDF0EF")!
    public let coral40 = UIColor(hex: "#E3A19A")!
    public let coral70 = UIColor(hex: "#D50000")!
    public let coral80 = UIColor(hex: "#912C31")!
    public let orchid = UIColor(hex: "#C466EF")!
    public let orchid10 = UIColor(hex: "#F9F0FD")!
    public let orchid40 = UIColor(hex: "#D694F4")!
    public let orchid70 = UIColor(hex: "#8A1A93")!
    public let turquoise = UIColor(hex: "#59C2C9")!
    public let turquoise10 = UIColor(hex: "#EEF9FA")!
    public let turquoise40 = UIColor(hex: "#8BD4D9")!
    public let turquoise70 = UIColor(hex: "#3E888D")!
    public let grey1 = UIColor(hex: "#F2F4FF")!
    public let grey2 = UIColor(hex: "#D1D5E4")!
    public let grey3 = UIColor(hex: "#B0B6CA")!
    public let grey4 = UIColor(hex: "#8F97AF")!
    public let grey5 = UIColor(hex: "#6E7894")!
    public let grey6 = UIColor(hex: "#58617A")!
    public let grey7 = UIColor(hex: "#414B61")!
    public let grey8 = UIColor(hex: "#2B3447")!
    public let grey9 = UIColor(hex: "#031A34")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let black = UIColor(hex: "#000000")!
    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
}
