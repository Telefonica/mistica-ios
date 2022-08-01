//
//  MovistarColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct MovistarColors: MisticaColors {
    // BACKGROUNDS
    let appBarBackground = MovistarColorPalette.white | MovistarColorPalette.darkModeGrey
    let background = MovistarColorPalette.white | MovistarColorPalette.darkModeBlack
    let backgroundContainer = MovistarColorPalette.white | MovistarColorPalette.darkModeGrey
    let backgroundBrand = MovistarColorPalette.movistarBlue | MovistarColorPalette.darkModeBlack
    let backgroundOverlay = MovistarColorPalette.grey6.withAlphaComponent(0.6) | MovistarColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = MovistarColorPalette.grey1 | MovistarColorPalette.grey6
    let backgroundSkeletonInverse = MovistarColorPalette.movistarBlue55 | MovistarColorPalette.grey6
    let navigationBarBackground = MovistarColorPalette.movistarBlue | MovistarColorPalette.darkModeBlack

    let backgroundAlternative = MovistarColorPalette.grey1 | MovistarColorPalette.darkModeGrey // (seguramente mejor darkModeBlack)
    let backgroundFeedbackBottom = MovistarColorPalette.movistarBlue | MovistarColorPalette.darkModeBlack
    let skeletonWave = MovistarColorPalette.grey2 | MovistarColorPalette.grey5

    // BORDERS
    let borderLight = MovistarColorPalette.grey1 | MovistarColorPalette.darkModeBlack
    let border = MovistarColorPalette.grey3 | MovistarColorPalette.darkModeGrey
    let borderDark = MovistarColorPalette.grey5
    let borderSelected = MovistarColorPalette.movistarBlue

    // BUTTONS
    let buttonDangerBackground = MovistarColorPalette.pepper
    let buttonDangerBackgroundSelected = MovistarColorPalette.pepper55
    let buttonDangerBackgroundHover = MovistarColorPalette.pepper55

    let buttonLinkBackgroundSelected = MovistarColorPalette.movistarBlue10 | MovistarColorPalette.white.withAlphaComponent(0.05)
    let buttonLinkBackgroundSelectedInverse = MovistarColorPalette.white.withAlphaComponent(0.2) | MovistarColorPalette.white.withAlphaComponent(0.05)

    let buttonPrimaryBackground = MovistarColorPalette.movistarBlue
    let buttonPrimaryBackgroundInverse = MovistarColorPalette.white | MovistarColorPalette.movistarBlue
    let buttonPrimaryBackgroundSelected = MovistarColorPalette.movistarBlue55
    let buttonPrimaryBackgroundHover = MovistarColorPalette.movistarBlue55
    let buttonPrimaryBackgroundSelectedInverse = MovistarColorPalette.movistarBlue30 | MovistarColorPalette.movistarBlue55

    let buttonSecondaryBackground = MovistarColorPalette.movistarBlue
    let buttonSecondaryBackgroundSelected = MovistarColorPalette.movistarBlue55
    let buttonSecondaryBorderInverse = MovistarColorPalette.white | MovistarColorPalette.movistarBlue
    let buttonSecondaryBorderSelectedInverse = MovistarColorPalette.movistarBlue30 | MovistarColorPalette.movistarBlue55

    let textButtonPrimary = MovistarColorPalette.white | MovistarColorPalette.grey2
    let textButtonPrimaryInverse = MovistarColorPalette.movistarBlue | MovistarColorPalette.grey2
    let textButtonPrimaryInverseSelected = MovistarColorPalette.movistarBlue | MovistarColorPalette.grey2

    let textButtonSecondary = MovistarColorPalette.movistarBlue | MovistarColorPalette.grey2
    let textButtonSecondaryDisabled = MovistarColorPalette.movistarGreen30 | MovistarColorPalette.grey5
    let textButtonSecondarySelected = MovistarColorPalette.movistarBlue55 | MovistarColorPalette.grey4
    let textButtonSecondaryInverse = MovistarColorPalette.white | MovistarColorPalette.grey2
    let textButtonSecondaryInverseSelected = MovistarColorPalette.white | MovistarColorPalette.grey4

    let textLink = MovistarColorPalette.movistarBlue
    let textLinkInverse = MovistarColorPalette.white | MovistarColorPalette.movistarBlue
    let textLinkDanger = MovistarColorPalette.pepper
    let textLinkSnackbar = MovistarColorPalette.movistarBlue30

    // CONTROLS
    let control = MovistarColorPalette.grey3 | MovistarColorPalette.grey6
    let controlActivated = MovistarColorPalette.movistarBlue
    let controlError = MovistarColorPalette.pepper
    let loadingBar = MovistarColorPalette.movistarBlue30 | MovistarColorPalette.movistarBlue
    let loadingBarBackground = MovistarColorPalette.movistarBlue55 | MovistarColorPalette.darkModeGrey

    // DIVIDERS
    let divider = MovistarColorPalette.grey2 | MovistarColorPalette.white.withAlphaComponent(0.05)
    let dividerInverse = MovistarColorPalette.movistarBlue55 | MovistarColorPalette.white.withAlphaComponent(0.05)
    var navigationBarDivider = MovistarColorPalette.movistarBlue | MovistarColorPalette.darkModeBlack

    // FEEDBACKS
    let badge = MovistarColorPalette.pepper55
    let feedbackErrorBackground = MovistarColorPalette.pepper
    let feedbackInfoBackground = MovistarColorPalette.grey6

    // GLOBAL
    let brand = MovistarColorPalette.movistarBlue
    let brandHigh = MovistarColorPalette.movistarBlue55 | MovistarColorPalette.white.withAlphaComponent(0.05)
    let inverse = MovistarColorPalette.white | MovistarColorPalette.grey2
    let neutralHigh = MovistarColorPalette.grey6 | MovistarColorPalette.grey2
    let neutralMedium = MovistarColorPalette.grey5
    let neutralLow = MovistarColorPalette.grey1 | MovistarColorPalette.grey6
    let promo = MovistarColorPalette.purple
    let highlight = MovistarColorPalette.pink

    let textPrimary = MovistarColorPalette.grey6 | MovistarColorPalette.grey2
    let textPrimaryInverse = MovistarColorPalette.white | MovistarColorPalette.grey2
    let textSecondary = MovistarColorPalette.grey5 | MovistarColorPalette.grey4
    let textSecondaryInverse = MovistarColorPalette.white | MovistarColorPalette.grey4

    // STATES
    let error = MovistarColorPalette.pepper
    let success = MovistarColorPalette.movistarGreen
    let warning = MovistarColorPalette.egg

    // BARS TEXTS
    let textNavigationBarPrimary = MovistarColorPalette.white | MovistarColorPalette.grey2
    let textNavigationBarSecondary = MovistarColorPalette.movistarBlue20 | MovistarColorPalette.grey4
    let textNavigationSearchBarHint = MovistarColorPalette.movistarBlue20 | MovistarColorPalette.grey4 // iOS only
    let textNavigationSearchBarText = MovistarColorPalette.white | MovistarColorPalette.grey2 // iOS only
    let textAppBar = MovistarColorPalette.grey4 | MovistarColorPalette.grey5
    let textAppBarSelected = MovistarColorPalette.movistarBlue | MovistarColorPalette.grey2

    // GRADIENTS
    var backgroundBrandGradient: [UIColor] {
        [
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack,
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack,
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack,
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack
        ]
    }

    // TAGS
    var successLow = MovistarColorPalette.movistarGreen10 | MovistarColorPalette.white.withAlphaComponent(0.05)
    var warningLow = MovistarColorPalette.egg10 | MovistarColorPalette.white.withAlphaComponent(0.05)
    var errorLow = MovistarColorPalette.pepper10 | MovistarColorPalette.white.withAlphaComponent(0.05)
    var promoLow = MovistarColorPalette.purple10 | MovistarColorPalette.white.withAlphaComponent(0.05)
    var brandLow = MovistarColorPalette.movistarBlue10 | MovistarColorPalette.white.withAlphaComponent(0.05)
    var successHigh = MovistarColorPalette.movistarGreen70 | MovistarColorPalette.movistarGreen40
    var warningHigh = MovistarColorPalette.egg80 | MovistarColorPalette.egg40
    var errorHigh = MovistarColorPalette.pepper70 | MovistarColorPalette.pepper40
    var promoHigh = MovistarColorPalette.purple70 | MovistarColorPalette.purple40
}

