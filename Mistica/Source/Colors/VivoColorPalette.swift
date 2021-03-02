//
//  VivoColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/*
struct VivoColorPalette: ColorPalette {
    // MARK: Text

    let textPrimary = Colors.grey0
    let textDisabled = Colors.grey3
    let textPrimaryInverse = Colors.white
    let textSecondary = Colors.grey1
    let textSecondaryAlternative = Colors.grey2
    let textSecondaryInverse = Colors.vivoPurpleLight40
    let textHint = Colors.grey2
    let textDanger = Colors.pink

    let textAccent = Colors.vivoGreen
    let textAccentSelected = Colors.vivoGreenDark

    let textLink = Colors.vivoPurple
    let textLinkSelected = Colors.vivoPurple
    let textLinkDisabled = Colors.vivoPurpleLight40

    let textButtonPrimary = Colors.white
    let textButtonPrimaryInverse = Colors.vivoPurple
    let textButtonPrimaryInverseSelected = Colors.vivoPurple
    let textButtonPrimaryInverseDisabled = Colors.vivoPurpleLight20
    let textButtonSecondary = Colors.vivoPurple
    let textButtonSecondarySelected = Colors.vivoPurpleDark
    let textButtonSecondaryDisabled = Colors.vivoPurpleLight20
    let textButtonSecondaryInverse = Colors.white
    let textButtonSecondaryInverseSelected = Colors.white
    let textButtonSecondaryInverseDisabled = Colors.vivoPurpleLight40
    let textButtonTertiary = Colors.grey0

    let textLinkInverse = Colors.white
    let textLinkInverseSelected = Colors.white
    let textLinkInverseDisabled = Colors.vivoPurpleLight40

    let textInputLabel = Colors.vivoPurple
    let textInputLabelError = Colors.pepper

    let gradientBackgroundFirst = Colors.vivoGradientFirst
    let gradientBackgroundSecond = Colors.vivoGradientSecond
    let gradientBackgroundThird = Colors.vivoGradientThird
    let gradientBackgroundFourth = Colors.vivoGradientFourth

    let backgroundBrandFirst = Colors.vivoPurple
    let backgroundBrandSecond = Colors.vivoPurple
    let backgroundBrandThird = Colors.vivoPurple
    let backgroundBrandFourth = Colors.vivoPurple

    // MARK: Backgrounds

    let background = Colors.white
    let backgroundOpacity = Colors.grey0
    let divider = Colors.grey4
    let backgroundAlternative = Colors.grey5

    let backgroundPromo = Colors.vivoPurple
    let rowBackground = Colors.white
    let rowBackgroundHighlighted = Colors.grey5
    let placeholderBackground = Colors.vivoBlue

    let border = Colors.grey3
    let borderDark = Colors.grey1
    let borderSelected = Colors.vivoPurple

    // MARK: Icons

    let iconPrimary = Colors.grey0
    let iconAccent = Colors.vivoGreen
    let iconDisabled = Colors.grey3
    let iconSecondary = Colors.grey2
    let iconTertiary = Colors.vivoBlue
    let iconInverse = Colors.white
    let iconWarning = Colors.vivoOrange
    let iconError = Colors.pepper

    // MARK: Search bar

    let navigationsSearchBarBackground = Colors.vivoPurpleDark
    let navigationSearchBarText = Colors.white
    let navigationSearchBarHintText = Colors.vivoPurpleLight40
    let iconNavigationBar = Colors.white

    // MARK: Navigation bar

    let navigationBarBackground = Colors.vivoPurple
    let navigationBarDivider = Colors.vivoPurple
    let navigationBarPrimary = Colors.white
    let navigationBarSecondary = Colors.vivoPurpleLight40

    // MARK: Tab bar

    let appBarBackground = Colors.white
    let appBarText = Colors.grey2
    let appBarTextSelected = Colors.vivoPurple

    // MARK: Buttons

    let buttonPrimaryBackground = Colors.vivoPurple
    let buttonPrimaryBackgroundSelected = Colors.vivoPurpleDark
    let buttonPrimaryBackgroundDisabled = Colors.vivoPurpleLight20
    let buttonSecondaryBackground = Colors.vivoPurple
    let buttonSecondaryBackgroundSelected = Colors.vivoPurpleDark
    let buttonSecondaryBackgroundDisabled = Colors.vivoPurpleLight20
    let buttonTertiaryBackground = Colors.grey4
    let buttonTertiaryBackgroundSelected = Colors.grey3
    let buttonTertiaryBackgroundDisabled = Colors.grey4

