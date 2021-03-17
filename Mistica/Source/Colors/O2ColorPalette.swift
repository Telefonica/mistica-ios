//
//  O2ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2Colors: Colors {
    // BACKGROUNDS
    let appBarBackground = O2ColorPalette.white | O2ColorPalette.darkModeGrey
    let background = O2ColorPalette.white | O2ColorPalette.darkModeBlack
    let backgroundContainer = O2ColorPalette.white | O2ColorPalette.darkModeGrey
    let backgroundBrand = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack
    let backgroundOverlay = O2ColorPalette.grey6 /* alpha 60% */ | O2ColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = O2ColorPalette.grey1 | O2ColorPalette.darkModeGrey6
    let backgroundSkeletonInverse = O2ColorPalette.white.withAlphaComponent(0.2)  | O2ColorPalette.darkModeGrey6
    let navigationBarBackground = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack
    let backgroundAlternative = O2ColorPalette.grey1 | O2ColorPalette.darkModeGrey
    let backgroundFeedbackBottom = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack
    let skeletonWave = O2ColorPalette.grey2 | O2ColorPalette.grey5

    // BORDERS
    let borderLight = O2ColorPalette.grey1 | O2ColorPalette.darkModeBlack
    let border = O2ColorPalette.grey3 | O2ColorPalette.darkModeGrey
    let borderDark = O2ColorPalette.grey5 | O2ColorPalette.grey5
    let borderSelected = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary

    //BUTTONS
    let buttonDangerBackground = O2ColorPalette.pepper
    let buttonDangerBackgroundDisabled = O2ColorPalette.pepperLight30 | O2ColorPalette.darkModeGrey
    let buttonDangerBackgroundSelected = O2ColorPalette.pepperDark
    let buttonDangerBackgroundHover = O2ColorPalette.pepperDark // web only

    let buttonLinkBackgroundSelected = O2ColorPalette.o2BluePrimaryLight10 | O2ColorPalette.darkModeGrey
    let buttonLinkBackgroundSelectedInverse = O2ColorPalette.white.withAlphaComponent(0.2) | O2ColorPalette.darkModeGrey

    let buttonPrimaryBackground = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary
    let buttonPrimaryBackgroundDisabled = O2ColorPalette.o2BluePrimaryLight10 | O2ColorPalette.darkModeGrey
    let buttonPrimaryBackgroundDisabledInverse = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.darkModeGrey
    let buttonPrimaryBackgroundInverse = O2ColorPalette.white | O2ColorPalette.darkModeO2BluePrimary
    let buttonPrimaryBackgroundSelected = O2ColorPalette.o2BluePrimaryDark | O2ColorPalette.darkModeO2BluePrimaryDark
    let buttonPrimaryBackgroundHover = O2ColorPalette.o2BluePrimaryDark | O2ColorPalette.darkModeO2BluePrimaryDark
    let buttonPrimaryBackgroundSelectedInverse = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.darkModeO2BluePrimaryDark

    let buttonSecondaryBackground = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary
    let buttonSecondaryBackgroundDisabled = O2ColorPalette.o2BluePrimaryLight10 | O2ColorPalette.darkModeGrey
    let buttonSecondaryBackgroundSelected = O2ColorPalette.o2BluePrimaryDark | O2ColorPalette.darkModeO2BluePrimaryDark
    let buttonSecondaryBorderDisabledInverse = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.darkModeGrey
    let buttonSecondaryBorderInverse = O2ColorPalette.white | O2ColorPalette.darkModeO2BluePrimary
    let buttonSecondaryBorderSelectedInverse = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.darkModeO2BluePrimaryDark

    let textButtonPrimary = O2ColorPalette.white | O2ColorPalette.grey2
    let textButtonPrimaryDisabled = O2ColorPalette.white | O2ColorPalette.grey5
    let textButtonPrimaryInverse = O2ColorPalette.o2BluePrimary | O2ColorPalette.grey2
    let textButtonPrimaryInverseDisabled = O2ColorPalette.o2BluePrimaryLight10 | O2ColorPalette.grey5
    let textButtonPrimaryInverseSelected = O2ColorPalette.o2BluePrimaryDark | O2ColorPalette.grey2

    let textButtonSecondary = O2ColorPalette.o2BluePrimary | O2ColorPalette.grey2
    let textButtonSecondaryDisabled = O2ColorPalette.o2BluePrimaryLight10 | O2ColorPalette.grey5
    let textButtonSecondarySelected = O2ColorPalette.o2BluePrimaryDark | O2ColorPalette.grey4
    let textButtonSecondaryInverse = O2ColorPalette.white | O2ColorPalette.grey2
    let textButtonSecondaryInverseDisabled = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.grey5
    let textButtonSecondaryInverseSelected = O2ColorPalette.white | O2ColorPalette.grey4

    let textLink = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimaryLight50
    let textLinkDanger = O2ColorPalette.pepper
    let textLinkDangerDisabled = O2ColorPalette.pepperLight30
    let textLinkDisabled = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.grey5
    let textLinkSnackbar = O2ColorPalette.o2BluePrimaryLight50

    //CONTROLS
    let control = O2ColorPalette.grey3 | O2ColorPalette.darkModeGrey6
    let controlActivated = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimaryLight50
    let controlError = O2ColorPalette.pepper
    let loadingBar = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary
    let loadingBarBackground = O2ColorPalette.grey1 | O2ColorPalette.darkModeGrey6
    let loadingBarBackgroundInverse = O2ColorPalette.grey1 | O2ColorPalette.grey1
    let loadingBarInverse = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary

    //DIVIDERS
    let divider = O2ColorPalette.grey2 | O2ColorPalette.darkModeGrey
    let dividerInverse = O2ColorPalette.white.withAlphaComponent(0.2) |  O2ColorPalette.darkModeGrey
    let navigationBarDivider = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack

    //FEEDBACKS
    let badge = O2ColorPalette.pepperDark
    let feedbackErrorBackground = O2ColorPalette.pepper
    let feedbackInfoBackground = O2ColorPalette.grey6 | O2ColorPalette.darkModeGrey6

    //GLOBAL
    let brand = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimaryLight50
    let brandDark = O2ColorPalette.o2BluePrimaryDark | O2ColorPalette.darkModeGrey6
    let inverse = O2ColorPalette.white | O2ColorPalette.grey2
    let neutralHigh = O2ColorPalette.grey6 | O2ColorPalette.grey4
    let neutralMedium = O2ColorPalette.grey5 | O2ColorPalette.grey5
    let neutralLow = O2ColorPalette.grey3 | O2ColorPalette.darkModeGrey6
    let promo = O2ColorPalette.o2Purple
    let highlight = O2ColorPalette.o2Pink

    let textPrimary = O2ColorPalette.grey6 | O2ColorPalette.grey2
    let textPrimaryInverse = O2ColorPalette.white | O2ColorPalette.grey2
    let textSecondary = O2ColorPalette.grey5 | O2ColorPalette.grey4
    let textSecondaryInverse = O2ColorPalette.white | O2ColorPalette.grey4
    let textDisabled = O2ColorPalette.grey3 | O2ColorPalette.grey5
    let textAmount = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimaryLight10

    //STATES
    let error = O2ColorPalette.pepper
    let success = O2ColorPalette.o2Green
    let warning = O2ColorPalette.o2Orange

    //BARS TEXTS
    let textNavigationBarPrimary = O2ColorPalette.white | O2ColorPalette.grey2
    let textNavigationBarSecondary = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.grey4
    let textNavigationSearchBarHint = O2ColorPalette.o2BluePrimaryLight50 | O2ColorPalette.grey4
    let textNavigationSearchBarText = O2ColorPalette.white | O2ColorPalette.grey2
    let textAppBar = O2ColorPalette.grey4 | O2ColorPalette.grey5
    let textAppBarSelected = O2ColorPalette.o2BluePrimary | O2ColorPalette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [
        O2ColorPalette.o2BluePrimary,
        O2ColorPalette.o2BluePrimary,
        O2ColorPalette.o2BluePrimary,
        O2ColorPalette.o2BluePrimary
    ]
}

