//
//  MovistarColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct MovistarColors: Colors {
    // BACKGROUNDS
    let appBarBackground = MovistarColorPalette.white | MovistarColorPalette.darkModeGrey
    let background = MovistarColorPalette.white | MovistarColorPalette.darkModeBlack
    let backgroundContainer = MovistarColorPalette.white | MovistarColorPalette.darkModeGrey
    let backgroundBrand = MovistarColorPalette.movistarBlue | MovistarColorPalette.darkModeBlack
    let backgroundOverlay = MovistarColorPalette.grey6.withAlphaComponent(0.6) | MovistarColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = MovistarColorPalette.grey1 | MovistarColorPalette.grey6
    let backgroundSkeletonInverse = MovistarColorPalette.movistarBlueDark | MovistarColorPalette.grey6
    var navigationBarBackground: UIColor {
        UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack
    }
    let backgroundAlternative = MovistarColorPalette.grey1 | MovistarColorPalette.darkModeGrey // (seguramente mejor darkModeBlack)
    let backgroundFeedbackBottom = MovistarColorPalette.movistarBlue | MovistarColorPalette.darkModeBlack
    let skeletonWave = MovistarColorPalette.grey2 | MovistarColorPalette.grey5

    // BORDERS
    let borderLight = MovistarColorPalette.grey1 | MovistarColorPalette.darkModeBlack
    let border = MovistarColorPalette.grey3 | MovistarColorPalette.darkModeGrey
    let borderDark = MovistarColorPalette.grey5
    let borderSelected = MovistarColorPalette.movistarGreen

    // BUTTONS
    let buttonDangerBackground = MovistarColorPalette.pepper
    let buttonDangerBackgroundDisabled = MovistarColorPalette.pepperLight30 | MovistarColorPalette.darkModeGrey
    let buttonDangerBackgroundSelected = MovistarColorPalette.pepperDark
    let buttonDangerBackgroundHover = MovistarColorPalette.pepperDark

    let buttonLinkBackgroundSelected = MovistarColorPalette.movistarBlueLight10 | MovistarColorPalette.darkModeGrey
    let buttonLinkBackgroundSelectedInverse = MovistarColorPalette.white.withAlphaComponent(0.2) | MovistarColorPalette.darkModeGrey

    let buttonPrimaryBackground = MovistarColorPalette.movistarGreen | MovistarColorPalette.movistarGreen
    let buttonPrimaryBackgroundDisabled = MovistarColorPalette.movistarGreenLight50 | MovistarColorPalette.darkModeGrey
    let buttonPrimaryBackgroundDisabledInverse = MovistarColorPalette.movistarBlueLight50 | MovistarColorPalette.darkModeGrey
    let buttonPrimaryBackgroundInverse = MovistarColorPalette.white | MovistarColorPalette.movistarGreen
    let buttonPrimaryBackgroundSelected = MovistarColorPalette.movistarGreenDark | MovistarColorPalette.movistarGreenDark
    let buttonPrimaryBackgroundHover = MovistarColorPalette.movistarGreenDark | MovistarColorPalette.movistarGreenDark // web only
    let buttonPrimaryBackgroundSelectedInverse = MovistarColorPalette.movistarBlueLight50 | MovistarColorPalette.movistarGreenDark

    let buttonSecondaryBackground = MovistarColorPalette.movistarGreen | MovistarColorPalette.movistarGreen
    let buttonSecondaryBackgroundDisabled = MovistarColorPalette.movistarGreenLight50 | MovistarColorPalette.darkModeGrey
    let buttonSecondaryBackgroundSelected = MovistarColorPalette.movistarGreenDark | MovistarColorPalette.movistarGreenDark
    let buttonSecondaryBorderDisabledInverse = MovistarColorPalette.movistarBlueLight50 | MovistarColorPalette.darkModeGrey
    let buttonSecondaryBorderInverse = MovistarColorPalette.white | MovistarColorPalette.movistarGreen
    let buttonSecondaryBorderSelectedInverse = MovistarColorPalette.movistarBlueLight50 | MovistarColorPalette.movistarGreenDark

    let textButtonPrimary = MovistarColorPalette.white | MovistarColorPalette.grey2
    let textButtonPrimaryDisabled = MovistarColorPalette.white | MovistarColorPalette.grey5
    let textButtonPrimaryInverse = MovistarColorPalette.movistarBlue | MovistarColorPalette.grey2
    let textButtonPrimaryInverseDisabled = MovistarColorPalette.movistarBlueLight30 | MovistarColorPalette.grey5
    let textButtonPrimaryInverseSelected = MovistarColorPalette.movistarBlue | MovistarColorPalette.grey2

    let textButtonSecondary = MovistarColorPalette.movistarGreen | MovistarColorPalette.grey2
    let textButtonSecondaryDisabled = MovistarColorPalette.movistarGreenLight50 | MovistarColorPalette.grey5
    let textButtonSecondarySelected = MovistarColorPalette.movistarGreenDark | MovistarColorPalette.movistarGreenDark
    let textButtonSecondaryInverse = MovistarColorPalette.white | MovistarColorPalette.grey2
    let textButtonSecondaryInverseDisabled = MovistarColorPalette.movistarBlueLight50 | MovistarColorPalette.grey5
    let textButtonSecondaryInverseSelected = MovistarColorPalette.white | MovistarColorPalette.movistarGreenDark

    let textLink = MovistarColorPalette.movistarBlue | MovistarColorPalette.movistarBlue
    let textLinkDanger = MovistarColorPalette.pepper
    let textLinkDangerDisabled = MovistarColorPalette.pepperLight30
    let textLinkDisabled = MovistarColorPalette.movistarBlueLight50 | MovistarColorPalette.grey5
    let textLinkSnackbar = MovistarColorPalette.movistarBlueLight50

    // CONTROLS
    let control = MovistarColorPalette.grey3 | MovistarColorPalette.grey6
    let controlActivated = MovistarColorPalette.movistarBlue | MovistarColorPalette.movistarBlue
    let controlError = MovistarColorPalette.pepper
    let loadingBar = MovistarColorPalette.movistarGreen | MovistarColorPalette.movistarBlue
    let loadingBarBackground = MovistarColorPalette.movistarGreenLight50 | MovistarColorPalette.darkModeGrey
    let loadingBarBackgroundInverse = MovistarColorPalette.movistarBlueDark | MovistarColorPalette.movistarGreenDark
    let loadingBarInverse = MovistarColorPalette.movistarBlueLight50 | MovistarColorPalette.movistarGreenLight50

    // DIVIDERS
    let divider = MovistarColorPalette.grey2 | MovistarColorPalette.darkModeGrey
    let dividerInverse = MovistarColorPalette.movistarBlueDark | MovistarColorPalette.grey6
    var navigationBarDivider: UIColor {
        UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack
    }

    // FEEDBACKS
    let badge = MovistarColorPalette.pepperDark
    let feedbackErrorBackground = MovistarColorPalette.pepper
    let feedbackInfoBackground = MovistarColorPalette.grey6

    // GLOBAL
    let brand = MovistarColorPalette.movistarBlue
    let brandDark = MovistarColorPalette.movistarBlueDark | MovistarColorPalette.grey6
    let inverse = MovistarColorPalette.white | MovistarColorPalette.grey2
    let neutralHigh = MovistarColorPalette.grey6 | MovistarColorPalette.grey4
    let neutralMedium = MovistarColorPalette.grey5 | MovistarColorPalette.grey5
    let neutralLow = MovistarColorPalette.grey3 | MovistarColorPalette.grey6
    let promo = MovistarColorPalette.purple
    let highlight = MovistarColorPalette.pink

    let textPrimary = MovistarColorPalette.grey6 | MovistarColorPalette.grey2
    let textPrimaryInverse = MovistarColorPalette.white | MovistarColorPalette.grey2
    let textSecondary = MovistarColorPalette.grey5 | MovistarColorPalette.grey4
    let textSecondaryInverse = MovistarColorPalette.white | MovistarColorPalette.grey4
    let textDisabled = MovistarColorPalette.grey3 | MovistarColorPalette.grey5
    let textAmount = MovistarColorPalette.movistarBlue | MovistarColorPalette.movistarBlueLight50

    // STATES
    let error = MovistarColorPalette.pepper
    let success = MovistarColorPalette.movistarGreen
    let warning = MovistarColorPalette.egg

    // BARS TEXTS
    let textNavigationBarPrimary = MovistarColorPalette.white | MovistarColorPalette.grey2
    var textNavigationBarSecondary: UIColor {
        UIColor(MovistarColorPalette.movistarBlueLight30, variants: [.prominent: MovistarColorPalette.movistarProminentBlueLight20]) | MovistarColorPalette.grey4
    }
    let textNavigationSearchBarHint = MovistarColorPalette.movistarBlueLight30 | MovistarColorPalette.grey4 // iOS only
    let textNavigationSearchBarText = MovistarColorPalette.white // iOS only
    let textAppBar = MovistarColorPalette.grey4 | MovistarColorPalette.grey5
    var textAppBarSelected: UIColor {
        UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.grey2
    }

    // GRADIENTS
    var backgroundBrandGradient: [UIColor] {
        [
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack,
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack,
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack,
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) | MovistarColorPalette.darkModeBlack
        ]
    }
}

