//
//  O2ClassicColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

//
//  O2ColorPalette.swift
//  Mistica
//
//  Created by psanchez on 14/7/17.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//
import UIKit

struct O2ClassicColorPalette: ColorPalette {
    
    // BACKGROUNDS
    let appBarBackground = Colors.white
    let background = Colors.white
    let backgroundBrand = Colors.o2Blue
    let backgroundOverlay = Colors.grey6.withAlphaComponent(0.6)
    let backgroundSkeleton = Colors.grey1
    let backgroundSkeletonInverse = Colors.white.withAlphaComponent(0.2)
    let navigationBarBackground = Colors.o2Blue
    let navigationSearchBarBackground = Colors.o2BlueDark
    let backgroundAlternative = Colors.grey1
    let backgroundFeedbackBottom = Colors.o2GradientFourth
    let skeletonWave = Colors.grey2

    // BORDERS
    let borderLight = Colors.grey1
    let border = Colors.grey3
    let borderDark = Colors.grey5
    let borderSelected = Colors.o2Gem
    
    // BUTTONS
    let buttonDangerBackground = Colors.pepper
    let buttonDangerBackgroundDisabled = Colors.pepperLight30
    let buttonDangerBackgroundSelected = Colors.pepperDark
    let buttonLinkBackgroundSelected = Colors.o2SkyBlueLight10
    let buttonLinkBackgroundSelectedInverse = Colors.white.withAlphaComponent(0.2)
    let buttonPrimaryBackground = Colors.o2SkyBlue
    let buttonPrimaryBackgroundDisabled = Colors.o2SkyBlueLight50
    let buttonPrimaryBackgroundDisabledInverse = Colors.o2SkyBlueLight50
    let buttonPrimaryBackgroundInverse = Colors.white
    let buttonPrimaryBackgroundSelected = Colors.o2SkyBlueDark
    let buttonPrimaryBackgroundSelectedInverse = Colors.o2SkyBlueLight50
    let buttonSecondaryBackground = Colors.o2SkyBlue
    let buttonSecondaryBackgroundDisabled = Colors.o2SkyBlueLight50
    let buttonSecondaryBackgroundSelected = Colors.o2SkyBlueDark
    let buttonSecondaryBorderDisabledInverse = Colors.o2SkyBlueLight50
    let buttonSecondaryBorderInverse = Colors.white
    let buttonSecondaryBorderSelectedInverse = Colors.o2SkyBlueLight50
    
    let textButtonPrimary = Colors.white
    let textButtonPrimaryInverse = Colors.o2SkyBlue
    let textButtonPrimaryInverseDisabled = Colors.o2SkyBlueLight30
    let textButtonPrimaryInverseSelected = Colors.o2SkyBlue
    let textButtonSecondary = Colors.o2SkyBlue
    let textButtonSecondaryDisabled = Colors.o2SkyBlueLight50
    let textButtonSecondarySelected = Colors.o2SkyBlueDark
    let textButtonSecondaryInverse = Colors.white
    let textButtonSecondaryInverseDisabled = Colors.o2SkyBlueLight50
    let textButtonSecondaryInverseSelected = Colors.white
    let textLink = Colors.o2SkyBlue
    let textLinkDanger = Colors.pepper
    let textLinkDangerDisabled = Colors.pepperLight30
    let textLinkDisabled = Colors.o2SkyBlueLight
    let textLinkSnackbar = Colors.o2SkyBlueLight
    
    // CONTROLS
    let control = Colors.grey3
    let controlActivated = Colors.o2Gem
    let controlError = Colors.pepper
    let loadingBar = Colors.o2Gem
    let loadingBarBackground = Colors.o2GemLight30
    let loadingBarBackgroundInverse = Colors.o2GemLight30
    let loadingBarInverse = Colors.o2Gem
    