public enum O2ColorPalette {
    public static let o2BluePrimary = UIColor(hex: "#0019A5")!
    public static let o2BluePrimaryDark = UIColor(hex: "#000066")!
    public static let o2BluePrimaryLight50 = UIColor(hex: "#808CD2")!
    public static let o2BluePrimaryLight10 = UIColor(hex: "#CCD1ED")!
    public static let o2BlueMid = UIColor(hex: "#007BB2")!
    public static let o2BlueMidDark = UIColor(hex: "#006795")!
    public static let o2BlueLight = UIColor(hex: "#41B6E6")!
    public static let o2BlueLight60 = UIColor(hex: "#8DD3F0")!
    public static let o2BlueLight30 = UIColor(hex: "#C6E9F7")!
    public static let o2BlueLight10 = UIColor(hex: "#ECF7FC")!
    public static let o2Teal = UIColor(hex: "#01B7B4")!
    public static let o2TealDark = UIColor(hex: "#099E9B")!
    public static let o2TealLight = UIColor(hex: "#B1E4E3")!
    public static let o2Green = UIColor(hex: "#91C90E")!
    public static let o2GreenLight = UIColor(hex: "#DEEEB7")!
    public static let o2Yellow = UIColor(hex: "#FEDB00")!
    public static let o2YellowLight = UIColor(hex: "#FEF6C3")!
    public static let o2Orange = UIColor(hex: "#FF7F41")!
    public static let o2OrangeLight = UIColor(hex: "#FFD6C2")!
    public static let o2Coral = UIColor(hex: "#FF706E")!
    public static let o2Pink = UIColor(hex: "#CB31A0")!
    public static let o2Purple = UIColor(hex: "#953698")!
    public static let pepper = UIColor(hex: "#FF374A")!
    public static let pepperDark = UIColor(hex: "#D73241")!
    public static let pepperLight30 = UIColor(hex: "#FFC3C8")!
    public static let grey1 = UIColor(hex: "#F6F6F6")!
    public static let grey2 = UIColor(hex: "#EEEEEE")!
    public static let grey3 = UIColor(hex: "#DDDDDD")!
    public static let grey4 = UIColor(hex: "#999999")!
    public static let grey5 = UIColor(hex: "#707070")!
    public static let grey6 = UIColor(hex: "#000033")!
    public static let white = UIColor(hex: "#FFFFFF")!
    
    public static let darkModeBlack = UIColor(hex: "#191919")!
    public static let darkModeGrey = UIColor(hex: "#242424")!
    public static let darkModeGrey6 = UIColor(hex: "#313235")!
    public static let darkModeO2BluePrimary = UIColor(hex: "#0020D6")!
    public static let darkModeO2BluePrimaryDark = UIColor(hex: "#000099")!
}
