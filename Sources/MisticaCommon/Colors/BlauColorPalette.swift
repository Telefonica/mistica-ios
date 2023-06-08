//
//  BlauColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct BlauColors: MisticaColors {
    static let palette = BlauColorPalette()

    let backgroundBrand = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack
    let backgroundBrandSecondary = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack
    let appBarBackground = BlauColors.palette.white | BlauColors.palette.darkModeGrey
    let background = BlauColors.palette.white | BlauColors.palette.darkModeBlack
    let backgroundContainer = BlauColors.palette.white | BlauColors.palette.darkModeGrey
    let backgroundContainerHover = BlauColors.palette.blauBluePrimary.withAlphaComponent(0.03) | BlauColors.palette.white.withAlphaComponent(0.03)
    let backgroundContainerPressed = BlauColors.palette.blauBluePrimary.withAlphaComponent(0.05) | BlauColors.palette.white.withAlphaComponent(0.05)
    let backgroundContainerBrand = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeGrey
    let backgroundContainerBrandHover = BlauColors.palette.darkModeBlack.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.03)
    let backgroundContainerBrandPressed = BlauColors.palette.darkModeBlack.withAlphaComponent(0.4) | BlauColors.palette.white.withAlphaComponent(0.05)
    let backgroundContainerBrandOverInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.darkModeGrey
    let backgroundContainerAlternative = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey
    let backgroundOverlay = BlauColors.palette.blauBlueSecondary.withAlphaComponent(0.75) | BlauColors.palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = BlauColors.palette.grey2 | BlauColors.palette.darkModeGrey
    let backgroundSkeletonInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.darkModeGrey
    let navigationBarBackground = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack
    let backgroundAlternative = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeBlack
    let backgroundFeedbackBottom = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack
    let skeletonWave = BlauColors.palette.grey2 | BlauColors.palette.grey5
    let borderLow = BlauColors.palette.grey1 | BlauColors.palette.darkModeBlack
    let border = BlauColors.palette.grey2 | BlauColors.palette.darkModeGrey
    let borderHigh = BlauColors.palette.grey5
    let borderSelected = BlauColors.palette.blauBlueSecondary60
    let coverBackgroundHover = BlauColors.palette.darkModeBlack.withAlphaComponent(0.25)
    let coverBackgroundPressed = BlauColors.palette.darkModeBlack.withAlphaComponent(0.35)
    let buttonDangerBackground = BlauColors.palette.blauRed
    let buttonDangerBackgroundSelected = BlauColors.palette.blauRed70
    let buttonDangerBackgroundHover = BlauColors.palette.blauRed70
    let buttonLinkBackgroundSelected = BlauColors.palette.blauPurple10 | BlauColors.palette.blauPurple.withAlphaComponent(0.3)
    let buttonLinkBackgroundInverseSelected = BlauColors.palette.white.withAlphaComponent(0.15) | BlauColors.palette.blauPurple.withAlphaComponent(0.3)
    let buttonPrimaryBackground = BlauColors.palette.blauBlueSecondary
    let buttonPrimaryBackgroundInverse = BlauColors.palette.white | BlauColors.palette.blauBluePrimary
    let buttonPrimaryBackgroundSelected = BlauColors.palette.blauBlueSecondary60
    let buttonPrimaryBackgroundHover = BlauColors.palette.blauBlueSecondary60
    let buttonPrimaryBackgroundInverseSelected = BlauColors.palette.blauBluePrimary30 | BlauColors.palette.blauBlueSecondary60
    let buttonSecondaryBorder = BlauColors.palette.blauBlueSecondary | BlauColors.palette.white
    let buttonSecondaryBorderSelected = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.white
    let buttonSecondaryBorderInverse = BlauColors.palette.white
    let buttonSecondaryBackgroundHover = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBackgroundSelected = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBorderInverseSelected = BlauColors.palette.white
    let buttonSecondaryBackgroundInverseHover = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.15)
    let buttonSecondaryBackgroundInverseSelected = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.15)
    let textButtonPrimary = BlauColors.palette.white | BlauColors.palette.grey2
    let textButtonPrimaryInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2
    let textButtonPrimaryInverseSelected = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2
    let textButtonSecondary = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2
    let textButtonSecondarySelected = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2
    let textButtonSecondaryInverse = BlauColors.palette.white | BlauColors.palette.grey2
    let textButtonSecondaryInverseSelected = BlauColors.palette.white | BlauColors.palette.grey2
    let textLink = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30
    let textLinkInverse = BlauColors.palette.white | BlauColors.palette.blauPurple30
    let textLinkDanger = BlauColors.palette.blauRed
    let textLinkSnackbar = BlauColors.palette.blauPurple30
    let control = BlauColors.palette.grey2 | BlauColors.palette.darkModeGrey6
    let controlActivated = BlauColors.palette.blauBlueSecondary
    let controlError = BlauColors.palette.blauRed
    let loadingBar = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary
    let loadingBarBackground = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.darkModeGrey
    let toggleAndroidInactive = BlauColors.palette.grey2 | BlauColors.palette.grey5
    let toggleAndroidBackgroundActive = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.blauBlueSecondary30
    let iosControlKnob = BlauColors.palette.white | BlauColors.palette.grey2
    let divider = BlauColors.palette.grey2 | BlauColors.palette.white.withAlphaComponent(0.05)
    let dividerInverse = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.05)
    let navigationBarDivider = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack
    let badge = BlauColors.palette.blauRed
    let feedbackErrorBackground = BlauColors.palette.blauRed
    let feedbackInfoBackground = BlauColors.palette.grey6 | BlauColors.palette.darkModeGrey
    let brand = BlauColors.palette.blauBluePrimary
    let brandHigh = BlauColors.palette.blauBlueSecondary | BlauColors.palette.white.withAlphaComponent(0.05)
    let inverse = BlauColors.palette.white | BlauColors.palette.grey2
    let neutralHigh = BlauColors.palette.grey6 | BlauColors.palette.grey2
    let neutralMedium = BlauColors.palette.grey5
    let neutralMediumInverse = BlauColors.palette.grey5
    let neutralLow = BlauColors.palette.grey2 | BlauColors.palette.darkModeGrey6
    let neutralLowAlternative = BlauColors.palette.grey2 | BlauColors.palette.darkModeGrey6
    let textPrimary = BlauColors.palette.grey6 | BlauColors.palette.grey2
    let textPrimaryInverse = BlauColors.palette.white | BlauColors.palette.grey2
    let textSecondary = BlauColors.palette.grey5 | BlauColors.palette.grey4
    let textSecondaryInverse = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.grey4
    let error = BlauColors.palette.blauRed
    let success = BlauColors.palette.blauGreen
    let warning = BlauColors.palette.blauYellow
    let promo = BlauColors.palette.blauPurple
    let highlight = BlauColors.palette.blauBluePrimary
    let successLow = BlauColors.palette.blauGreen10 | BlauColors.palette.darkModeGrey6
    let warningLow = BlauColors.palette.blauYellow10 | BlauColors.palette.darkModeGrey6
    let errorLow = BlauColors.palette.blauRed10 | BlauColors.palette.darkModeGrey6
    let promoLow = BlauColors.palette.blauPurple10 | BlauColors.palette.darkModeGrey6
    let brandLow = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.darkModeGrey6
    let successHigh = BlauColors.palette.blauGreen70 | BlauColors.palette.blauGreen30
    let warningHigh = BlauColors.palette.blauYellow70 | BlauColors.palette.blauYellow40
    let errorHigh = BlauColors.palette.blauRed70 | BlauColors.palette.blauRed40
    let promoHigh = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30
    let successHighInverse = BlauColors.palette.blauGreen70
    let warningHighInverse = BlauColors.palette.blauYellow70
    let errorHighInverse = BlauColors.palette.blauRed70
    let promoHighInverse = BlauColors.palette.blauPurple
    let textNavigationBarPrimary = BlauColors.palette.white | BlauColors.palette.grey2
    let textNavigationBarSecondary = BlauColors.palette.blauBlueSecondary20 | BlauColors.palette.grey4
    let textNavigationSearchBarHint = BlauColors.palette.blauBlueSecondary20 | BlauColors.palette.grey4
    let textNavigationSearchBarText = BlauColors.palette.white | BlauColors.palette.grey2
    let textAppBar = BlauColors.palette.grey5
    let textAppBarSelected = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2
    let customTabsBackground = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack
}