    // DIVIDERS
    let divider = Colors.grey2
    let dividerInverse = Colors.white.withAlphaComponent(0.2)
    let navigationBarDivider = Colors.o2Blue
    
    // FEEDBACKS
    let badge = Colors.pepperDark
    let feedbackErrorBackground = Colors.pepper
    let feedbackInfoBackground = Colors.grey6
    
    // GLOBAL
    let brand = Colors.o2Blue // antes iconBrand
    let inverse = Colors.white // antes iconInverse
    let neutralHigh = Colors.grey6 // antes iconPrimary
    let neutralLow = Colors.grey3 // antes iconDisabled
    let neutralMedium = Colors.grey5 // antes iconSecondary
    let promo = Colors.pink // antes backgroundPromo
    let highlight = Colors.pink
    
    let textPrimary = Colors.grey6
    let textPrimaryInverse = Colors.white
    let textSecondary = Colors.grey5
    let textSecondaryInverse = Colors.o2SkyBlueLight
    let textDisabled = Colors.grey3
    let textAmount = Colors.o2SkyBlue

    // STATES
    let error = Colors.pepper // antes iconError
    let success = Colors.o2Green // antes iconSuccess
    let warning = Colors.orange // antes iconWarning

    // BARS TEXTS
    let textNavigationBarPrimary = Colors.white
    let textNavigationBarSecondary = Colors.o2BlueLight60
    let textNavigationSearchBarHint = Colors.o2BlueLight60 // solo en iOS
    let textNavigationSearchBarText = Colors.white // solo en iOS
    let textAppBar = Colors.grey4
    let textAppBarSelected = Colors.o2Blue
    
    // GRADIENTS
    let backgroundBrandGradient = [
        Colors.o2Blue,
        Colors.o2GradientSecond,
        Colors.o2GradientThird,
        Colors.o2GradientFourth
    ]
}

struct O2ClassicAppColorPalette: AppColorPalette  {
    
    // MARK: Text
    
    let textSecondaryAlternative = Colors.grey4
    let textHint = Colors.grey4
    let textAccent = Colors.o2Gem
    let gradientBackgroundFirst = Colors.o2Blue
    let gradientBackgroundSecond = Colors.o2GradientSecond
    let gradientBackgroundThird = Colors.o2GradientThird
    let gradientBackgroundFourth = Colors.o2GradientFourth
    
    // MARK: Bubbles
    
    let bubbleTimeBackground = Colors.grey6
    let bubbleMeBackground = Colors.grey2
    let bubbleMeBackgroundSelected = Colors.grey3
    let bubbleOtherBackground = Colors.o2SkyBlueLight30
    let bubbleOtherBackgroundSelected = Colors.o2SkyBlueLight60
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.o2SkyBlue
    let buttonBotBorder = Colors.o2SkyBlueLight
    
    // MARK: Assistant
    
    let assistantButtonBackground = Colors.o2SkyBlueLight30.withAlphaComponent(0.25)
    let assistantButtonBackgroundHighlighted = Colors.o2SkyBlueLight60.withAlphaComponent(0.25)
    let assistantButtonBackgroundSelected = Colors.o2SkyBlueLight60.withAlphaComponent(0.25)
    let assistantButtonBackgroundDisabled = Colors.o2SkyBlueLight60.withAlphaComponent(0.25)
    
    let assistantButtonBorderBackground = Colors.white
    let assistantButtonBorderBackgroundSelected = Colors.o2SkyBlueLight60
    let assistantButtonBorderBackgroundDisabled = Colors.o2SkyBlueLight60
    
    let assistantButtonNotificationsBackground = Colors.white
    
    let assistantDivider = Colors.o2SkyBlueLight60
    let assistantArrow = Colors.o2SkyBlueLight60
    let assistantPlaceholderText = Colors.o2SkyBlueLight30
    let assistantCardShadow = Colors.o2BlueDark.withAlphaComponent(0.40)
    
    let assistantBadge = Colors.grey6
    
