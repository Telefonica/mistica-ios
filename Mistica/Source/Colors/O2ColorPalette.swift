//
//  O2ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2ColorPalette: ColorPalette {
    
    // BACKGROUNDS
    let appBarBackground = Colors.white
    let background = Colors.white
    let backgroundBrand = Colors.o2BluePrimary
    let backgroundOverlay = Colors.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = Colors.grey1
    let backgroundSkeletonInverse = Colors.white.withAlphaComponent(0.2)
    let navigationBarBackground = Colors.o2BluePrimary
    let navigationSearchBarBackground = Colors.o2BluePrimary
    let backgroundAlternative = Colors.grey1
    let backgroundFeedbackBottom = Colors.o2BluePrimary

    // BORDERS
    let borderLight = Colors.grey1
    let border = Colors.grey3
    let borderDark = Colors.grey5
    let borderSelected = Colors.o2BluePrimary

    // BUTTONS
    let buttonDangerBackground = Colors.pepper
    let buttonDangerBackgroundDisabled = Colors.pepperLight30
    let buttonDangerBackgroundSelected = Colors.pepperDark
    let buttonLinkBackgroundSelected = Colors.o2BluePrimaryLight10
    let buttonLinkBackgroundSelectedInverse = Colors.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = Colors.o2BluePrimary
    let buttonPrimaryBackgroundDisabled = Colors.o2BluePrimaryLight10
    let buttonPrimaryBackgroundDisabledInverse = Colors.o2BluePrimaryLight50
    let buttonPrimaryBackgroundInverse = Colors.white
    let buttonPrimaryBackgroundSelected = Colors.o2BluePrimaryDark
    let buttonPrimaryBackgroundSelectedInverse = Colors.o2BluePrimaryLight50
    let buttonSecondaryBackground = Colors.o2BluePrimary
    let buttonSecondaryBackgroundDisabled = Colors.o2BluePrimaryLight10
    let buttonSecondaryBackgroundSelected = Colors.o2BluePrimaryDark
    let buttonSecondaryBorderDisabledInverse = Colors.o2BluePrimaryLight50
    let buttonSecondaryBorderInverse = Colors.white
    let buttonSecondaryBorderSelectedInverse = Colors.o2BluePrimaryLight50

    let textButtonPrimary = Colors.white
    let textButtonPrimaryInverse = Colors.o2BluePrimary
    let textButtonPrimaryInverseDisabled = Colors.o2BluePrimaryLight10
    let textButtonPrimaryInverseSelected = Colors.o2BluePrimaryDark
    let textButtonSecondary = Colors.o2BluePrimary
    let textButtonSecondaryDisabled = Colors.o2BluePrimaryLight10
    let textButtonSecondarySelected = Colors.o2BluePrimaryDark
    let textButtonSecondaryInverse = Colors.white
    let textButtonSecondaryInverseDisabled = Colors.o2BluePrimaryLight50
    let textButtonSecondaryInverseSelected = Colors.white
    let textLink = Colors.o2BluePrimary
    let textLinkDanger = Colors.pepper
    let textLinkDangerDisabled = Colors.pepperLight30
    let textLinkDisabled = Colors.o2BluePrimaryLight50
    let textLinkSnackbar = Colors.o2BluePrimaryLight50

    // CONTROLS
    let control = Colors.grey3
    let controlActivated = Colors.o2BluePrimary
    let controlError = Colors.pepper
    let loadingBar = Colors.o2BluePrimary
    let loadingBarBackground = Colors.grey1
    let loadingBarBackgroundInverse = Colors.grey1
    let loadingBarInverse = Colors.o2BluePrimary

    // DIVIDERS
    let divider = Colors.grey2
    let dividerInverse = Colors.white.withAlphaComponent(0.2)
    let navigationBarDivider = Colors.o2BluePrimary

    // FEEDBACKS
    let badge = Colors.pepperDark
    let feedbackErrorBackground = Colors.pepper
    let feedbackInfoBackground = Colors.grey6

    // GLOBAL
    let brand = Colors.o2BluePrimary // antes iconBrand
    let inverse = Colors.white // antes iconInverse
    let neutralHigh = Colors.grey6 // antes iconPrimary
    let neutralLow = Colors.grey3 // antes iconDisabled
    let neutralMedium = Colors.grey5 // antes iconSecondary
    let promo = Colors.o2Purple // antes backgroundPromo
    let highlight = Colors.o2Pink

    let textPrimary = Colors.grey6
    let textPrimaryInverse = Colors.white
    let textSecondary = Colors.grey5
    let textSecondaryInverse = Colors.o2BlueLight60
    let textDisabled = Colors.grey3
    let textAmount = Colors.o2BluePrimary

    // STATES
    let error = Colors.pepper // antes iconError
    let success = Colors.o2Green // antes iconSuccess
    let warning = Colors.o2Orange // antes iconWarning

    // BARS TEXTS
    let textNavigationBarPrimary = Colors.white
    let textNavigationBarSecondary = Colors.o2BluePrimaryLight50
    let textNavigationSearchBarHint = Colors.o2BluePrimaryLight50
    let textNavigationSearchBarText = Colors.white
    let textAppBar = Colors.grey4
    let textAppBarSelected = Colors.o2BluePrimary
    
    // GRADIENTS
    let backgroundBrandGradient = [
        Colors.o2BluePrimary,
        Colors.o2BluePrimary,
        Colors.o2BluePrimary,
        Colors.o2BluePrimary
    ]
}

struct O2AppColorPalette: AppColorPalette  {
    
    // MARK: Text
    