public struct BlauColorPalette {
    public init() {}
    public let blauBluePrimary = UIColor(hex: "#00B6F1")!
    public let blauBluePrimary10 = UIColor(hex: "#F7FDFF")!
    public let blauBluePrimary20 = UIColor(hex: "#E5F6FD")!
    public let blauBluePrimary30 = UIColor(hex: "#B3E9FB")!
    public let blauBlueSecondary = UIColor(hex: "#0072BC")!
    public let blauBlueSecondary10 = UIColor(hex: "#E5F1F9")!
    public let blauBlueSecondary20 = UIColor(hex: "#B2D4EC")!
    public let blauBlueSecondary30 = UIColor(hex: "#80B7DF")!
    public let blauBlueSecondary60 = UIColor(hex: "#005A99")!
    public let blauPurple = UIColor(hex: "#7814B3")!
    public let blauPurple10 = UIColor(hex: "#F1E7F7")!
    public let blauPurple30 = UIColor(hex: "#BB89D9")!
    public let blauYellow = UIColor(hex: "#FFA922")!
    public let blauYellow10 = UIColor(hex: "#FFF6E9")!
    public let blauYellow40 = UIColor(hex: "#FFC364")!
    public let blauYellow60 = UIColor(hex: "#F09500")!
    public let blauYellow70 = UIColor(hex: "#996614")!
    public let blauGreen = UIColor(hex: "#30D300")!
    public let blauGreen10 = UIColor(hex: "#EAFBE5")!
    public let blauGreen30 = UIColor(hex: "#97E980")!
    public let blauGreen70 = UIColor(hex: "#1D7F00")!
    public let blauRed = UIColor(hex: "#F64417")!
    public let blauRed10 = UIColor(hex: "#FEECE8")!
    public let blauRed20 = UIColor(hex: "#FCC7B9")!
    public let blauRed30 = UIColor(hex: "#FA9E87")!
    public let blauRed40 = UIColor(hex: "#F97C5D")!
    public let blauRed70 = UIColor(hex: "#C93712")!
    public let grey1 = UIColor(hex: "#F5F9FA")!
    public let grey2 = UIColor(hex: "#E7E7E7")!
    public let grey3 = UIColor(hex: "#B8B8B8")!
    public let grey4 = UIColor(hex: "#A0A0A0")!
    public let grey5 = UIColor(hex: "#808285")!
    public let grey6 = UIColor(hex: "#000000")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
}