    let buttonDanger = Colors.pepper
    let buttonDangerSelected = Colors.pepperLight
    let buttonDangerDisabled = Colors.pepperDark

    let quickActionPrimaryBackground = Colors.grey0
    let quickActionBackgroundDestructive = Colors.pepper

    let buttonBorder = Colors.grey3
    let buttonBorderSelected = Colors.grey3
    let buttonBorderDisabled = Colors.grey3
    let buttonBorderHighlighted = Colors.grey3

    let buttonPrimaryBackgroundInverse = Colors.white
    let buttonPrimaryBackgroundSelectedInverse = Colors.vivoPurpleLight40
    let buttonPrimaryBackgroundDisabledInverse = Colors.vivoPurpleLight40

    let buttonSecondaryBorderInverse = Colors.white
    let buttonSecondaryBorderSelectedInverse = Colors.vivoPurpleLight40
    let buttonSecondaryBorderDisabledInverse = Colors.vivoPurpleLight40

    let buttonLinkBackgroundSelected = Colors.vivoPurpleLight10
    let buttonLinkBackgroundSelectedInverse = Colors.whitePercent20

    // MARK: Controls

    let control = Colors.grey3
    let controlActivated = Colors.vivoPurple
    let controlHighlighted = Colors.grey5

    // MARK: SegmentedControls

    let textSegmentedControl = Colors.vivoPurple
    let textSegmentedControlSelected = Colors.white
    let segmentedControlBackgroundSelected = Colors.vivoPurple

    let textSegmentedControlInverse = Colors.white
    let textSegmentedControlInverseSelected = Colors.vivoPurple
    let segmentedControlBackgroundInverseSelected = Colors.white

    // MARK: Feedback

    let feedbackInfoBackground = Colors.grey0
    let feedbackErrorBackground = Colors.pepper
    let textLinkSnackbar = Colors.vivoPurpleLight40

    // MARK: Bubbles

    let bubbleTimeBackground = Colors.grey0
    let bubbleMeBackground = Colors.grey4
    let bubbleMeBackgroundSelected = Colors.grey3
    let bubbleOtherBackground = Colors.vivoPurpleLight10
    let bubbleOtherBackgroundSelected = Colors.vivoPurpleLight80
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.vivoGreen
    let buttonBotBorder = Colors.vivoGreenLight40
    let accentBackground = Colors.vivoGreen

    // MARK: List

    let contactListAlphabet = Colors.grey2

    // MARK: Assistant

    let assistantButtonBackground = Colors.vivoPurpleLight30Percent25
    let assistantButtonBackgroundHighlighted = Colors.vivoPurpleLight50Percent25
    let assistantButtonBackgroundSelected = Colors.vivoPurpleLight50Percent25
    let assistantButtonBackgroundDisabled = Colors.vivoPurpleLight50Percent25

    let assistantButtonBorderBackground = Colors.white
    let assistantButtonBorderBackgroundSelected = Colors.vivoPurpleLight50
    let assistantButtonBorderBackgroundDisabled = Colors.vivoPurpleLight50

    let assistantButtonNotificationsBackground = Colors.white

    let assistantDivider = Colors.vivoPurpleLight50
    let assistantArrow = Colors.vivoPurpleLight40
    let assistantPlaceholderText = Colors.vivoPurpleLight40
    let assistantCardShadow = Colors.vivoPurpleDarkPercent80

    let assistantBadge = Colors.vivoPurple

    // MARK: Charts

    let chartPrimaryInactive = Colors.grey4
    let chartPrimaryActive = Colors.vivoPurple
    let chartSecondaryInactive = Colors.grey4
    let chartSecondaryActive = Colors.vivoPurple
    let ratingInactive = Colors.grey4
    let ratingActive = Colors.pepperLight

    // MARK: Skeletons

    let skeletonBackground = Colors.grey4
    let skeletonWave = Colors.grey5

    // MARK: Progress bars

    let progressBar = Colors.vivoPurple

    // MARK: Status

    let tagBackgroundFirst = Colors.vivoGreen
    let tagBackgroundSecond = Colors.grey3
    let tagBackgroundThird = Colors.vivoPurple
    let tagBackgroundFourth = Colors.vivoOrange