public enum MovistarColorPalette {
    public static let movistarBlue = UIColor(hex: "#019DF4")!
    public static let movistarBlue10 = UIColor(hex: "#E6F5FD")!
    public static let movistarBlue20 = UIColor(hex: "#B3E1FB")!
    public static let movistarBlue30 = UIColor(hex: "#80CEF9")!
    public static let movistarBlue40 = UIColor(hex: "#4DBAF7")!
    public static let movistarBlue55 = UIColor(hex: "#008EDD")!

    public static let movistarGreen = UIColor(hex: "#5CB615")!
    public static let movistarGreen10 = UIColor(hex: "#EFF8E8")!
    public static let movistarGreen20 = UIColor(hex: "#CEE9B9")!
    public static let movistarGreen30 = UIColor(hex: "#ADDA8A")!
    public static let movistarGreen40 = UIColor(hex: "#8DCC5B")!
    public static let movistarGreen60 = UIColor(hex: "#499110")!
    public static let movistarGreen70 = UIColor(hex: "#407F0F")!

    public static let pepper = UIColor(hex: "#FF374A")!
    public static let pepper10 = UIColor(hex: "#FFEBED")!
    public static let pepper20 = UIColor(hex: "#FFC3C8")!
    public static let pepper40 = UIColor(hex: "#FF7380")!
    public static let pepper55 = UIColor(hex: "#D73241")!
    public static let pepper70 = UIColor(hex: "#B22634")!

