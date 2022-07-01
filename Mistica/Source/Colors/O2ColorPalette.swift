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
    let backgroundOverlay = O2ColorPalette.grey6.withAlphaComponent(0.6) | O2ColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = O2ColorPalette.grey1 | O2ColorPalette.darkModeGrey6
    let backgroundSkeletonInverse = O2ColorPalette.white | O2ColorPalette.darkModeGrey6
    let navigationBarBackground = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack
    let backgroundAlternative = O2ColorPalette.grey1 | O2ColorPalette.darkModeGrey
    let backgroundFeedbackBottom = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack
    let skeletonWave = O2ColorPalette.grey2 | O2ColorPalette.grey5

    // BORDERS
    let borderLight = O2ColorPalette.grey1 | O2ColorPalette.darkModeBlack
    let border = O2ColorPalette.grey3 | O2ColorPalette.darkModeGrey
    let borderDark = O2ColorPalette.grey5 | O2ColorPalette.grey5
    let borderSelected = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary

    // BUTTONS
    let buttonDangerBackground = O2ColorPalette.pepper
    let buttonDangerBackgroundSelected = O2ColorPalette.pepper60

    let buttonLinkBackgroundSelected = O2ColorPalette.o2BluePrimary10 | O2ColorPalette.white.withAlphaComponent(0.05)
    let buttonLinkBackgroundSelectedInverse = O2ColorPalette.white.withAlphaComponent(0.2) | O2ColorPalette.white.withAlphaComponent(0.05)

    let buttonPrimaryBackground = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary
    let buttonPrimaryBackgroundInverse = O2ColorPalette.white | O2ColorPalette.darkModeO2BluePrimary
    let buttonPrimaryBackgroundSelected = O2ColorPalette.o2BluePrimary70 | O2ColorPalette.darkModeO2BluePrimaryDark
    let buttonPrimaryBackgroundHover = O2ColorPalette.o2BluePrimary70 | O2ColorPalette.darkModeO2BluePrimaryDark
    let buttonPrimaryBackgroundSelectedInverse = O2ColorPalette.o2BluePrimary30 | O2ColorPalette.darkModeO2BluePrimaryDark

    let buttonSecondaryBackground = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary
    let buttonSecondaryBackgroundSelected = O2ColorPalette.o2BluePrimary70 | O2ColorPalette.darkModeO2BluePrimaryDark
    let buttonSecondaryBorderInverse = O2ColorPalette.white | O2ColorPalette.darkModeO2BluePrimary
    let buttonSecondaryBorderSelectedInverse = O2ColorPalette.o2BluePrimary30 | O2ColorPalette.darkModeO2BluePrimaryDark

    let textButtonPrimary = O2ColorPalette.white | O2ColorPalette.grey2
    let textButtonPrimaryInverse = O2ColorPalette.o2BluePrimary | O2ColorPalette.grey2
    let textButtonPrimaryInverseSelected = O2ColorPalette.o2BluePrimary70 | O2ColorPalette.grey2

    let textButtonSecondary = O2ColorPalette.o2BluePrimary | O2ColorPalette.grey2
    let textButtonSecondarySelected = O2ColorPalette.o2BluePrimary70 | O2ColorPalette.grey4
    let textButtonSecondaryInverse = O2ColorPalette.white | O2ColorPalette.grey2
    let textButtonSecondaryInverseSelected = O2ColorPalette.white | O2ColorPalette.grey4

    let textLink = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimary30
    let textLinkInverse = O2ColorPalette.white | O2ColorPalette.o2BluePrimary30
    let textLinkDanger = O2ColorPalette.pepper
    let textLinkSnackbar = O2ColorPalette.o2BluePrimary30

    // CONTROLS
    let control = O2ColorPalette.grey3 | O2ColorPalette.darkModeGrey6
    let controlActivated = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimary30
    let controlError = O2ColorPalette.pepper
    let loadingBar = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeO2BluePrimary
    let loadingBarBackground = O2ColorPalette.grey1 | O2ColorPalette.darkModeGrey6

    // DIVIDERS
    let divider = O2ColorPalette.grey2 | O2ColorPalette.white.withAlphaComponent(0.05)
    let dividerInverse = O2ColorPalette.white | O2ColorPalette.white.withAlphaComponent(0.05)
    let navigationBarDivider = O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack

    // FEEDBACKS
    let badge = O2ColorPalette.pepper60
    let feedbackErrorBackground = O2ColorPalette.pepper
    let feedbackInfoBackground = O2ColorPalette.grey6 | O2ColorPalette.darkModeGrey6

    // GLOBAL
    let brand = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimary30
    let brandDark = O2ColorPalette.o2BluePrimary70 | O2ColorPalette.darkModeGrey6
    let inverse = O2ColorPalette.white | O2ColorPalette.grey2
    let neutralHigh = O2ColorPalette.grey6 | O2ColorPalette.grey2
    let neutralMedium = O2ColorPalette.grey5 | O2ColorPalette.grey5
    let neutralLow = O2ColorPalette.grey3 | O2ColorPalette.darkModeGrey6
    let promo = O2ColorPalette.o2Purple
    let highlight = O2ColorPalette.o2Pink

    let textPrimary = O2ColorPalette.grey6 | O2ColorPalette.grey2
    let textPrimaryInverse = O2ColorPalette.white | O2ColorPalette.grey2
    let textSecondary = O2ColorPalette.grey5 | O2ColorPalette.grey4
    let textSecondaryInverse = O2ColorPalette.white | O2ColorPalette.grey4
    let textAmount = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimary10

    // STATES
    let error = O2ColorPalette.pepper
    let success = O2ColorPalette.o2Green
    let warning = O2ColorPalette.o2Orange

    // BARS TEXTS
    let textNavigationBarPrimary = O2ColorPalette.white | O2ColorPalette.grey2
    let textNavigationBarSecondary = O2ColorPalette.o2BluePrimary30 | O2ColorPalette.grey4
    let textNavigationSearchBarHint = O2ColorPalette.o2BluePrimary30 | O2ColorPalette.grey4
    let textNavigationSearchBarText = O2ColorPalette.white | O2ColorPalette.grey2
    let textAppBar = O2ColorPalette.grey4 | O2ColorPalette.grey5
    let textAppBarSelected = O2ColorPalette.o2BluePrimary | O2ColorPalette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [
        O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack,
        O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack,
        O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack,
        O2ColorPalette.o2BluePrimary | O2ColorPalette.darkModeBlack
    ]

    // TAGS
    var tagBackgroundSuccess = O2ColorPalette.o2Green10 | O2ColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundWarning = O2ColorPalette.o2Orange10 | O2ColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundError = O2ColorPalette.pepper10 | O2ColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundPromo = O2ColorPalette.o2Purple10 | O2ColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundActive = O2ColorPalette.o2BluePrimary10 | O2ColorPalette.white.withAlphaComponent(0.05)
    var tagBackgroundInactive = O2ColorPalette.grey1 | O2ColorPalette.white.withAlphaComponent(0.05)
    var textTagSuccess = O2ColorPalette.o2Green80 | O2ColorPalette.o2Green40
    var textTagWarning = O2ColorPalette.o2Orange75 | O2ColorPalette.o2Orange40
    var textTagError = O2ColorPalette.pepper60 | O2ColorPalette.pepper40
    var textTagPromo = O2ColorPalette.o2Purple | O2ColorPalette.o2Purple30
    var textTagActive = O2ColorPalette.o2BluePrimary | O2ColorPalette.o2BluePrimary15
    var textTagInactive = O2ColorPalette.grey5 | O2ColorPalette.grey4
}

