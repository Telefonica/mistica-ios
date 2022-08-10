//
//  O2ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2Colors: MisticaColors {
    static let palette = O2ColorPalette()

    // BACKGROUNDS
    let appBarBackground = palette.white | palette.darkModeGrey
    let background = palette.white | palette.darkModeBlack
    let backgroundContainer = palette.white | palette.darkModeGrey
    let backgroundBrand = palette.o2BluePrimary | palette.darkModeBlack
    let backgroundOverlay = palette.grey6.withAlphaComponent(0.6) | palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = palette.grey1 | palette.darkModeGrey6
    let backgroundSkeletonInverse = palette.white | palette.darkModeGrey6
    let navigationBarBackground = palette.o2BluePrimary | palette.darkModeBlack
    let backgroundAlternative = palette.grey1 | palette.darkModeGrey
    let backgroundFeedbackBottom = palette.o2BluePrimary | palette.darkModeBlack
    let skeletonWave = palette.grey2 | palette.grey5

    // BORDERS
    let borderLight = palette.grey1 | palette.darkModeBlack
    let border = palette.grey3 | palette.darkModeGrey
    let borderDark = palette.grey5
    let borderSelected = palette.o2BluePrimary | palette.o2BluePrimary30

    // BUTTONS
    let buttonDangerBackground = palette.pepper
    let buttonDangerBackgroundSelected = palette.pepper60

    let buttonLinkBackgroundSelected = palette.o2BluePrimary10 | palette.white.withAlphaComponent(0.05)
    let buttonLinkBackgroundSelectedInverse = palette.white.withAlphaComponent(0.2) | palette.white.withAlphaComponent(0.05)

    let buttonPrimaryBackground = palette.o2BluePrimary | palette.darkModeO2BluePrimary
    let buttonPrimaryBackgroundInverse = palette.white | palette.darkModeO2BluePrimary
    let buttonPrimaryBackgroundSelected = palette.o2BluePrimary70 | palette.darkModeO2BluePrimaryDark
    let buttonPrimaryBackgroundHover = palette.o2BluePrimary70 | palette.darkModeO2BluePrimaryDark
    let buttonPrimaryBackgroundSelectedInverse = palette.o2BluePrimary30 | palette.darkModeO2BluePrimaryDark

    let buttonSecondaryBackground = palette.o2BluePrimary | palette.darkModeO2BluePrimary
    let buttonSecondaryBackgroundSelected = palette.o2BluePrimary70 | palette.darkModeO2BluePrimaryDark
    let buttonSecondaryBorderInverse = palette.white | palette.darkModeO2BluePrimary
    let buttonSecondaryBorderSelectedInverse = palette.o2BluePrimary30 | palette.darkModeO2BluePrimaryDark

    let textButtonPrimary = palette.white | palette.grey2
    let textButtonPrimaryInverse = palette.o2BluePrimary | palette.grey2
    let textButtonPrimaryInverseSelected = palette.o2BluePrimary70 | palette.grey2

    let textButtonSecondary = palette.o2BluePrimary | palette.grey2
    let textButtonSecondarySelected = palette.o2BluePrimary70 | palette.grey4
    let textButtonSecondaryInverse = palette.white | palette.grey2
    let textButtonSecondaryInverseSelected = palette.white | palette.grey4

    let textLink = palette.o2BluePrimary | palette.o2BluePrimary30
    let textLinkInverse = palette.white | palette.o2BluePrimary30
    let textLinkDanger = palette.pepper
    let textLinkSnackbar = palette.o2BluePrimary30

    // CONTROLS
    let control = palette.grey3 | palette.darkModeGrey6
    let controlActivated = palette.o2BluePrimary | palette.o2BluePrimary30
    let controlError = palette.pepper
    let loadingBar = palette.o2BluePrimary | palette.darkModeO2BluePrimary
    let loadingBarBackground = palette.grey1 | palette.darkModeGrey6

    // DIVIDERS
    let divider = palette.grey2 | palette.white.withAlphaComponent(0.05)
    let dividerInverse = palette.white | palette.white.withAlphaComponent(0.05)
    let navigationBarDivider = palette.o2BluePrimary | palette.darkModeBlack

    // FEEDBACKS
    let badge = palette.pepper60
    let feedbackErrorBackground = palette.pepper
    let feedbackInfoBackground = palette.grey6 | palette.darkModeGrey6

    // GLOBAL
    let brand = palette.o2BluePrimary | palette.o2BluePrimary30
    let brandHigh = palette.o2BluePrimary70 | palette.white.withAlphaComponent(0.05)
    let inverse = palette.white | palette.grey2
    let neutralHigh = palette.grey6 | palette.grey2
    let neutralMedium = palette.grey5
    let neutralLow = palette.grey1 | palette.darkModeGrey6
    let promo = palette.o2Purple
    let highlight = palette.o2Pink

    let textPrimary = palette.grey6 | palette.grey2
    let textPrimaryInverse = palette.white | palette.grey2
    let textSecondary = palette.grey5 | palette.grey4
    let textSecondaryInverse = palette.white | palette.grey4

    // STATES
    let error = palette.pepper
    let success = palette.o2Green
    let warning = palette.o2Orange

    // BARS TEXTS
    let textNavigationBarPrimary = palette.white | palette.grey2
    let textNavigationBarSecondary = palette.o2BluePrimary30 | palette.grey4
    let textNavigationSearchBarHint = palette.o2BluePrimary30 | palette.grey4
    let textNavigationSearchBarText = palette.white | palette.grey2
    let textAppBar = palette.grey4 | palette.grey5
    let textAppBarSelected = palette.o2BluePrimary | palette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [
        palette.o2BluePrimary | palette.darkModeBlack,
        palette.o2BluePrimary | palette.darkModeBlack,
        palette.o2BluePrimary | palette.darkModeBlack,
        palette.o2BluePrimary | palette.darkModeBlack
    ]

    // TAGS
    var successLow = palette.o2Green10 | palette.white.withAlphaComponent(0.05)
    var warningLow = palette.o2Orange10 | palette.white.withAlphaComponent(0.05)
    var errorLow = palette.pepper10 | palette.white.withAlphaComponent(0.05)
    var promoLow = palette.o2Purple10 | palette.white.withAlphaComponent(0.05)
    var brandLow = palette.o2BluePrimary10 | palette.white.withAlphaComponent(0.05)
    var successHigh = palette.o2Green80 | palette.o2Green40
    var warningHigh = palette.o2Orange75 | palette.o2Orange40
    var errorHigh = palette.pepper60 | palette.pepper40
    var promoHigh = palette.o2Purple | palette.o2Purple30
}