    // MARK: Charts
    
    let chartPrimaryInactive = Colors.grey2
    let chartPrimaryActive = Colors.o2SkyBlue
    let chartSecondaryInactive = Colors.grey2
    let chartSecondaryActive = Colors.orange
    let ratingInactive = Colors.grey2
    let ratingActive = Colors.orange
    
    // MARK: Account Widget
    
    let amountBillingInfoWarning = Colors.pepperDark
    let chartWarning = Colors.o2Yellow
    let chartWarningLight = Colors.o2Yellow
    let chartBackground = Colors.white.withAlphaComponent(0.40)
    let chartUnlimited = Colors.o2DeepSkyBlue
    let chartDanger = Colors.coral
    let chartPrimary = Colors.o2Green
    let chartPrimaryDark = Colors.o2Green
    let chartPrimaryLight = Colors.o2Green
    let chartCritical = Colors.coral
    
    // MARK: Explore
    
    let timeIndicatorWarning = Colors.pink
    
    // MARK: Support
    
    let textPrimaryOverImage = Colors.grey6
    let textSecondaryOverImage = Colors.grey1
    let tableBackground = Colors.grey1
    
    // MARK: Notification Inbox
    
    let scrollContentIndicatorBackgroundFirst = Colors.o2GradientSecond
    let scrollContentIndicatorBackgroundSecond = Colors.o2Blue
}

private enum Colors {
    // Mistica
    static let o2Blue = UIColor(hex: "#032B5A")!
    static let o2BlueDark = UIColor(hex: "#04264E")!
    static let o2BlueLight60 = UIColor(hex: "#6C8BAF")!
    static let o2SkyBlue = UIColor(hex: "#0090D0")!
    static let o2SkyBlueDark = UIColor(hex: "#057DB2")!
    static let o2SkyBlueLight = UIColor(hex: "#65B4E4")!
    static let o2SkyBlueLight50 = UIColor(hex: "#80C7E7")!
    static let o2SkyBlueLight30 = UIColor(hex: "#D0E8F6")!
    static let o2SkyBlueLight10 = UIColor(hex: "#E9F5FB")!
    static let o2DeepSkyBlue = UIColor(hex: "#7FD4FE")!
    static let o2Gem = UIColor(hex: "#01B7B4")!
    static let o2GemDark = UIColor(hex: "#099E9B")!
    static let o2GemLight30 = UIColor(hex: "#99E2E1")!
    static let o2Yellow = UIColor(hex: "#FFCC00")!
    static let o2Green = UIColor(hex: "#84B50F")!
    static let o2GreenLight = UIColor(hex: "#DAE8B7")!
    static let pepper = UIColor(hex: "#FF374A")!
    static let pepperDark = UIColor(hex: "#D73241")!
    static let pepperLight30 = UIColor(hex: "#FFC3C8")!
    static let orange = UIColor(hex: "#FF7F41")!
    static let orangeLight = UIColor(hex: "#FFD6C2")!
    static let coral = UIColor(hex: "#FF706E")!
    static let pink = UIColor(hex: "#EB3C7D")!
    static let o2GradientSecond = UIColor(hex: "#0B4680")!
    static let o2GradientThird = UIColor(hex: "#0D71AD")!
    static let o2GradientFourth = UIColor(hex: "#449ED0")!
    static let grey1 = UIColor(hex: "#F6F6F6")!
    static let grey2 = UIColor(hex: "#EEEEEE")!
    static let grey3 = UIColor(hex: "#DDDDDD")!
    static let grey4 = UIColor(hex: "#999999")!
    static let grey5 = UIColor(hex: "#757575")!
    static let grey6 = UIColor(hex: "#000033")!
    static let white = UIColor(hex: "#FFFFFF")!
    
    #warning("To be removed.")
    static let o2SkyBlueLight60 = UIColor(r: 163, g: 210, b: 239)
}