public enum O2ColorPalette {
    public static let o2BluePrimary = UIColor(hex: "#0019A5")!
    public static let o2BluePrimary10 = UIColor(hex: "#E5E8F6")!
    public static let o2BluePrimary15 = UIColor(hex: "#CCD1ED")!
    public static let o2BluePrimary30 = UIColor(hex: "#808CD2")!
    public static let o2BluePrimary70 = UIColor(hex: "#000066")!

    public static let o2BlueMid = UIColor(hex: "#0090D0")!
    public static let o2BlueLight = UIColor(hex: "#41B6E6")!
    public static let o2BlueLight30 = UIColor(hex: "#C6E9F7")!
    public static let o2BlueLight35 = UIColor(hex: "#8DD3F0")!

    public static let o2Teal = UIColor(hex: "#01B7B4")!
    public static let o2Green = UIColor(hex: "#91C90E")!
    public static let o2Green10 = UIColor(hex: "#F4FAE7")!
    public static let o2Green40 = UIColor(hex: "#B2D956")!
    public static let o2Green80 = UIColor(hex: "#415A06")!

    public static let o2Yellow = UIColor(hex: "#FEDB00")!

    public static let o2Orange = UIColor(hex: "#FF7F41")!
    public static let o2Orange10 = UIColor(hex: "#FFF2EC")!
    public static let o2Orange40 = UIColor(hex: "#FFA57A")!
    public static let o2Orange75 = UIColor(hex: "#A6522A")!

    public static let o2Pink = UIColor(hex: "#E45DBF")!
    public static let o2Purple = UIColor(hex: "#952D98")!
    public static let o2Purple10 = UIColor(hex: "#F4EAF5")!
    public static let o2Purple30 = UIColor(hex: "#CA9ACB")!

    public static let pepper = UIColor(hex: "#F4364C")!
    public static let pepper10 = UIColor(hex: "#FEEBED")!
    public static let pepper20 = UIColor(hex: "#FCC3C9")!
    public static let pepper40 = UIColor(hex: "#FF7380")!
    public static let pepper60 = UIColor(hex: "#C32B3D")!

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
