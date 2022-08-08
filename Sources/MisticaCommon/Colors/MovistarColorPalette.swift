//
//  MovistarColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct MovistarColors: MisticaColors {
    static let palette = MovistarColorPalette()
    
    // BACKGROUNDS
    let appBarBackground = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey
    let background = MovistarColors.palette.white | MovistarColors.palette.darkModeBlack
    let backgroundContainer = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey
    var backgroundBrand: UIColor { MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack }
    let backgroundOverlay = MovistarColors.palette.grey6.withAlphaComponent(0.6) | MovistarColors.palette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = MovistarColors.palette.grey1 | MovistarColors.palette.grey6
    let backgroundSkeletonInverse = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.grey6
    var navigationBarBackground: UIColor { MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack }

    let backgroundAlternative = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeGrey
    var backgroundFeedbackBottom: UIColor { MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack }
    let skeletonWave = MovistarColors.palette.grey2 | MovistarColors.palette.grey5

    // BORDERS
    let borderLight = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeBlack
    let border = MovistarColors.palette.grey3 | MovistarColors.palette.darkModeGrey
    let borderDark = MovistarColors.palette.grey5
    let borderSelected = MovistarColors.palette.movistarBlue

    // BUTTONS
    let buttonDangerBackground = MovistarColors.palette.pepper
    let buttonDangerBackgroundSelected = MovistarColors.palette.pepper55
    let buttonDangerBackgroundHover = MovistarColors.palette.pepper55

    let buttonLinkBackgroundSelected = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.white.withAlphaComponent(0.05)
    let buttonLinkBackgroundSelectedInverse = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.05)

    let buttonPrimaryBackground = MovistarColors.palette.movistarBlue
    let buttonPrimaryBackgroundInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlue
    let buttonPrimaryBackgroundSelected = MovistarColors.palette.movistarBlue55
    let buttonPrimaryBackgroundHover = MovistarColors.palette.movistarBlue55
    let buttonPrimaryBackgroundSelectedInverse = MovistarColors.palette.movistarBlue30 | MovistarColors.palette.movistarBlue55

    let buttonSecondaryBackground = MovistarColors.palette.movistarBlue
    let buttonSecondaryBackgroundSelected = MovistarColors.palette.movistarBlue55
    let buttonSecondaryBorderInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlue
    let buttonSecondaryBorderSelectedInverse = MovistarColors.palette.movistarBlue30 | MovistarColors.palette.movistarBlue55

    let textButtonPrimary = MovistarColors.palette.white | MovistarColors.palette.grey2
    let textButtonPrimaryInverse = MovistarColors.palette.movistarBlue | MovistarColors.palette.grey2
    let textButtonPrimaryInverseSelected = MovistarColors.palette.movistarBlue | MovistarColors.palette.grey2

    let textButtonSecondary = MovistarColors.palette.movistarBlue | MovistarColors.palette.grey2
    let textButtonSecondaryDisabled = MovistarColors.palette.movistarGreen30 | MovistarColors.palette.grey5
    let textButtonSecondarySelected = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.grey4
    let textButtonSecondaryInverse = MovistarColors.palette.white | MovistarColors.palette.grey2
    let textButtonSecondaryInverseSelected = MovistarColors.palette.white | MovistarColors.palette.grey4

    let textLink = MovistarColors.palette.movistarBlue
    let textLinkInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlue
    let textLinkDanger = MovistarColors.palette.pepper
    let textLinkSnackbar = MovistarColors.palette.movistarBlue30

    // CONTROLS
    let control = MovistarColors.palette.grey3 | MovistarColors.palette.grey6
    var controlActivated: UIColor { MovistarColors.palette.movistarBlueWithProminentVariant }
    let controlError = MovistarColors.palette.pepper
    let loadingBar = MovistarColors.palette.movistarBlue30 | MovistarColors.palette.movistarBlue
    let loadingBarBackground = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey

    // DIVIDERS
    let divider = MovistarColors.palette.grey2 | MovistarColors.palette.white.withAlphaComponent(0.05)
    var dividerInverse: UIColor { MovistarColors.palette.movistarBlue55WithProminentVariant | MovistarColors.palette.white.withAlphaComponent(0.05) }
    var navigationBarDivider: UIColor { MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack }

    // FEEDBACKS
    let badge = MovistarColors.palette.pepper55
    let feedbackErrorBackground = MovistarColors.palette.pepper
    let feedbackInfoBackground = MovistarColors.palette.grey6

    // GLOBAL
    var brand: UIColor { MovistarColors.palette.movistarBlueWithProminentVariant }
    var brandHigh: UIColor { MovistarColors.palette.movistarBlue55WithProminentVariant | MovistarColors.palette.white.withAlphaComponent(0.05) }
    let inverse = MovistarColors.palette.white | MovistarColors.palette.grey2
    let neutralHigh = MovistarColors.palette.grey6 | MovistarColors.palette.grey2
    let neutralMedium = MovistarColors.palette.grey5
    let neutralLow = MovistarColors.palette.grey1 | MovistarColors.palette.grey6
    let promo = MovistarColors.palette.purple
    let highlight = MovistarColors.palette.pink

    let textPrimary = MovistarColors.palette.grey6 | MovistarColors.palette.grey2
    let textPrimaryInverse = MovistarColors.palette.white | MovistarColors.palette.grey2
    let textSecondary = MovistarColors.palette.grey5 | MovistarColors.palette.grey4
    let textSecondaryInverse = MovistarColors.palette.white | MovistarColors.palette.grey4

    // STATES
    let error = MovistarColors.palette.pepper
    let success = MovistarColors.palette.movistarGreen
    let warning = MovistarColors.palette.egg

    // BARS TEXTS
    let textNavigationBarPrimary = MovistarColors.palette.white | MovistarColors.palette.grey2
    let textNavigationBarSecondary = MovistarColors.palette.movistarBlue20 | MovistarColors.palette.grey4
    let textNavigationSearchBarHint = MovistarColors.palette.movistarBlue20 | MovistarColors.palette.grey4 // iOS only
    let textNavigationSearchBarText = MovistarColors.palette.white | MovistarColors.palette.grey2 // iOS only
    let textAppBar = MovistarColors.palette.grey4 | MovistarColors.palette.grey5
    var textAppBarSelected: UIColor { MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.grey2 }

    // GRADIENTS
    var backgroundBrandGradient: [UIColor] {
        [
            MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack,
            MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack,
            MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack,
            MovistarColors.palette.movistarBlueWithProminentVariant | MovistarColors.palette.darkModeBlack
        ]
    }

    // TAGS
    var successLow = MovistarColors.palette.movistarGreen10 | MovistarColors.palette.white.withAlphaComponent(0.05)
    var warningLow = MovistarColors.palette.egg10 | MovistarColors.palette.white.withAlphaComponent(0.05)
    var errorLow = MovistarColors.palette.pepper10 | MovistarColors.palette.white.withAlphaComponent(0.05)
    var promoLow = MovistarColors.palette.purple10 | MovistarColors.palette.white.withAlphaComponent(0.05)
    var brandLow = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.white.withAlphaComponent(0.05)
    var successHigh = MovistarColors.palette.movistarGreen70 | MovistarColors.palette.movistarGreen40
    var warningHigh = MovistarColors.palette.egg80 | MovistarColors.palette.egg40
    var errorHigh = MovistarColors.palette.pepper70 | MovistarColors.palette.pepper40
    var promoHigh = MovistarColors.palette.purple70 | MovistarColors.palette.purple40
}

