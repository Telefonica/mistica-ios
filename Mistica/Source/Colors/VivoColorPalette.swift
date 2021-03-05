//
//  VivoColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct VivoColorPalette: ColorPalette {
    // BACKGROUNDS
    let appBarBackground = Colors.white
    let background = Colors.white
    let backgroundBrand = Colors.vivoPurple
    let backgroundOverlay = Colors.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = Colors.grey1
    let backgroundSkeletonInverse = Colors.white.withAlphaComponent(0.2)
    let navigationBarBackground = Colors.vivoPurple
    let navigationSearchBarBackground = Colors.vivoPurpleDark
    let backgroundAlternative = Colors.grey1
    let backgroundFeedbackBottom = Colors.vivoPurple
    let skeletonWave = Colors.grey2
    
    // BORDERS
    let borderLight = Colors.grey1
    let border = Colors.grey3
    let borderDark = Colors.grey5
    let borderSelected = Colors.vivoPurple

    // BUTTONS
    let buttonDangerBackground = Colors.pepper
    let buttonDangerBackgroundDisabled = Colors.pepperLight30
    let buttonDangerBackgroundSelected = Colors.pepperDark
    let buttonDangerBackgroundHover = Colors.pepperDark
    let buttonLinkBackgroundSelected = Colors.vivoPurpleLight10
    let buttonLinkBackgroundSelectedInverse = Colors.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = Colors.vivoPurple
    let buttonPrimaryBackgroundDisabled = Colors.vivoPurpleLight20
    let buttonPrimaryBackgroundDisabledInverse = Colors.vivoPurpleLight50
    let buttonPrimaryBackgroundInverse = Colors.white
    let buttonPrimaryBackgroundSelected = Colors.vivoPurpleDark
    let buttonPrimaryBackgroundHover = Colors.vivoPurpleDark
    let buttonPrimaryBackgroundSelectedInverse = Colors.vivoPurpleLight50
    let buttonSecondaryBackground = Colors.vivoPurple
    let buttonSecondaryBackgroundDisabled = Colors.vivoPurpleLight20
    let buttonSecondaryBackgroundSelected = Colors.vivoPurpleDark
    let buttonSecondaryBorderDisabledInverse = Colors.vivoPurpleLight50
    let buttonSecondaryBorderInverse = Colors.white
    let buttonSecondaryBorderSelectedInverse = Colors.vivoPurpleLight50

    let textButtonPrimary = Colors.white
    let textButtonPrimaryInverse = Colors.vivoPurple
    let textButtonPrimaryInverseDisabled = Colors.vivoPurpleLight20
    let textButtonPrimaryInverseSelected = Colors.vivoPurple
    let textButtonSecondary = Colors.vivoPurple
    let textButtonSecondaryDisabled = Colors.vivoPurpleLight20
    let textButtonSecondarySelected = Colors.vivoPurpleDark
    let textButtonSecondaryInverse = Colors.white
    let textButtonSecondaryInverseDisabled = Colors.vivoPurpleLight50
    let textButtonSecondaryInverseSelected = Colors.white
    let textLink = Colors.vivoPurple
    let textLinkDanger = Colors.pepper
    let textLinkDangerDisabled = Colors.pepperLight30
    let textLinkDisabled = Colors.vivoPurpleLight50
    let textLinkSnackbar = Colors.vivoPurpleLight50

    // CONTROLS
    let control = Colors.grey3
    let controlActivated = Colors.vivoPurple
    let controlError = Colors.pepper
    let loadingBar = Colors.pink
    let loadingBarBackground = Colors.pepperLight30
    let loadingBarBackgroundInverse = Colors.vivoPurpleLight50
    let loadingBarInverse = Colors.vivoPurple

    // DIVIDERS
    let divider = Colors.grey2
    let dividerInverse = Colors.white.withAlphaComponent(0.2)
    let navigationBarDivider = Colors.vivoPurple

    // FEEDBACKS
    let badge = Colors.pepperDark
    let feedbackErrorBackground = Colors.pepper
    let feedbackInfoBackground = Colors.grey6

    // GLOBAL
    let brand = Colors.vivoPurple // antes iconBrand
    let inverse = Colors.white // antes iconInverse
    let neutralHigh = Colors.grey6 // antes iconPrimary
    let neutralLow = Colors.grey3 // antes iconDisabled
    let neutralMedium = Colors.grey5 // antes iconSecondary
    let promo = Colors.vivoPurple // antes backgroundPromo
    let highlight = Colors.pink

    let textPrimary = Colors.grey6
    let textPrimaryInverse = Colors.white
    let textSecondary = Colors.grey5
    let textSecondaryInverse = Colors.vivoPurpleLight50
    let textDisabled = Colors.grey3
    let textAmount = Colors.vivoPurple

    // STATES
    let error = Colors.pepper // antes iconError
    let success = Colors.vivoGreen // antes iconSuccess
    let warning = Colors.orange // antes iconWarning

    // BARS TEXTS
    let textNavigationBarPrimary = Colors.white
    let textNavigationBarSecondary = Colors.vivoPurpleLight50
    let textNavigationSearchBarHint = Colors.vivoPurpleLight50 // solo en iOS
    let textNavigationSearchBarText = Colors.white // solo en iOS
    let textAppBar = Colors.grey4
    let textAppBarSelected = Colors.vivoPurple
    
    // GRADIENTS
    let backgroundBrandGradient = [
        Colors.vivoPurple,
        Colors.vivoPurple,
        Colors.vivoPurple,
        Colors.vivoPurple
    ]
}

