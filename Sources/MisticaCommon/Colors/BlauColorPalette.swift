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

    // BACKGROUNDS
    let appBarBackground = palette.white | palette.darkModeGrey
    let background = palette.white | palette.darkModeBlack
    let backgroundAlternative = palette.blauBluePrimary20 | palette.darkModeGrey
    let backgroundBrand = palette.blauBluePrimary | palette.darkModeBlack
    let backgroundContainer = palette.white | palette.darkModeGrey
    let backgroundFeedbackBottom = palette.blauBluePrimary | palette.darkModeBlack
    let backgroundOverlay = palette.blauBlueSecondary.withAlphaComponent(0.75) | palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = palette.grey2 | palette.darkModeGrey
    let backgroundSkeletonInverse = palette.white.withAlphaComponent(0.2) | palette.darkModeGrey
    let navigationBarBackground = palette.blauBluePrimary | palette.darkModeBlack
    let skeletonWave = palette.grey2 | palette.grey5

    // BORDERS
    let border = palette.grey2 | palette.darkModeGrey
    let borderHigh = palette.grey5
    let borderLow = palette.grey1 | palette.darkModeBlack
    let borderSelected = palette.blauBlueSecondary60

    // BUTTONS
    let buttonDangerBackground = palette.blauRed
    let buttonDangerBackgroundHover = palette.blauRed70
    let buttonDangerBackgroundSelected = palette.blauRed70

    let buttonLinkBackgroundSelected = palette.blauPurple10 | palette.blauPurple.withAlphaComponent(0.3)
    let buttonLinkBackgroundInverseSelected = palette.white.withAlphaComponent(0.3) | palette.blauPurple.withAlphaComponent(0.3)

    let buttonPrimaryBackground = palette.blauBlueSecondary
    let buttonPrimaryBackgroundHover = palette.blauBlueSecondary60
    let buttonPrimaryBackgroundInverse = palette.white | palette.blauBluePrimary
    let buttonPrimaryBackgroundSelected = palette.blauBlueSecondary60
    let buttonPrimaryBackgroundInverseSelected = palette.blauBluePrimary30 | palette.blauBlueSecondary60

    let buttonSecondaryBorder = palette.blauBlueSecondary
    let buttonSecondaryBackgroundSelected = palette.blauBlueSecondary60
    let buttonSecondaryBorderInverse = palette.white | palette.blauBluePrimary
    let buttonSecondaryBorderInverseSelected = palette.blauBluePrimary30 | palette.blauBlueSecondary60

    let textButtonPrimary = palette.white | palette.grey2
    let textButtonPrimaryInverse = palette.blauBlueSecondary | palette.grey2
    let textButtonPrimaryInverseSelected = palette.blauBlueSecondary60 | palette.grey2

    let textButtonSecondary = palette.blauBlueSecondary | palette.grey2
    let textButtonSecondaryInverse = palette.white | palette.grey2
    let textButtonSecondaryInverseSelected = palette.white | palette.blauBlueSecondary60
    let textButtonSecondarySelected = palette.blauBlueSecondary60

    let textLink = palette.blauPurple | palette.blauPurple30
    let textLinkInverse = palette.white | palette.blauPurple30
    let textLinkDanger = palette.blauRed
    let textLinkSnackbar = palette.blauPurple30

    // CONTROLS
    let control = palette.grey2 | palette.darkModeGrey
    let controlActivated = palette.blauBlueSecondary
    let controlError = palette.blauRed
    let loadingBar = palette.blauBlueSecondary | palette.blauBluePrimary
    let loadingBarBackground = palette.blauBlueSecondary10 | palette.darkModeGrey

    // DIVIDERS
    let divider = palette.grey2 | palette.white.withAlphaComponent(0.05)
    let dividerInverse = palette.white.withAlphaComponent(0.2) | palette.white.withAlphaComponent(0.05)
    let navigationBarDivider = palette.blauBluePrimary | palette.darkModeBlack

    // FEEDBACKS
    let badge = palette.blauRed
    let feedbackErrorBackground = palette.blauRed
    let feedbackInfoBackground = palette.grey6 | palette.darkModeGrey

    // GLOBAL
    let brand = palette.blauBluePrimary
    let brandHigh = palette.blauBlueSecondary | palette.white.withAlphaComponent(0.05)
    let inverse = palette.white | palette.grey2
    let highlight = palette.blauBluePrimary
    let neutralHigh = palette.grey6 | palette.grey2
    let neutralLow = palette.grey2 | palette.darkModeGrey6
    let neutralMedium = palette.grey5
    let promo = palette.blauPurple

    let textPrimary = palette.grey6 | palette.grey2
    let textPrimaryInverse = palette.white | palette.grey2
    let textSecondary = palette.grey5 | palette.grey4
    let textSecondaryInverse = palette.blauBluePrimary20 | palette.grey4

    // STATES
    let error = palette.blauRed
    let success = palette.blauGreen
    let warning = palette.blauYellow

    // BARS TEXTS
    let textAppBar = palette.grey5
    let textAppBarSelected = palette.blauBlueSecondary60 | palette.grey2
    let textNavigationBarPrimary = palette.white | palette.grey2
    let textNavigationBarSecondary = palette.blauBlueSecondary20 | palette.grey4
    let textNavigationSearchBarHint = palette.blauBlueSecondary20 | palette.grey4
    let textNavigationSearchBarText = palette.white | palette.grey2

    // TAGS
    var successLow = palette.blauGreen10 | palette.white.withAlphaComponent(0.05)
    var warningLow = palette.blauYellow10 | palette.white.withAlphaComponent(0.05)
    var errorLow = palette.blauRed10 | palette.white.withAlphaComponent(0.05)
    var promoLow = palette.blauPurple10 | palette.white.withAlphaComponent(0.05)
    var brandLow = palette.blauBlueSecondary10 | palette.white.withAlphaComponent(0.05)
    var successHigh = palette.blauGreen70 | palette.blauGreen30
    var warningHigh = palette.blauYellow70 | palette.blauYellow40
    var errorHigh = palette.blauRed70 | palette.blauRed40
    var promoHigh = palette.blauPurple | palette.blauPurple30
}

public struct BlauColorPalette {
    public init() {}

    public let blauBluePrimary = UIColor(hex: "#00B6F1")!
    public let blauBluePrimary30 = UIColor(hex: "#B3E9FB")!
    public let blauBluePrimary20 = UIColor(hex: "#E5F6FD")!
    public let blauBluePrimary10 = UIColor(hex: "#F7FDFF")!
    public let blauBlueSecondary60 = UIColor(hex: "#005A99")!
    public let blauBlueSecondary = UIColor(hex: "#0072BC")!
    public let blauBlueSecondary30 = UIColor(hex: "#80B7DF")!
    public let blauBlueSecondary20 = UIColor(hex: "#B2D4EC")!
    public let blauBlueSecondary10 = UIColor(hex: "#E5F1F9")!

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