public struct MovistarColorPalette {
    public init() { }

    public let movistarBlue = UIColor(hex: "#019DF4")!
    public let movistarBlue10 = UIColor(hex: "#E6F5FD")!
    public let movistarBlue20 = UIColor(hex: "#B3E1FB")!
    public let movistarBlue30 = UIColor(hex: "#80CEF9")!
    public let movistarBlue40 = UIColor(hex: "#4DBAF7")!
    public let movistarBlue55 = UIColor(hex: "#008EDD")!

    public let movistarGreen = UIColor(hex: "#5CB615")!
    public let movistarGreen10 = UIColor(hex: "#EFF8E8")!
    public let movistarGreen20 = UIColor(hex: "#CEE9B9")!
    public let movistarGreen30 = UIColor(hex: "#ADDA8A")!
    public let movistarGreen40 = UIColor(hex: "#8DCC5B")!
    public let movistarGreen60 = UIColor(hex: "#499110")!
    public let movistarGreen70 = UIColor(hex: "#407F0F")!

    public let pepper = UIColor(hex: "#FF374A")!
    public let pepper10 = UIColor(hex: "#FFEBED")!
    public let pepper20 = UIColor(hex: "#FFC3C8")!
    public let pepper40 = UIColor(hex: "#FF7380")!
    public let pepper55 = UIColor(hex: "#D73241")!
    public let pepper70 = UIColor(hex: "#B22634")!

    public let egg = UIColor(hex: "#F28D15")!
    public let egg10 = UIColor(hex: "#FEF4E8")!
    public let egg25 = UIColor(hex: "#FAD1A1")!
    public let egg40 = UIColor(hex: "#F6AF5B")!
    public let egg80 = UIColor(hex: "#6D3F09")!

    public let pink = UIColor(hex: "#E63780")!
    public let purple = UIColor(hex: "#A13EA1")!
    public let purple10 = UIColor(hex: "#F6ECF6")!
    public let purple40 = UIColor(hex: "#BD78BD")!
    public let purple70 = UIColor(hex: "#712B71")!

    public let grey1 = UIColor(hex: "#F6F6F6")!
    public let grey2 = UIColor(hex: "#EEEEEE")!
    public let grey3 = UIColor(hex: "#DDDDDD")!
    public let grey4 = UIColor(hex: "#999999")!
    public let grey5 = UIColor(hex: "#86888C")!
    public let grey6 = UIColor(hex: "#313235")!
    public let white = UIColor(hex: "#FFFFFF")!

    public let movistarProminentBlue = UIColor(hex: "#0B2739")!
    public let movistarProminentBlueDark = UIColor(hex: "#081F2D")!
    public let movistarProminentBlueLight20 = UIColor(hex: "#CED3D7")!
    public let movistarProminentBlueLight50 = UIColor(hex: "#85939C")!
    public let movistarProminentBlueLight70 = UIColor(hex: "#546874")!

    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!

    // Prominent and default
    public var movistarBlueWithProminentVariant: UIColor {
        UIColor(MovistarColors.palette.movistarBlue, variants: [.prominent: MovistarColors.palette.movistarProminentBlue])
    }

    public var movistarBlue55WithProminentVariant: UIColor {
        UIColor(MovistarColors.palette.movistarBlue55, variants: [.prominent: MovistarColors.palette.movistarProminentBlueDark])
    }
}