struct VivoAppColorPalette: AppColorPalette  {
    
    // MARK: Text
    
    let textSecondaryAlternative = Colors.grey4
    let textHint = Colors.grey4
    let textAccent = Colors.vivoGreen
    let gradientBackgroundFirst = Colors.vivoPurple
    let gradientBackgroundSecond = Colors.vivoPurple
    let gradientBackgroundThird = Colors.vivoPurple
    let gradientBackgroundFourth = Colors.vivoPurple

    // MARK: Bubbles

    let bubbleTimeBackground = Colors.grey6
    let bubbleMeBackground = Colors.grey2
    let bubbleMeBackgroundSelected = Colors.grey3
    let bubbleOtherBackground = Colors.vivoPurpleLight10
    let bubbleOtherBackgroundSelected = Colors.vivoPurpleLight80
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.vivoGreen
    let buttonBotBorder = Colors.vivoGreenLight40

    // MARK: Assistant
    
    let assistantButtonBackground = Colors.vivoPurpleLight30.withAlphaComponent(0.25)
    let assistantButtonBackgroundHighlighted = Colors.vivoPurpleLight50.withAlphaComponent(0.25)
    let assistantButtonBackgroundSelected = Colors.vivoPurpleLight50.withAlphaComponent(0.25)
    let assistantButtonBackgroundDisabled = Colors.vivoPurpleLight50.withAlphaComponent(0.25)

    let assistantButtonBorderBackground = Colors.white
    let assistantButtonBorderBackgroundSelected = Colors.vivoPurpleLight50
    let assistantButtonBorderBackgroundDisabled = Colors.vivoPurpleLight50

    let assistantButtonNotificationsBackground = Colors.white

    let assistantDivider = Colors.vivoPurpleLight50
    let assistantArrow = Colors.vivoPurpleLight40
    let assistantPlaceholderText = Colors.vivoPurpleLight40
    let assistantCardShadow = Colors.vivoPurpleDark.withAlphaComponent(0.8)

    let assistantBadge = Colors.vivoPurple

    // MARK: Charts

    let chartPrimaryInactive = Colors.grey2
    let chartPrimaryActive = Colors.vivoPurple
    let chartSecondaryInactive = Colors.grey2
    let chartSecondaryActive = Colors.vivoPurple
    let ratingInactive = Colors.grey2
    let ratingActive = Colors.pepperLight30

    // MARK: Account Widget

    let amountBillingInfoWarning = Colors.pink
    let chartWarning = Colors.orange
    let chartWarningLight = Colors.orangeLight
    let chartBackground = Colors.white.withAlphaComponent(0.40)
    let chartUnlimited = Colors.vivoGreenLight40
    let chartDanger = Colors.pink
    let chartPrimary = Colors.vivoGreen
    let chartPrimaryDark = Colors.vivoGreenDark
    let chartPrimaryLight = Colors.vivoGreenLight40
    let chartCritical = Colors.white.withAlphaComponent(0.40)

    // MARK: Explore

    let timeIndicatorWarning = Colors.pink

    // MARK: Support

    let textPrimaryOverImage = Colors.grey6
    let textSecondaryOverImage = Colors.grey1
    let tableBackground = Colors.grey1

    // MARK: Notification Inbox

    let scrollContentIndicatorBackgroundFirst = Colors.vivoPurple
    let scrollContentIndicatorBackgroundSecond = Colors.vivoPurpleDark
}

private enum Colors {
    static let vivoPurple = UIColor(hex: "#660099")!
    static let vivoPurpleDark = UIColor(hex: "#461E5F")!
    static let vivoPurpleLight90 = UIColor(hex: "#751AA3")!
    static let vivoPurpleLight80 = UIColor(hex: "#8433AD")!
    static let vivoPurpleLight50 = UIColor(hex: "#B280CC")!
    static let vivoPurpleLight20 = UIColor(hex: "#E0CCEB")!
    static let vivoPurpleLight10 = UIColor(hex: "#EFE5F4")!
    static let vivoGreen = UIColor(hex: "#99CC33")!
    static let vivoGreenDark = UIColor(hex: "#33A14A")!
    static let vivoGreenLight40 = UIColor(hex: "#D6EAAD")!
    static let vivoBlue = UIColor(hex: "#00ABDB")!
    static let orange = UIColor(hex: "#FF9900")!
    static let orangeDark = UIColor(hex: "#FA6324")!
    static let orangeLight = UIColor(hex: "#FFD699")!
    static let pink = UIColor(hex: "#EB3D7D")!
    static let pepper = UIColor(hex: "#CC1F59")!
    static let pepperDark = UIColor(hex: "#B71D63")!
    static let pepperLight30 = UIColor(hex: "#F7B1CB")!
    static let grey1 = UIColor(hex: "#F6F6F6")!
    static let grey2 = UIColor(hex: "#EEEEEE")!
    static let grey3 = UIColor(hex: "#DDDDDD")!
    static let grey4 = UIColor(hex: "#999999")!
    static let grey5 = UIColor(hex: "#666666")!
    static let grey6 = UIColor(hex: "#000000")!
    static let white = UIColor(hex: "#FFFFFF")!
    
    #warning("Check")
    static let vivoPurpleLight30 = UIColor(hex: "#d1b2e0")!
    static let vivoPurpleLight40 = UIColor(hex: "#c199d6")!
}
