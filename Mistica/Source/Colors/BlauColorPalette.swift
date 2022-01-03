//
//  BlauColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct BlauColors: Colors {
    // BACKGROUNDS
    let appBarBackground = BlauColorPalette.white | BlauColorPalette.darkModeGrey
    let background = BlauColorPalette.white | BlauColorPalette.darkModeBlack
    let backgroundAlternative = BlauColorPalette.blauBluePrimary20 | BlauColorPalette.darkModeGrey
    let backgroundBrand = BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack
    let backgroundContainer = BlauColorPalette.white | BlauColorPalette.darkModeGrey
    let backgroundFeedbackBottom = BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack
    let backgroundOverlay = BlauColorPalette.blauBlueSecondary.withAlphaComponent(0.75) | BlauColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = BlauColorPalette.grey2 | BlauColorPalette.darkModeGrey
    let backgroundSkeletonInverse = BlauColorPalette.white | BlauColorPalette.darkModeGrey
    let navigationBarBackground = BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack
    let skeletonWave = BlauColorPalette.grey2 | BlauColorPalette.grey5

    // BORDERS
    let border = BlauColorPalette.grey2 | BlauColorPalette.darkModeGrey
    let borderDark = BlauColorPalette.grey5
    let borderLight = BlauColorPalette.grey1 | BlauColorPalette.darkModeBlack
    let borderSelected = BlauColorPalette.blauBlueSecondary60

    // BUTTONS
    let buttonDangerBackground = BlauColorPalette.blauRed
    let buttonDangerBackgroundDisabled = BlauColorPalette.blauRed20 | BlauColorPalette.darkModeGrey
    let buttonDangerBackgroundHover = BlauColorPalette.blauRed70
    let buttonDangerBackgroundSelected = BlauColorPalette.blauRed70

    let buttonLinkBackgroundSelected = BlauColorPalette.blauPurple10 | BlauColorPalette.blauPurple.withAlphaComponent(0.3)
    let buttonLinkBackgroundSelectedInverse = BlauColorPalette.white.withAlphaComponent(0.3) | BlauColorPalette.blauPurple.withAlphaComponent(0.3)

    let buttonPrimaryBackground = BlauColorPalette.blauBlueSecondary
    let buttonPrimaryBackgroundDisabled = BlauColorPalette.blauBlueSecondary20 | BlauColorPalette.darkModeGrey
    let buttonPrimaryBackgroundDisabledInverse = BlauColorPalette.blauBluePrimary30 | BlauColorPalette.darkModeGrey
    let buttonPrimaryBackgroundHover = BlauColorPalette.blauBlueSecondary60
    let buttonPrimaryBackgroundInverse = BlauColorPalette.white | BlauColorPalette.blauBluePrimary
    let buttonPrimaryBackgroundSelected = BlauColorPalette.blauBlueSecondary60
    let buttonPrimaryBackgroundSelectedInverse = BlauColorPalette.blauBluePrimary30 | BlauColorPalette.blauBlueSecondary60

    let buttonSecondaryBackground = BlauColorPalette.blauBlueSecondary
    let buttonSecondaryBackgroundDisabled = BlauColorPalette.blauBlueSecondary20 | BlauColorPalette.darkModeGrey
    let buttonSecondaryBackgroundSelected = BlauColorPalette.blauBlueSecondary60
    let buttonSecondaryBorderDisabledInverse = BlauColorPalette.blauBlueSecondary20 | BlauColorPalette.darkModeGrey
    let buttonSecondaryBorderInverse = BlauColorPalette.white | BlauColorPalette.blauBluePrimary
    let buttonSecondaryBorderSelectedInverse = BlauColorPalette.blauBluePrimary30 | BlauColorPalette.blauBlueSecondary60

    let textButtonPrimary = BlauColorPalette.white | BlauColorPalette.grey2
    let textButtonPrimaryDisabled = BlauColorPalette.white | BlauColorPalette.grey5
    let textButtonPrimaryInverse = BlauColorPalette.blauBlueSecondary | BlauColorPalette.grey2
    let textButtonPrimaryInverseDisabled = BlauColorPalette.blauBluePrimary10 | BlauColorPalette.grey5
    let textButtonPrimaryInverseSelected = BlauColorPalette.blauBlueSecondary60 | BlauColorPalette.grey2

    let textButtonSecondary = BlauColorPalette.blauBlueSecondary | BlauColorPalette.grey2
    let textButtonSecondaryDisabled = BlauColorPalette.blauBlueSecondary20 | BlauColorPalette.grey5
    let textButtonSecondaryInverse = BlauColorPalette.white | BlauColorPalette.grey2
    let textButtonSecondaryInverseDisabled = BlauColorPalette.blauBlueSecondary20 | BlauColorPalette.grey5
    let textButtonSecondaryInverseSelected = BlauColorPalette.white | BlauColorPalette.blauBlueSecondary60
    let textButtonSecondarySelected = BlauColorPalette.blauBlueSecondary60 | BlauColorPalette.blauBlueSecondary60

    let textLink = BlauColorPalette.blauPurple
    let textLinkDanger = BlauColorPalette.blauRed
    let textLinkDangerDisabled = BlauColorPalette.blauRed20 | BlauColorPalette.grey5
    let textLinkDisabled = BlauColorPalette.blauPurple30 | BlauColorPalette.grey5
    let textLinkSnackbar = BlauColorPalette.blauPurple30

    // CONTROLS
    let control = BlauColorPalette.grey2 | BlauColorPalette.grey5
    let controlActivated = BlauColorPalette.blauBlueSecondary
    let controlError = BlauColorPalette.blauRed
    let loadingBar = BlauColorPalette.blauBlueSecondary | BlauColorPalette.blauBluePrimary
    let loadingBarBackground = BlauColorPalette.blauBlueSecondary10 | BlauColorPalette.darkModeGrey

    // DIVIDERS
    let divider = BlauColorPalette.grey2 | BlauColorPalette.white.withAlphaComponent(0.05)
    let dividerInverse = BlauColorPalette.white.withAlphaComponent(0.2) | BlauColorPalette.white.withAlphaComponent(0.05)
    let navigationBarDivider = BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack

    // FEEDBACKS
    let badge = BlauColorPalette.blauRed
    let feedbackErrorBackground = BlauColorPalette.blauRed
    let feedbackInfoBackground = BlauColorPalette.grey6 | BlauColorPalette.darkModeGrey

    // GLOBAL
    let brand = BlauColorPalette.blauBluePrimary | BlauColorPalette.blauBluePrimary
    let brandDark = BlauColorPalette.blauBlueSecondary | BlauColorPalette.grey5
    let inverse = BlauColorPalette.white | BlauColorPalette.grey2
    let highlight = BlauColorPalette.blauBluePrimary
    let neutralHigh = BlauColorPalette.grey6 | BlauColorPalette.grey2
    let neutralLow = BlauColorPalette.grey2 | BlauColorPalette.darkModeGrey
    let neutralMedium = BlauColorPalette.grey5 | BlauColorPalette.grey5
    let promo = BlauColorPalette.blauPurple

    let textAmount = BlauColorPalette.blauBlueSecondary | BlauColorPalette.blauBlueSecondary
    let textDisabled = BlauColorPalette.grey3 | BlauColorPalette.grey5
    let textPrimary = BlauColorPalette.grey6 | BlauColorPalette.grey2
    let textPrimaryInverse = BlauColorPalette.white | BlauColorPalette.grey2
    let textSecondary = BlauColorPalette.grey5 | BlauColorPalette.grey4
    let textSecondaryInverse = BlauColorPalette.white | BlauColorPalette.grey4

    // STATES
    let error = BlauColorPalette.blauRed
    let success = BlauColorPalette.blauGreen
    let warning = BlauColorPalette.blauYellow

    // BARS TEXTS
    let textAppBar = BlauColorPalette.grey5 | BlauColorPalette.grey5
    let textAppBarSelected = BlauColorPalette.blauBlueSecondary60 | BlauColorPalette.grey2
    let textNavigationBarPrimary = BlauColorPalette.white | BlauColorPalette.grey2
    let textNavigationBarSecondary = BlauColorPalette.blauBlueSecondary20 | BlauColorPalette.grey4
    let textNavigationSearchBarHint = BlauColorPalette.blauBlueSecondary20 | BlauColorPalette.grey4
    let textNavigationSearchBarText = BlauColorPalette.white | BlauColorPalette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [
        BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack,
        BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack,
        BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack,
        BlauColorPalette.blauBluePrimary | BlauColorPalette.darkModeBlack
    ]

    // TAGS
    var tagBackgroundSuccess = BlauColorPalette.blauGreen10 | BlauColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundWarning = BlauColorPalette.blauYellow10 | BlauColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundError = BlauColorPalette.blauRed10 | BlauColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundPromo = BlauColorPalette.blauPurple10 | BlauColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundActive = BlauColorPalette.blauBlueSecondary10 | BlauColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundInactive = BlauColorPalette.grey2 | BlauColorPalette.white.withAlphaComponent(0.05)
    var textTagSuccess = BlauColorPalette.blauGreen70 | BlauColorPalette.blauGreen30
    var textTagWarning = BlauColorPalette.blauYellow70 | BlauColorPalette.blauYellow40
    var textTagError = BlauColorPalette.blauRed70 | BlauColorPalette.blauRed40
    var textTagPromo = BlauColorPalette.blauPurple | BlauColorPalette.blauPurple30
    var textTagActive = BlauColorPalette.blauBlueSecondary | BlauColorPalette.blauBluePrimary30
    var textTagInactive = BlauColorPalette.grey5 | BlauColorPalette.grey4
}

