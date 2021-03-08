//
//  MovistarColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct MovistarColorPalette: ColorPalette {
    // BACKGROUNDS
    let appBarBackground = Colors.white
    let background = Colors.white
    let backgroundBrand = Colors.movistarBlue
    let backgroundOverlay = Colors.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = Colors.grey1
    let backgroundSkeletonInverse = Colors.movistarBlueDark
    var navigationBarBackground: UIColor  { UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]) }
    var navigationSearchBarBackground: UIColor { UIColor(Colors.movistarBlueDark, variants: [.prominent: Colors.movistarProminentBlueDark]) }
    let backgroundAlternative = Colors.grey1
    let backgroundFeedbackBottom = Colors.movistarBlue
    let skeletonWave = Colors.grey2
    
    // BORDERS
    let borderLight = Colors.grey1
    let border = Colors.grey3
    let borderDark = Colors.grey5
    let borderSelected = Colors.movistarGreen

    // BUTTONS
    let buttonDangerBackground = Colors.pepper
    let buttonDangerBackgroundDisabled = Colors.pepperLight30
    let buttonDangerBackgroundSelected = Colors.pepperDark
    let buttonDangerBackgroundHover = Colors.pepperDark
    let buttonLinkBackgroundSelected = Colors.movistarBlueLight10
    let buttonLinkBackgroundSelectedInverse = Colors.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = Colors.movistarGreen
    let buttonPrimaryBackgroundDisabled = Colors.movistarGreenLight50
    let buttonPrimaryBackgroundDisabledInverse = Colors.movistarBlueLight50
    let buttonPrimaryBackgroundInverse = Colors.white
    let buttonPrimaryBackgroundSelected = Colors.movistarGreenDark
    let buttonPrimaryBackgroundHover = Colors.movistarGreenDark
    let buttonPrimaryBackgroundSelectedInverse = Colors.movistarBlueLight50
    let buttonSecondaryBackground = Colors.movistarGreen
    let buttonSecondaryBackgroundDisabled = Colors.movistarGreenLight50
    let buttonSecondaryBackgroundSelected = Colors.movistarGreenDark
    let buttonSecondaryBorderDisabledInverse = Colors.movistarBlueLight50
    let buttonSecondaryBorderInverse = Colors.white
    let buttonSecondaryBorderSelectedInverse = Colors.movistarBlueLight50

    let textButtonPrimary = Colors.white
    let textButtonPrimaryInverse = Colors.movistarBlue
    let textButtonPrimaryInverseDisabled = Colors.movistarBlueLight30
    let textButtonPrimaryInverseSelected = Colors.movistarBlue
    let textButtonSecondary = Colors.movistarGreen
    let textButtonSecondaryDisabled = Colors.movistarGreenLight50
    let textButtonSecondarySelected = Colors.movistarGreenDark
    let textButtonSecondaryInverse = Colors.white
    let textButtonSecondaryInverseDisabled = Colors.movistarBlueLight50
    let textButtonSecondaryInverseSelected = Colors.white
    let textLink = Colors.movistarBlue
    let textLinkDanger = Colors.pepper
    let textLinkDangerDisabled = Colors.pepperLight30
    let textLinkDisabled = Colors.movistarBlueLight50
    let textLinkSnackbar = Colors.movistarBlueLight50

    // CONTROLS
    let control = Colors.grey3
    let controlActivated = Colors.movistarBlue
    let controlError = Colors.pepper
    let loadingBar = Colors.movistarGreen
    let loadingBarBackground = Colors.movistarGreenLight50
    let loadingBarBackgroundInverse = Colors.movistarBlueDark
    let loadingBarInverse = Colors.movistarBlueLight50

    // DIVIDERS
    let divider = Colors.grey2
    var navigationBarDivider: UIColor { UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]) }

    // FEEDBACKS
    let badge = Colors.pepperDark
    let feedbackErrorBackground = Colors.pepper
    let feedbackInfoBackground = Colors.grey6

    // GLOBAL
    let brand = Colors.movistarBlue // antes iconBrand
    let inverse = Colors.white // antes iconInverse
    let neutralHigh = Colors.grey6 // antes iconPrimary
    let neutralLow = Colors.grey3 // antes iconDisabled
    let neutralMedium = Colors.grey5 // antes iconSecondary
    let promo = Colors.purple // antes backgroundPromo
    let highlight = Colors.pink

    let textPrimary = Colors.grey6
    let textPrimaryInverse = Colors.white
    let textSecondary = Colors.grey5
    let textSecondaryInverse = Colors.movistarBlueLight30
    let textDisabled = Colors.grey3
    let textAmount = Colors.movistarBlue

    // STATES
    let error = Colors.pepper // antes iconError
    let success = Colors.movistarGreen // antes iconSuccess
    let warning = Colors.egg // antes iconWarning

    // BARS TEXTS
    let textNavigationBarPrimary = Colors.white
    var textNavigationBarSecondary: UIColor { UIColor(Colors.movistarBlueLight30, variants: [.prominent: Colors.movistarProminentBlueLight30]) }
    let textNavigationSearchBarHint = Colors.movistarBlueLight30
    let textNavigationSearchBarText = Colors.white
    let textAppBar = Colors.grey4
    var textAppBarSelected: UIColor { UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]) }
    
    // GRADIENTS
    var backgroundBrandGradient: [UIColor] {
        [
            UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]),
            UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]),
            UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]),
            UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
        ]
    }
}

struct MovistarAppColorPalette: AppColorPalette  {   
    
    // MARK: Text
    
