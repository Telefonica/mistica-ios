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
    let backgroundAlternative = BlauColorPalette.blauBlueLight20 | BlauColorPalette.darkModeGrey
    let backgroundBrand = BlauColorPalette.blauBlueLight | BlauColorPalette.darkModeBlack
    let backgroundContainer = BlauColorPalette.white | BlauColorPalette.darkModeGrey
    let backgroundFeedbackBottom = BlauColorPalette.blauBlueLight | BlauColorPalette.darkModeBlack
    let backgroundOverlay = BlauColorPalette.blauBlue.withAlphaComponent(0.75) | BlauColorPalette.darkModeGrey.withAlphaComponent(0.8)
    let backgroundSkeleton = BlauColorPalette.grey1 | BlauColorPalette.grey6
    let backgroundSkeletonInverse = BlauColorPalette.white | BlauColorPalette.grey6
    let navigationBarBackground = BlauColorPalette.blauBlueLight | BlauColorPalette.darkModeBlack
    let skeletonWave = BlauColorPalette.grey3 | BlauColorPalette.grey5
    
    // BORDERS
    let border = BlauColorPalette.grey3 | BlauColorPalette.darkModeGrey
    let borderDark = BlauColorPalette.grey5
    let borderLight = BlauColorPalette.grey1 | BlauColorPalette.darkModeBlack
    let borderSelected = BlauColorPalette.blauBlueDark
    
    // BUTTONS
    let buttonDangerBackground = BlauColorPalette.blauRed
    let buttonDangerBackgroundDisabled = BlauColorPalette.blauRedLight20 | BlauColorPalette.darkModeGrey
    let buttonDangerBackgroundHover = BlauColorPalette.blauRedDark
    let buttonDangerBackgroundSelected = BlauColorPalette.blauRedDark
    
    let buttonLinkBackgroundSelected = BlauColorPalette.blauPurpleLight10 | BlauColorPalette.blauPurpleLight10.withAlphaComponent(0.05)
    let buttonLinkBackgroundSelectedInverse = BlauColorPalette.white.withAlphaComponent(0.2) | BlauColorPalette.white.withAlphaComponent(0.05)
    
    let buttonPrimaryBackground = BlauColorPalette.blauBlue
    let buttonPrimaryBackgroundDisabled = BlauColorPalette.blauBlue30 | BlauColorPalette.darkModeGrey
    let buttonPrimaryBackgroundDisabledInverse = BlauColorPalette.blauBlueLight30 | BlauColorPalette.darkModeGrey
    let buttonPrimaryBackgroundHover = BlauColorPalette.blauBlueDark
    let buttonPrimaryBackgroundInverse = BlauColorPalette.white | BlauColorPalette.blauBlue
    let buttonPrimaryBackgroundSelected = BlauColorPalette.blauBlueDark
    let buttonPrimaryBackgroundSelectedInverse = BlauColorPalette.blauBlueLight30 | BlauColorPalette.blauBlueDark
    
    let buttonSecondaryBackground = BlauColorPalette.blauBlue
    let buttonSecondaryBackgroundDisabled = BlauColorPalette.blauBlue30 | BlauColorPalette.darkModeGrey
    let buttonSecondaryBackgroundSelected = BlauColorPalette.blauBlueDark
    let buttonSecondaryBorderDisabledInverse = BlauColorPalette.blauBlueLight30 | BlauColorPalette.darkModeGrey
    let buttonSecondaryBorderInverse = BlauColorPalette.white | BlauColorPalette.blauBlue
    let buttonSecondaryBorderSelectedInverse = BlauColorPalette.blauBlueLight30 | BlauColorPalette.blauBlueDark
    
    let textButtonPrimary = BlauColorPalette.white | BlauColorPalette.grey2
    let textButtonPrimaryDisabled = BlauColorPalette.white | BlauColorPalette.grey5
    let textButtonPrimaryInverse = BlauColorPalette.blauBlue | BlauColorPalette.grey2
    let textButtonPrimaryInverseDisabled = BlauColorPalette.blauBlueLight10 | BlauColorPalette.grey5
    let textButtonPrimaryInverseSelected = BlauColorPalette.blauBlueDark | BlauColorPalette.grey2
    
    let textButtonSecondary = BlauColorPalette.blauBlue | BlauColorPalette.grey2
    let textButtonSecondaryDisabled = BlauColorPalette.blauBlue60 | BlauColorPalette.grey5
    let textButtonSecondaryInverse = BlauColorPalette.white | BlauColorPalette.grey2
    let textButtonSecondaryInverseDisabled = BlauColorPalette.blauPurpleLight50 | BlauColorPalette.grey5
    let textButtonSecondaryInverseSelected = BlauColorPalette.white | BlauColorPalette.blauBlueDark
    let textButtonSecondarySelected = BlauColorPalette.blauBlueDark | BlauColorPalette.blauBlueDark
    
    let textLink = BlauColorPalette.blauPurple
    let textLinkDanger = BlauColorPalette.blauRed
    let textLinkDangerDisabled = BlauColorPalette.blauPurpleLight50
    let textLinkDisabled = BlauColorPalette.blauPurpleLight50 | BlauColorPalette.blauPurpleLight50
    let textLinkSnackbar = BlauColorPalette.blauPurpleLight50
    
    // CONTROLS
    let control = BlauColorPalette.grey3 | BlauColorPalette.grey6
    let controlActivated = BlauColorPalette.blauBlue
    let controlError = BlauColorPalette.blauRed
    let loadingBar = BlauColorPalette.blauBlue | BlauColorPalette.blauBlue
    let loadingBarBackground = BlauColorPalette.blauBlue10 | BlauColorPalette.grey6
    
    // DIVIDERS
    let divider = BlauColorPalette.grey2 | BlauColorPalette.white.withAlphaComponent(0.05)
    let dividerInverse = BlauColorPalette.white.withAlphaComponent(0.2) | BlauColorPalette.white.withAlphaComponent(0.05)
    let navigationBarDivider = BlauColorPalette.blauBlue | BlauColorPalette.darkModeBlack
    
    // FEEDBACKS
    let badge = BlauColorPalette.blauRedDark
    let feedbackErrorBackground = BlauColorPalette.blauRed
    let feedbackInfoBackground = BlauColorPalette.grey6 | BlauColorPalette.grey5
    
    // GLOBAL
    let brand = BlauColorPalette.blauBlueLight | BlauColorPalette.blauBlue
    let brandDark = BlauColorPalette.blauBlue | BlauColorPalette.grey6
    let inverse = BlauColorPalette.white | BlauColorPalette.grey2
    let neutralHigh = BlauColorPalette.grey6 | BlauColorPalette.grey2
    let neutralLow = BlauColorPalette.grey3 | BlauColorPalette.grey6
    let neutralMedium = BlauColorPalette.grey5 | BlauColorPalette.grey5
    let promo = BlauColorPalette.blauPurple
    let highlight = BlauColorPalette.blauBlueLight
    
    let textAmount = BlauColorPalette.blauBlue | BlauColorPalette.blauBlue
    let textDisabled = BlauColorPalette.grey4 | BlauColorPalette.grey5
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
    let textAppBarSelected = BlauColorPalette.blauBlueDark | BlauColorPalette.blauBlue10
    let textNavigationBarPrimary = BlauColorPalette.white | BlauColorPalette.grey2
    let textNavigationBarSecondary = BlauColorPalette.blauBlue30 | BlauColorPalette.blauBlue30
    let textNavigationSearchBarHint = BlauColorPalette.blauBlue30 | BlauColorPalette.blauBlue30
    let textNavigationSearchBarText = BlauColorPalette.white | BlauColorPalette.grey2

    // GRADIENTS
    let backgroundBrandGradient = [UIColor]()
}

