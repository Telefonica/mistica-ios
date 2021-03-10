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
    let appBarBackground = MovistarColorPalette.white
    let background = MovistarColorPalette.white
    let backgroundBrand = MovistarColorPalette.movistarBlue
    let backgroundOverlay = MovistarColorPalette.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = MovistarColorPalette.grey1
    let backgroundSkeletonInverse = MovistarColorPalette.movistarBlueDark
    var navigationBarBackground: UIColor { UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) }
    let backgroundAlternative = MovistarColorPalette.grey1
    let backgroundFeedbackBottom = MovistarColorPalette.movistarBlue
    let skeletonWave = MovistarColorPalette.grey2

    // BORDERS
    let borderLight = MovistarColorPalette.grey1
    let border = MovistarColorPalette.grey3
    let borderDark = MovistarColorPalette.grey5
    let borderSelected = MovistarColorPalette.movistarGreen

    // BUTTONS
    let buttonDangerBackground = MovistarColorPalette.pepper
    let buttonDangerBackgroundDisabled = MovistarColorPalette.pepperLight30
    let buttonDangerBackgroundSelected = MovistarColorPalette.pepperDark
    let buttonLinkBackgroundSelected = MovistarColorPalette.movistarBlueLight10
    let buttonLinkBackgroundSelectedInverse = MovistarColorPalette.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = MovistarColorPalette.movistarGreen
    let buttonPrimaryBackgroundDisabled = MovistarColorPalette.movistarGreenLight50
    let buttonPrimaryBackgroundDisabledInverse = MovistarColorPalette.movistarBlueLight50
    let buttonPrimaryBackgroundInverse = MovistarColorPalette.white
    let buttonPrimaryBackgroundSelected = MovistarColorPalette.movistarGreenDark
    let buttonPrimaryBackgroundSelectedInverse = MovistarColorPalette.movistarBlueLight50
    let buttonSecondaryBackground = MovistarColorPalette.movistarGreen
    let buttonSecondaryBackgroundDisabled = MovistarColorPalette.movistarGreenLight50
    let buttonSecondaryBackgroundSelected = MovistarColorPalette.movistarGreenDark
    let buttonSecondaryBorderDisabledInverse = MovistarColorPalette.movistarBlueLight50
    let buttonSecondaryBorderInverse = MovistarColorPalette.white
    let buttonSecondaryBorderSelectedInverse = MovistarColorPalette.movistarBlueLight50

    let textButtonPrimary = MovistarColorPalette.white
    let textButtonPrimaryInverse = MovistarColorPalette.movistarBlue
    let textButtonPrimaryInverseDisabled = MovistarColorPalette.movistarBlueLight30
    let textButtonPrimaryInverseSelected = MovistarColorPalette.movistarBlue
    let textButtonSecondary = MovistarColorPalette.movistarGreen
    let textButtonSecondaryDisabled = MovistarColorPalette.movistarGreenLight50
    let textButtonSecondarySelected = MovistarColorPalette.movistarGreenDark
    let textButtonSecondaryInverse = MovistarColorPalette.white
    let textButtonSecondaryInverseDisabled = MovistarColorPalette.movistarBlueLight50
    let textButtonSecondaryInverseSelected = MovistarColorPalette.white
    let textLink = MovistarColorPalette.movistarBlue
    let textLinkDanger = MovistarColorPalette.pepper
    let textLinkDangerDisabled = MovistarColorPalette.pepperLight30
    let textLinkDisabled = MovistarColorPalette.movistarBlueLight50
    let textLinkSnackbar = MovistarColorPalette.movistarBlueLight50

    // CONTROLS
    let control = MovistarColorPalette.grey3
    let controlActivated = MovistarColorPalette.movistarBlue
    let controlError = MovistarColorPalette.pepper
    let loadingBar = MovistarColorPalette.movistarGreen
    let loadingBarBackground = MovistarColorPalette.movistarGreenLight50
    let loadingBarBackgroundInverse = MovistarColorPalette.movistarBlueDark
    let loadingBarInverse = MovistarColorPalette.movistarBlueLight50

    // DIVIDERS
    let divider = MovistarColorPalette.grey2
    let dividerInverse = MovistarColorPalette.movistarBlueDark
    var navigationBarDivider: UIColor { UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) }

    // FEEDBACKS
    let badge = MovistarColorPalette.pepperDark
    let feedbackErrorBackground = MovistarColorPalette.pepper
    let feedbackInfoBackground = MovistarColorPalette.grey6

    // GLOBAL
    let brand = MovistarColorPalette.movistarBlue
    let brandDark = MovistarColorPalette.movistarBlueDark
    let inverse = MovistarColorPalette.white
    let neutralHigh = MovistarColorPalette.grey6
    let neutralLow = MovistarColorPalette.grey3
    let neutralMedium = MovistarColorPalette.grey5
    let promo = MovistarColorPalette.purple
    let highlight = MovistarColorPalette.pink

    let textPrimary = MovistarColorPalette.grey6
    let textPrimaryInverse = MovistarColorPalette.white
    let textSecondary = MovistarColorPalette.grey5
    let textSecondaryInverse = MovistarColorPalette.movistarBlueLight30
    let textDisabled = MovistarColorPalette.grey3
    let textAmount = MovistarColorPalette.movistarBlue

    // STATES
    let error = MovistarColorPalette.pepper
    let success = MovistarColorPalette.movistarGreen
    let warning = MovistarColorPalette.egg

    // BARS TEXTS
    let textNavigationBarPrimary = MovistarColorPalette.white
    var textNavigationBarSecondary: UIColor { UIColor(MovistarColorPalette.movistarBlueLight30, variants: [.prominent: MovistarColorPalette.movistarProminentBlueLight20]) }
    let textNavigationSearchBarHint = MovistarColorPalette.movistarBlueLight30
    let textNavigationSearchBarText = MovistarColorPalette.white
    let textAppBar = MovistarColorPalette.grey4
    var textAppBarSelected: UIColor { UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]) }

    // GRADIENTS
    var backgroundBrandGradient: [UIColor] {
        [
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]),
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]),
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue]),
            UIColor(MovistarColorPalette.movistarBlue, variants: [.prominent: MovistarColorPalette.movistarProminentBlue])
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
}
