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
    let backgroundOverlay = Colors.grey6 // al 60% de opacidad
    let backgroundSkeleton = Colors.grey1
    let backgroundSkeletonInverse = Colors.movistarBlueDark
    var navigationBarBackground: UIColor  { UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]) }
    let navigationSearchBarBackground = Colors.movistarBlueDark
    let backgroundAlternative = Colors.grey1
    let backgroundFeedbackBottom = Colors.movistarBlue

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
    let textButtonSecondaryDisabled = Colors.movistarGreenLight30
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
    let backgroundBrandGradient = [
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]),
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]),
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue]),
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    ]
}

struct MovistarAppColorPalette: AppColorPalette  {
    
    // MARK: Text
    let textSecondaryAlternative = Colors.white
    let textHint = Colors.grey2
    let textAccent = Colors.movistarGreen
    let textInputLabel = Colors.movistarBlue
    let textInputLabelError = Colors.pepper
    let gradientBackgroundFirst = Colors.movistarGradientFirst
    let gradientBackgroundSecond = Colors.movistarGradientSecond
    let gradientBackgroundThird = Colors.movistarGradientThird
    let gradientBackgroundFourth = Colors.movistarGradientFourth
    
    // MARK: Search bar

    var navigationsSearchBarBackground: UIColor {
        UIColor(Colors.movistarBlueDark, variants: [.prominent: Colors.movistarProminentBlueDark])
    }
    
    var navigationSearchBarHintText: UIColor {
        UIColor(Colors.movistarBlueLight30, variants: [.prominent: Colors.movistarProminentBlueLight30])
    }
    
    let iconNavigationBar = Colors.white

    // MARK: Buttons
    
    let buttonTertiaryBackground = Colors.grey2
    let buttonTertiaryBackgroundSelected = Colors.grey3
    let buttonTertiaryBackgroundDisabled = Colors.grey2
    let quickActionPrimaryBackground = Colors.grey6
    let quickActionBackgroundDestructive = Colors.pepper

    // MARK: Controls

    let controlHighlighted = Colors.grey1

    // MARK: Bubbles

    let bubbleTimeBackground = Colors.corporate
    let bubbleMeBackground = Colors.grey1
    let bubbleMeBackgroundSelected = Colors.grey2
    let bubbleOtherBackground = Colors.movistarGreenLight30
    let bubbleOtherBackgroundSelected = Colors.movistarGreenLight50
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.movistarGreen
    let buttonBotBorder = Colors.movistarGreenLight30
    let accentBackground = Colors.movistarGreen

    // MARK: Assistant

    let assistantButtonBackground = Colors.movistarBlueLight30Percent25
    let assistantButtonBackgroundHighlighted = Colors.movistarBlueLight60Percent25
    let assistantButtonBackgroundSelected = Colors.movistarBlueLight60Percent25
    let assistantButtonBackgroundDisabled = Colors.movistarBlueLight60Percent25

    let assistantButtonBorderBackground = Colors.white
    let assistantButtonBorderBackgroundSelected = Colors.movistarBlueLight60
    let assistantButtonBorderBackgroundDisabled = Colors.movistarBlueLight60

    let assistantButtonNotificationsBackground = Colors.white

    let assistantDivider = Colors.movistarBlueLight60
    let assistantArrow = Colors.movistarBlueLight30
    let assistantPlaceholderText = Colors.movistarBlueLight30
    let assistantCardShadow = Colors.movistarBlueDarkPercent80

    let assistantBadge = Colors.movistarBlue

    // MARK: Charts

    let chartPrimaryInactive = Colors.grey2
    let chartPrimaryActive = Colors.movistarGreen
    let chartSecondaryInactive = Colors.movistarBlueLight30
    let chartSecondaryActive = Colors.movistarBlue
    let ratingInactive = Colors.grey2
    let ratingActive = Colors.egg

    // MARK: Skeletons

    let skeletonBackground = Colors.grey2
    let skeletonWave = Colors.grey1

    // MARK: Progress bars

    let progressBar = Colors.movistarGreen

    // MARK: Status

    let tagBackgroundFirst = Colors.movistarGreen
    let tagBackgroundSecond = Colors.grey3
    let tagBackgroundThird = Colors.movistarBlue
    let tagBackgroundFourth = Colors.egg

    // MARK: Account Widget

    let amountBillingInfoWarning = Colors.pink
    let chartWarning = Colors.egg
    let chartWarningLight = Colors.eggLight
    let chartBackground = Colors.whitePercent40
    let chartUnlimited = Colors.movistarGreenLight50
    let chartDanger = Colors.pink
    let chartPrimary = Colors.movistarGreen
    let chartPrimaryDark = Colors.movistarGreenDark
    let chartPrimaryLight = Colors.movistarGreenLight30
    let chartCritical = Colors.whitePercent40

    // MARK: Explore

    let timeIndicatorWarning = Colors.pink

    // MARK: Support

    var textPrimaryOverImage: UIColor {
        UIColor(Colors.grey6, variants: [.prominent: Colors.white])
    }

    var textSecondaryOverImage: UIColor {
        UIColor(Colors.grey4, variants: [.prominent: Colors.white])
    }

    var tableBackground: UIColor {
        UIColor(.white, variants: [.prominent: Colors.grey1])
    }

    // MARK: Notification Inbox

    let scrollContentIndicatorBackgroundFirst = Colors.movistarBlue
    let scrollContentIndicatorBackgroundSecond = Colors.movistarBlueDark

    // MARK: Cells

    let cellBackgroundHighlighted = Colors.grey2
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
    

    // App
    static let whitePercent20 = UIColor(r: 255, g: 255, b: 255, a: 51)
    static let whitePercent40 = UIColor(r: 255, g: 255, b: 255, a: 102)
    static let movistarBlueLight60 = UIColor(r: 101, g: 195, b: 248)
    static let movistarBlueDarkPercent80 = UIColor(r: 0, g: 142, b: 221, a: 204)
    static let movistarBlueLight60Percent25 = UIColor(r: 101, g: 195, b: 248, a: 64)
    static let corporate = UIColor(r: 25, g: 25, b: 25)
    static let movistarProminentBlueLight30 = UIColor(r: 182, g: 190, b: 195, a: 64)
    
    static let movistarGradientFirst = UIColor(r: 1, g: 157, b: 244)
    static let movistarGradientSecond = UIColor(r: 1, g: 157, b: 244)
    static let movistarGradientThird = UIColor(r: 1, g: 157, b: 244)
    static let movistarGradientFourth = UIColor(r: 1, g: 157, b: 244)
}