    let textSecondaryAlternative = Colors.grey4
    let textHint = Colors.grey4
    let textAccent = Colors.o2Teal
    let gradientBackgroundFirst = Colors.o2BluePrimary
    let gradientBackgroundSecond = Colors.o2BluePrimary
    let gradientBackgroundThird = Colors.o2BluePrimary
    let gradientBackgroundFourth = Colors.o2BluePrimary
    
    // MARK: Search bar

    let navigationsSearchBarBackground = Colors.o2BluePrimaryDark

    // MARK: Bubbles

    let bubbleTimeBackground = Colors.grey6
    let bubbleMeBackground = Colors.grey2
    let bubbleMeBackgroundSelected = Colors.grey3
    let bubbleOtherBackground = Colors.o2BlueLight30
    let bubbleOtherBackgroundSelected = Colors.o2BlueLight60
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.o2BlueMid
    let buttonBotBorder = Colors.o2BlueLight

    // MARK: Assistant
    
    let assistantButtonBackground = Colors.o2BlueLight30.withAlphaComponent(0.25)
    let assistantButtonBackgroundHighlighted = Colors.o2BlueLight60.withAlphaComponent(0.25)
    let assistantButtonBackgroundSelected = Colors.o2BlueLight60.withAlphaComponent(0.25)
    let assistantButtonBackgroundDisabled = Colors.o2BlueLight60.withAlphaComponent(0.25)

    let assistantButtonBorderBackground = Colors.white
    let assistantButtonBorderBackgroundSelected = Colors.o2BlueLight60
    let assistantButtonBorderBackgroundDisabled = Colors.o2BlueLight60

    let assistantButtonNotificationsBackground = Colors.white

    let assistantDivider = Colors.o2BlueLight60
    let assistantArrow = Colors.o2BlueLight60
    let assistantPlaceholderText = Colors.o2BlueLight30
    let assistantCardShadow = Colors.o2BluePrimaryDark.withAlphaComponent(0.40)

    let assistantBadge = Colors.grey6

    // MARK: Charts

    let chartPrimaryInactive = Colors.grey2
    let chartPrimaryActive = Colors.o2BlueMid
    let chartSecondaryInactive = Colors.grey2
    let chartSecondaryActive = Colors.o2Orange
    let ratingInactive = Colors.grey2
    let ratingActive = Colors.o2Orange

    // MARK: Skeletons

    let skeletonBackground = Colors.grey2
    let skeletonWave = Colors.grey1

    // MARK: Progress bars

    let progressBar = Colors.o2BluePrimary

    // MARK: Account Widget

    let amountBillingInfoWarning = Colors.pepperDark
    let chartWarning = Colors.o2Yellow
    let chartWarningLight = Colors.o2Yellow
    let chartBackground = Colors.white.withAlphaComponent(0.40)
    let chartUnlimited = Colors.o2BlueLight
    let chartDanger = Colors.o2Coral
    let chartPrimary = Colors.o2Green
    let chartPrimaryDark = Colors.o2Green
    let chartPrimaryLight = Colors.o2Green
    let chartCritical = Colors.o2Coral

    // MARK: Explore

    let timeIndicatorWarning = Colors.o2Pink

    // MARK: Support

    let textPrimaryOverImage = Colors.grey6
    let textSecondaryOverImage = Colors.grey1
    let tableBackground = Colors.grey1

    // MARK: Notification Inbox

    let scrollContentIndicatorBackgroundFirst = Colors.o2BluePrimary
    let scrollContentIndicatorBackgroundSecond = Colors.o2BluePrimaryDark
}

private enum Colors {
    static let o2BluePrimary = UIColor(hex: "#0019A5")!
    static let o2BluePrimaryDark = UIColor(hex: "#000066")!
    static let o2BluePrimaryLight50 = UIColor(hex: "#808CD2")!
    static let o2BluePrimaryLight10 = UIColor(hex: "#CCD1ED")!
    static let o2BlueMid = UIColor(hex: "#007BB2")!
    static let o2BlueMidDark = UIColor(hex: "#006795")!
    static let o2BlueLight = UIColor(hex: "#41B6E6")!
    static let o2BlueLight60 = UIColor(hex: "#8DD3F0")!
    static let o2BlueLight30 = UIColor(hex: "#C6E9F7")!
    static let o2BlueLight10 = UIColor(hex: "#ECF7FC")!
    static let o2Teal = UIColor(hex: "#01B7B4")!
    static let o2TealDark = UIColor(hex: "#099E9B")!
    static let o2TealLight = UIColor(hex: "#B1E4E3")!
    static let o2Green = UIColor(hex: "#91C90E")!
    static let o2GreenLight = UIColor(hex: "#DEEEB7")!
    static let o2Yellow = UIColor(hex: "#FEDB00")!
    static let o2YellowLight = UIColor(hex: "#FEF6C3")!
    static let o2Orange = UIColor(hex: "#FF7F41")!
    static let o2OrangeLight = UIColor(hex: "#FFD6C2")!
    static let o2Coral = UIColor(hex: "#FF706E")!
    static let o2Pink = UIColor(hex: "#CB31A0")!
    static let o2Purple = UIColor(hex: "#953698")!
    static let pepper = UIColor(hex: "#FF374A")!
    static let pepperDark = UIColor(hex: "#D73241")!
    static let pepperLight30 = UIColor(hex: "#FFC3C8")!
    static let grey1 = UIColor(hex: "#F6F6F6")!
    static let grey2 = UIColor(hex: "#EEEEEE")!
    static let grey3 = UIColor(hex: "#DDDDDD")!
    static let grey4 = UIColor(hex: "#999999")!
    static let grey5 = UIColor(hex: "#707070")!
    static let grey6 = UIColor(hex: "#000033")!
    static let white = UIColor(hex: "#FFFFFF")!
}