    let textSecondaryAlternative = Colors.white
    let textHint = Colors.grey2
    let textAccent = Colors.movistarGreen
    let gradientBackgroundFirst = Colors.movistarBlue
    let gradientBackgroundSecond = Colors.movistarBlue
    let gradientBackgroundThird = Colors.movistarBlue
    let gradientBackgroundFourth = Colors.movistarBlue
    
    // MARK: Bubbles

    let bubbleTimeBackground = Colors.corporate
    let bubbleMeBackground = Colors.grey1
    let bubbleMeBackgroundSelected = Colors.grey2
    let bubbleOtherBackground = Colors.movistarGreenLight30
    let bubbleOtherBackgroundSelected = Colors.movistarGreenLight50
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.movistarGreen
    let buttonBotBorder = Colors.movistarGreenLight30

    // MARK: Assistant

    let assistantButtonBackground = Colors.movistarBlueLight30.withAlphaComponent(0.25)
    let assistantButtonBackgroundHighlighted = Colors.movistarBlueLight50.withAlphaComponent(0.25)
    let assistantButtonBackgroundSelected = Colors.movistarBlueLight50.withAlphaComponent(0.25)
    let assistantButtonBackgroundDisabled = Colors.movistarBlueLight50.withAlphaComponent(0.25)

    let assistantButtonBorderBackground = Colors.white
    let assistantButtonBorderBackgroundSelected = Colors.movistarBlueLight60
    let assistantButtonBorderBackgroundDisabled = Colors.movistarBlueLight60

    let assistantButtonNotificationsBackground = Colors.white

    let assistantDivider = Colors.movistarBlueLight60
    let assistantArrow = Colors.movistarBlueLight30
    let assistantPlaceholderText = Colors.movistarBlueLight30
    let assistantCardShadow = Colors.movistarBlueDark.withAlphaComponent(0.8)

    let assistantBadge = Colors.movistarBlue

    // MARK: Charts

    let chartPrimaryInactive = Colors.grey2
    let chartPrimaryActive = Colors.movistarGreen
    let chartSecondaryInactive = Colors.movistarBlueLight30
    let chartSecondaryActive = Colors.movistarBlue
    let ratingInactive = Colors.grey2
    let ratingActive = Colors.egg
    
    // MARK: Account Widget

    let amountBillingInfoWarning = Colors.pink
    let chartWarning = Colors.egg
    let chartWarningLight = Colors.eggLight
    let chartBackground = Colors.white.withAlphaComponent(0.4)
    let chartUnlimited = Colors.movistarGreenLight50
    let chartDanger = Colors.pink
    let chartPrimary = Colors.movistarGreen
    let chartPrimaryDark = Colors.movistarGreenDark
    let chartPrimaryLight = Colors.movistarGreenLight30
    let chartCritical = Colors.white.withAlphaComponent(0.4)

    // MARK: Explore

    let timeIndicatorWarning = Colors.pink

    // MARK: Support

    var textPrimaryOverImage: UIColor {
        UIColor(Colors.grey6, variants: [.prominent: Colors.white])
    }

    var textSecondaryOverImage: UIColor {
        UIColor(Colors.grey4, variants: [.prominent: Colors.white])
    }
    
    // MARK: Background
    
    let assistantBackgroundGradient = [
        Colors.movistarBlue,
        Colors.movistarBlue,
        Colors.movistarBlue,
        Colors.movistarBlue
    ]
}

private enum Colors {
    // Mistica
    static let movistarBlue = UIColor(hex: "#019DF4")!
    static let movistarBlueDark = UIColor(hex: "#008EDD")!
    static let movistarBlueLight50 = UIColor(hex: "#80CEF9")!
    static let movistarBlueLight30 = UIColor(hex: "#B3E1FB")!
    static let movistarBlueLight10 = UIColor(hex: "#E6F5FD")!
    static let movistarBlueLight50Percent25 = UIColor(hex: "#E3F4FD")!
    static let movistarBlueLight30Percent25 = UIColor(hex: "#ECF7FE")!
    static let movistarGreen = UIColor(hex: "#5CB615")!
    static let movistarGreenDark = UIColor(hex: "#499110")!
    static let movistarGreenLight50 = UIColor(hex: "#ADDA8A")!
    static let movistarGreenLight30 = UIColor(hex: "#CEE9B9")!
    static let pepper = UIColor(hex: "#FF374A")!
    static let pepperDark = UIColor(hex: "#D73241")!
    static let pepperLight30 = UIColor(hex: "#FFC3C8")!
    static let egg = UIColor(hex: "#F28D15")!
    static let eggLight = UIColor(hex: "#F8D2B3")!
    static let pink = UIColor(hex: "#E63780")!
    static let purple = UIColor(hex: "#A13EA1")!
    static let grey1 = UIColor(hex: "#F6F6F6")!
    static let grey2 = UIColor(hex: "#EEEEEE")!
    static let grey3 = UIColor(hex: "#DDDDDD")!
    static let grey4 = UIColor(hex: "#999999")!
    static let grey5 = UIColor(hex: "#86888C")!
    static let grey6 = UIColor(hex: "#313235")!
    static let white = UIColor(hex: "#FFFFFF")!
    static let movistarProminentBlue = UIColor(hex: "#0B2739")!
    static let movistarProminentBlueDark = UIColor(hex: "#081F2D")!
    static let movistarProminentBlueLight20 = UIColor(hex :"#CED3D7")
    static let movistarProminentBlueLight50 = UIColor(hex :"#85939C")
    static let movistarProminentBlueLight70 = UIColor(hex :"#546874")
    
    #warning("Remove")
    static let corporate = UIColor(r: 25, g: 25, b: 25)
    static let movistarProminentBlueLight30 = UIColor(r: 182, g: 190, b: 195, a: 64)
    static let movistarBlueLight60 = UIColor(r: 101, g: 195, b: 248)
}