public enum BlauColorPalette {
    public static let blauBluePrimary = UIColor(hex: "#00B6F1")!
    public static let blauBluePrimary30 = UIColor(hex: "#B3E9FB")!
    public static let blauBluePrimary20 = UIColor(hex: "#E5F6FD")!
    public static let blauBluePrimary10 = UIColor(hex: "#F7FDFF")!
    public static let blauBlueSecondary60 = UIColor(hex: "#005A99")!
    public static let blauBlueSecondary = UIColor(hex: "#0072BC")!
    public static let blauBlueSecondary30 = UIColor(hex: "#80B7DF")!
    public static let blauBlueSecondary20 = UIColor(hex: "#B2D4EC")!
    public static let blauBlueSecondary10 = UIColor(hex: "#E5F1F9")!

    public static let blauPurple = UIColor(hex: "#7814B3")!
    public static let blauPurple10 = UIColor(hex: "#F1E7F7")!
    public static let blauPurple30 = UIColor(hex: "#BB89D9")!
    public static let blauYellow = UIColor(hex: "#FFA922")!
    public static let blauYellow10 = UIColor(hex: "#FFF6E9")!
    public static let blauYellow40 = UIColor(hex: "#FFC364")!
    public static let blauYellow60 = UIColor(hex: "#F09500")!
    public static let blauYellow70 = UIColor(hex: "#996614")!
    public static let blauGreen = UIColor(hex: "#30D300")!
    public static let blauRed = UIColor(hex: "#F64417")!
    public static let blauRed10 = UIColor(hex: "#FEECE8")!
    public static let blauRed20 = UIColor(hex: "#FCC7B9")!
    public static let blauRed30 = UIColor(hex: "#FA9E87")!
    public static let blauRed40 = UIColor(hex: "#F97C5D")!
    public static let blauRed70 = UIColor(hex: "#C93712")!
    public static let blauGreen10 = UIColor(hex: "#EAFBE5")!
    public static let blauGreen30 = UIColor(hex: "#97E980")!
    public static let blauGreen70 = UIColor(hex: "#1D7F00")!
    
    public static let grey1 = UIColor(hex: "#F5F9FA")!
    public static let grey2 = UIColor(hex: "#E7E7E7")!
    public static let grey3 = UIColor(hex: "#B8B8B8")!
    public static let grey4 = UIColor(hex: "#A0A0A0")!
    public static let grey5 = UIColor(hex: "#808285")!
    public static let grey6 = UIColor(hex: "#000000")!
    public static let white = UIColor(hex: "#FFFFFF")!

    public static let darkModeBlack = UIColor(hex: "#191919")!
    public static let darkModeGrey = UIColor(hex: "#242424")!
}