    public static let egg = UIColor(hex: "#F28D15")!
    public static let egg10 = UIColor(hex: "#FEF4E8")!
    public static let egg25 = UIColor(hex: "#FAD1A1")!
    public static let egg40 = UIColor(hex: "#F6AF5B")!
    public static let egg80 = UIColor(hex: "#6D3F09")!

    public static let pink = UIColor(hex: "#E63780")!
    public static let purple = UIColor(hex: "#A13EA1")!
    public static let purple10 = UIColor(hex: "#F6ECF6")!
    public static let purple40 = UIColor(hex: "#BD78BD")!
    public static let purple70 = UIColor(hex: "#712B71")!

    public static let grey1 = UIColor(hex: "#F6F6F6")!
    public static let grey2 = UIColor(hex: "#EEEEEE")!
    public static let grey3 = UIColor(hex: "#DDDDDD")!
    public static let grey4 = UIColor(hex: "#999999")!
    public static let grey5 = UIColor(hex: "#86888C")!
    public static let grey6 = UIColor(hex: "#313235")!
    public static let white = UIColor(hex: "#FFFFFF")!

    public static let movistarProminentBlue = UIColor(hex: "#0B2739")!
    public static let movistarProminentBlueDark = UIColor(hex: "#081F2D")!
    public static let movistarProminentBlueLight20 = UIColor(hex: "#CED3D7")!
    public static let movistarProminentBlueLight50 = UIColor(hex: "#85939C")!
    public static let movistarProminentBlueLight70 = UIColor(hex: "#546874")!

    public static let darkModeBlack = UIColor(hex: "#191919")!
    public static let darkModeGrey = UIColor(hex: "#242424")!
}