public enum BlauColorPalette {
    public static let blauBlueLight = UIColor(hex: "#00B6F1")!
    public static let blauBlueLight30 = UIColor(hex: "#B3E9FB")!
    public static let blauBlueLight20 = UIColor(hex: "#E5F6FD")!
    public static let blauBlueLight10 = UIColor(hex: "#F7FDFF")!
    public static let blauBlueDark = UIColor(hex: "#005B9D")!
    public static let blauBlue = UIColor(hex: "#0070BF")!
    public static let blauBlue60 = UIColor(hex: "#66A9D9")!
    public static let blauBlue30 = UIColor(hex: "#B3D4EC")!
    public static let blauBlue10 = UIColor(hex: "#E5F1F9")!
    public static let blauPurple = UIColor(hex: "#7814B3")!
    public static let blauPurpleLight50 = UIColor(hex: "#B280CC")!
    public static let blauPurpleLight10 = UIColor(hex: "#F2E8F8")!
    public static let blauYellowDark = UIColor(hex: "#F09500")!
    public static let blauYellow = UIColor(hex: "#FFA922")!
    public static let blauGreen = UIColor(hex: "#30D300")!
    public static let blauRedDark = UIColor(hex: "#E03308")!
    public static let blauRed = UIColor(hex: "#F64417")!
    public static let blauRedLight60 = UIColor(hex: "#FA9E87")!
    public static let blauRedLight20 = UIColor(hex: "#FDDAD1")!
    
    public static let grey1 = UIColor(hex: "#F3F5F6")!
    public static let grey2 = UIColor(hex: "#F2F2F2")!
    public static let grey3 = UIColor(hex: "#E6E6E7")!
    public static let grey4 = UIColor(hex: "#BFC0C2")!
    public static let grey5 = UIColor(hex: "#808285")!
    public static let grey6 = UIColor(hex: "#000000")!
    public static let white = UIColor(hex: "#FFFFFF")!
    
    public static let darkModeBlack = UIColor(hex: "#191919")!
    public static let darkModeGrey = UIColor(hex: "#242424")!
}