    // MARK: Account Widget

    let amountBillingInfoWarning = Colors.pink
    let chartWarning = Colors.vivoOrange
    let chartWarningLight = Colors.vivoOrangeLight
    let chartBackground = Colors.whitePercent40
    let chartUnlimited = Colors.sageLight
    let chartDanger = Colors.pink
    let chartPrimary = Colors.vivoGreen
    let chartPrimaryDark = Colors.vivoGreenDark
    let chartPrimaryLight = Colors.sageLight
    let chartCritical = Colors.whitePercent40

    // MARK: IPComms (Deprecated)

    let bubbleLocationIncomingBackgroundTint = Colors.vivoGreenLight60

    // MARK: Explore

    let timeIndicatorWarning = Colors.pink

    // MARK: Support

    let textPrimaryOverImage = Colors.grey0
    let textSecondaryOverImage = Colors.grey5
    let tableBackground = Colors.grey5

    // MARK: BadgeView

    let badgeColor = Colors.pepperDark

    // MARK: Notification Inbox

    let scrollContentIndicatorBackgroundFirst = Colors.vivoPurple
    let scrollContentIndicatorBackgroundSecond = Colors.vivoPurpleDark

    // MARK: Cells

    let cellBackgroundHighlighted = Colors.grey4
}

private enum Colors {
    static let white = UIColor.white
    static let whitePercent20 = UIColor(r: 255, g: 255, b: 255, a: 51)
    static let whitePercent40 = UIColor(r: 255, g: 255, b: 255, a: 40)

    static let grey0 = UIColor(r: 0, g: 0, b: 0)
    static let grey1 = UIColor(r: 102, g: 102, b: 102)
    static let grey2 = UIColor(r: 153, g: 153, b: 153)
    static let grey3 = UIColor(r: 221, g: 221, b: 221)
    static let grey4 = UIColor(r: 238, g: 238, b: 238)
    static let grey5 = UIColor(r: 246, g: 246, b: 246)

    static let vivoGreen = UIColor(r: 153, g: 204, b: 51)
    static let vivoGreenDark = UIColor(r: 51, g: 161, b: 74)
    static let vivoGreenLight40 = UIColor(r: 214, g: 234, b: 173)
    static let vivoGreenLight60 = UIColor(r: 194, g: 224, b: 133)

    static let vivoPurple = UIColor(r: 102, g: 0, b: 153)
    static let vivoPurpleDark = UIColor(r: 70, g: 30, b: 95)
    static let vivoPurpleLight10 = UIColor(r: 239, g: 229, b: 244)
    static let vivoPurpleLight20 = UIColor(r: 224, g: 204, b: 235)
    static let vivoPurpleLight40 = UIColor(r: 193, g: 153, b: 214)
    static let vivoPurpleLight50 = UIColor(r: 178, g: 127, b: 204)
    static let vivoPurpleLight80 = UIColor(r: 132, g: 51, b: 173)
    static let vivoPurpleDarkPercent80 = UIColor(r: 70, g: 30, b: 95, a: 204)

    static let vivoBlue = UIColor(r: 0, g: 171, b: 219)

    static let vivoOrange = UIColor(r: 255, g: 153, b: 0)
    static let vivoOrangeDark = UIColor(r: 250, g: 99, b: 36)
    static let vivoOrangeLight = UIColor(r: 255, g: 214, b: 153)

    static let pink = UIColor(r: 235, g: 60, b: 125)

    static let pepper = UIColor(r: 204, g: 31, b: 89)
    static let pepperDark = UIColor(r: 183, g: 29, b: 99)
    static let pepperLight = UIColor(r: 247, g: 177, b: 203)

    static let vivoGradientFirst = UIColor(r: 120, g: 80, b: 160)
    static let vivoGradientSecond = UIColor(r: 102, g: 0, b: 153)
    static let vivoGradientThird = UIColor(r: 102, g: 0, b: 153)
    static let vivoGradientFourth = UIColor(r: 70, g: 30, b: 95)

    static let vivoPurpleLight30Percent25 = UIColor(r: 209, g: 178, b: 224, a: 64)
    static let vivoPurpleLight50Percent25 = UIColor(r: 178, g: 127, b: 204, a: 64)

    static let sageLight = UIColor(r: 197, g: 227, b: 177)
}
*/
