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
    let appBarBackground = O2ColorPalette.white
    let background = O2ColorPalette.white
    let backgroundBrand = O2ColorPalette.o2BluePrimary
    let backgroundOverlay = O2ColorPalette.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = O2ColorPalette.grey1
    let backgroundSkeletonInverse = O2ColorPalette.white.withAlphaComponent(0.2)
    let navigationBarBackground = O2ColorPalette.o2BluePrimary
    let navigationSearchBarBackground = O2ColorPalette.o2BluePrimary
    let backgroundAlternative = O2ColorPalette.grey1
    let backgroundFeedbackBottom = O2ColorPalette.o2BluePrimary
    let skeletonWave = O2ColorPalette.grey2

    // BORDERS
    let borderLight = O2ColorPalette.grey1
    let border = O2ColorPalette.grey3
    let borderDark = O2ColorPalette.grey5
    let borderSelected = O2ColorPalette.o2BluePrimary

    // BUTTONS
    let buttonDangerBackground = O2ColorPalette.pepper
    let buttonDangerBackgroundDisabled = O2ColorPalette.pepperLight30
    let buttonDangerBackgroundSelected = O2ColorPalette.pepperDark
    let buttonLinkBackgroundSelected = O2ColorPalette.o2BluePrimaryLight10
    let buttonLinkBackgroundSelectedInverse = O2ColorPalette.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = O2ColorPalette.o2BluePrimary
    let buttonPrimaryBackgroundDisabled = O2ColorPalette.o2BluePrimaryLight10
    let buttonPrimaryBackgroundDisabledInverse = O2ColorPalette.o2BluePrimaryLight50
    let buttonPrimaryBackgroundInverse = O2ColorPalette.white
    let buttonPrimaryBackgroundSelected = O2ColorPalette.o2BluePrimaryDark
    let buttonPrimaryBackgroundSelectedInverse = O2ColorPalette.o2BluePrimaryLight50
    let buttonSecondaryBackground = O2ColorPalette.o2BluePrimary
    let buttonSecondaryBackgroundDisabled = O2ColorPalette.o2BluePrimaryLight10
    let buttonSecondaryBackgroundSelected = O2ColorPalette.o2BluePrimaryDark
    let buttonSecondaryBorderDisabledInverse = O2ColorPalette.o2BluePrimaryLight50
    let buttonSecondaryBorderInverse = O2ColorPalette.white
    let buttonSecondaryBorderSelectedInverse = O2ColorPalette.o2BluePrimaryLight50

    let textButtonPrimary = O2ColorPalette.white
    let textButtonPrimaryInverse = O2ColorPalette.o2BluePrimary
    let textButtonPrimaryInverseDisabled = O2ColorPalette.o2BluePrimaryLight10
    let textButtonPrimaryInverseSelected = O2ColorPalette.o2BluePrimaryDark
    let textButtonSecondary = O2ColorPalette.o2BluePrimary
    let textButtonSecondaryDisabled = O2ColorPalette.o2BluePrimaryLight10
    let textButtonSecondarySelected = O2ColorPalette.o2BluePrimaryDark
    let textButtonSecondaryInverse = O2ColorPalette.white
    let textButtonSecondaryInverseDisabled = O2ColorPalette.o2BluePrimaryLight50
    let textButtonSecondaryInverseSelected = O2ColorPalette.white
    let textLink = O2ColorPalette.o2BluePrimary
    let textLinkDanger = O2ColorPalette.pepper
    let textLinkDangerDisabled = O2ColorPalette.pepperLight30
    let textLinkDisabled = O2ColorPalette.o2BluePrimaryLight50
    let textLinkSnackbar = O2ColorPalette.o2BluePrimaryLight50

    // CONTROLS
    let control = O2ColorPalette.grey3
    let controlActivated = O2ColorPalette.o2BluePrimary
    let controlError = O2ColorPalette.pepper
    let loadingBar = O2ColorPalette.o2BluePrimary
    let loadingBarBackground = O2ColorPalette.grey1
    let loadingBarBackgroundInverse = O2ColorPalette.grey1
    let loadingBarInverse = O2ColorPalette.o2BluePrimary

    // DIVIDERS
    let divider = O2ColorPalette.grey2
    let dividerInverse = O2ColorPalette.white.withAlphaComponent(0.2)
    let navigationBarDivider = O2ColorPalette.o2BluePrimary

    // FEEDBACKS
    let badge = O2ColorPalette.pepperDark
    let feedbackErrorBackground = O2ColorPalette.pepper
    let feedbackInfoBackground = O2ColorPalette.grey6

    // GLOBAL
    let brand = O2ColorPalette.o2BluePrimary
    let inverse = O2ColorPalette.white
    let neutralHigh = O2ColorPalette.grey6
    let neutralLow = O2ColorPalette.grey3
    let neutralMedium = O2ColorPalette.grey5
    let promo = O2ColorPalette.o2Purple
    let highlight = O2ColorPalette.o2Pink

    let textPrimary = O2ColorPalette.grey6
    let textPrimaryInverse = O2ColorPalette.white
    let textSecondary = O2ColorPalette.grey5
    let textSecondaryInverse = O2ColorPalette.o2BlueLight60
    let textDisabled = O2ColorPalette.grey3
    let textAmount = O2ColorPalette.o2BluePrimary

    // STATES
    let error = O2ColorPalette.pepper
    let success = O2ColorPalette.o2Green
    let warning = O2ColorPalette.o2Orange

    // BARS TEXTS
    let textNavigationBarPrimary = O2ColorPalette.white
    let textNavigationBarSecondary = O2ColorPalette.o2BluePrimaryLight50
    let textNavigationSearchBarHint = O2ColorPalette.o2BluePrimaryLight50
    let textNavigationSearchBarText = O2ColorPalette.white
    let textAppBar = O2ColorPalette.grey4
    let textAppBarSelected = O2ColorPalette.o2BluePrimary
    
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
}