public struct O2ColorPalette {
    public init() {}

    public let o2BluePrimary = UIColor(hex: "#0019A5")!
    public let o2BluePrimary10 = UIColor(hex: "#E5E8F6")!
    public let o2BluePrimary15 = UIColor(hex: "#CCD1ED")!
    public let o2BluePrimary30 = UIColor(hex: "#808CD2")!
    public let o2BluePrimary70 = UIColor(hex: "#000066")!

    public let o2BlueMid = UIColor(hex: "#0090D0")!
    public let o2BlueLight = UIColor(hex: "#41B6E6")!
    public let o2BlueLight30 = UIColor(hex: "#C6E9F7")!
    public let o2BlueLight35 = UIColor(hex: "#8DD3F0")!

    public let o2Teal = UIColor(hex: "#01B7B4")!
    public let o2Green = UIColor(hex: "#91C90E")!
    public let o2Green10 = UIColor(hex: "#F4FAE7")!
    public let o2Green40 = UIColor(hex: "#B2D956")!
    public let o2Green80 = UIColor(hex: "#415A06")!

    public let o2Yellow = UIColor(hex: "#FEDB00")!

    public let o2Orange = UIColor(hex: "#FF7F41")!
    public let o2Orange10 = UIColor(hex: "#FFF2EC")!
    public let o2Orange40 = UIColor(hex: "#FFA57A")!
    public let o2Orange75 = UIColor(hex: "#A6522A")!

    public let o2Pink = UIColor(hex: "#E45DBF")!
    public let o2Purple = UIColor(hex: "#952D98")!
    public let o2Purple10 = UIColor(hex: "#F4EAF5")!
    public let o2Purple30 = UIColor(hex: "#CA9ACB")!

    public let pepper = UIColor(hex: "#F4364C")!
    public let pepper10 = UIColor(hex: "#FEEBED")!
    public let pepper20 = UIColor(hex: "#FCC3C9")!
    public let pepper40 = UIColor(hex: "#FF7380")!
    public let pepper60 = UIColor(hex: "#C32B3D")!

    public let grey1 = UIColor(hex: "#F6F6F6")!
    public let grey2 = UIColor(hex: "#EEEEEE")!
    public let grey3 = UIColor(hex: "#DDDDDD")!
    public let grey4 = UIColor(hex: "#999999")!
    public let grey5 = UIColor(hex: "#707070")!
    public let grey6 = UIColor(hex: "#000033")!
    public let white = UIColor(hex: "#FFFFFF")!

    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
    public let darkModeO2BluePrimary = UIColor(hex: "#0020D6")!
    public let darkModeO2BluePrimaryDark = UIColor(hex: "#000099")!
}