public enum MovistarColorPalette {
    public static let movistarBlue = UIColor(hex: "#019DF4")!
    public static let movistarBlueDark = UIColor(hex: "#008EDD")!
    public static let movistarBlueLight50 = UIColor(hex: "#80CEF9")!
    public static let movistarBlueLight30 = UIColor(hex: "#B3E1FB")!
    public static let movistarBlueLight10 = UIColor(hex: "#E6F5FD")!
    public static let movistarGreen = UIColor(hex: "#5CB615")!
    public static let movistarGreenDark = UIColor(hex: "#499110")!
    public static let movistarGreenLight50 = UIColor(hex: "#ADDA8A")!
    public static let movistarGreenLight30 = UIColor(hex: "#CEE9B9")!
    public static let pepper = UIColor(hex: "#FF374A")!
    public static let pepperDark = UIColor(hex: "#D73241")!
    public static let pepperLight30 = UIColor(hex: "#FFC3C8")!
    public static let egg = UIColor(hex: "#F28D15")!
    public static let eggLight = UIColor(hex: "#F8D2B3")!
    public static let pink = UIColor(hex: "#E63780")!
    public static let purple = UIColor(hex: "#A13EA1")!
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
    public static let darkModeMovistarBlueDark = UIColor(hex: "#4C7389")!
    public static let darkModeMovistarGreenDark = UIColor(hex: "#637951")!
    public static let darkModePepperDark = UIColor(hex: "#8C5A5E")!
