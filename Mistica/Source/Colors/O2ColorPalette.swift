//
//  O2ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2ColorPalette: ColorPalette {
    // MARK: Text

    let textPrimary = Colors.grey0
    let textDisabled = Colors.grey3
    let textPrimaryInverse = Colors.white
    let textSecondary = Colors.grey1
    let textSecondaryInverse = Colors.o2BluePrimaryLight10
    let textSecondaryAlternative = Colors.grey2
    let textHint = Colors.grey2
    let textDanger = Colors.pink0

    let textAccent = Colors.o2Teal
    let textAccentSelected = Colors.o2TealDark

    let textLink = Colors.o2BluePrimary
    let textLinkSelected = Colors.o2BluePrimaryDark
    let textLinkDisabled = Colors.o2BlueLight

    let textButtonPrimary = Colors.white
    let textButtonPrimaryInverse = Colors.o2BluePrimary
    let textButtonPrimaryInverseSelected = Colors.o2BluePrimary
    let textButtonPrimaryInverseDisabled = Colors.o2BluePrimaryLight10
    let textButtonSecondary = Colors.o2BluePrimary
    let textButtonSecondarySelected = Colors.o2BluePrimaryDark
    let textButtonSecondaryDisabled = Colors.o2BluePrimaryLight10
    let textButtonSecondaryInverse = Colors.white
    let textButtonSecondaryInverseSelected = Colors.white
    let textButtonSecondaryInverseDisabled = Colors.o2BluePrimaryLight60
    let textButtonTertiary = Colors.grey0

    let textLinkInverse = Colors.white
    let textLinkInverseSelected = Colors.white
    let textLinkInverseDisabled = Colors.o2BlueLight

    let textInputLabel = Colors.o2Teal
    let textInputLabelError = Colors.pepper

    let gradientBackgroundFirst = Colors.o2BluePrimary
    let gradientBackgroundSecond = Colors.o2BluePrimary
    let gradientBackgroundThird = Colors.o2BluePrimary
    let gradientBackgroundFourth = Colors.o2BluePrimary
    let backgroundBrandFirst = Colors.o2BluePrimary
    let backgroundBrandSecond = Colors.o2BluePrimary
    let backgroundBrandThird = Colors.o2BluePrimary
    let backgroundBrandFourth = Colors.o2BluePrimary

    // MARK: Backgrounds

    let background = Colors.white
    let backgroundOpacity = Colors.grey0
    let divider = Colors.grey4
    let backgroundAlternative = Colors.grey5

    let backgroundPromo = Colors.o2Purple

    let rowBackground = Colors.white
    let rowBackgroundHighlighted = Colors.grey5
    let placeholderBackground = Colors.o2Teal

    let border = Colors.grey3
    let borderSelected = Colors.o2BluePrimary

    // MARK: Icons

    let iconPrimary = Colors.grey0
    let iconAccent = Colors.o2Teal
    let iconDisabled = Colors.grey3
    let iconSecondary = Colors.grey2
    let iconTertiary = Colors.o2BluePrimary
    let iconInverse = Colors.white
    let iconWarning = Colors.o2Orange
    let iconError = Colors.pepper

    // MARK: Search bar

    let navigationsSearchBarBackground = Colors.o2BluePrimaryDark
    let navigationSearchBarText = Colors.white
    let navigationSearchBarHintText = Colors.o2BluePrimaryLight60
    let iconNavigationBar = Colors.white

    // MARK: Navigation bar

    let navigationBarBackground = Colors.o2BluePrimary
    let navigationBarDivider = Colors.o2BluePrimary
    let navigationBarPrimary = Colors.white
    let navigationBarSecondary = Colors.o2BluePrimaryLight60

    // MARK: Tab bar

    let appBarBackground = Colors.white
    let appBarText = Colors.grey2
    let appBarTextSelected = Colors.o2BluePrimary

    // MARK: Buttons

    let buttonPrimaryBackground = Colors.o2BluePrimary
    let buttonPrimaryBackgroundSelected = Colors.o2BluePrimaryDark
    let buttonPrimaryBackgroundDisabled = Colors.o2BluePrimaryLight10
    let buttonSecondaryBackground = Colors.o2BluePrimary
    let buttonSecondaryBackgroundSelected = Colors.o2BluePrimaryDark
    let buttonSecondaryBackgroundDisabled = Colors.o2BluePrimaryLight10
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
    let buttonPrimaryBackgroundSelectedInverse = Colors.o2BluePrimaryLight60
    let buttonPrimaryBackgroundDisabledInverse = Colors.o2BluePrimaryLight60

    let buttonSecondaryBorderInverse = Colors.white
    let buttonSecondaryBorderSelectedInverse = Colors.o2BluePrimaryLight60
    let buttonSecondaryBorderDisabledInverse = Colors.o2BluePrimaryLight60

    let buttonLinkBackgroundSelected = Colors.o2BluePrimaryLight10
    let buttonLinkBackgroundSelectedInverse = Colors.whitePercent20

    // MARK: Controls

    let control = Colors.grey3
    let controlActivated = Colors.o2BluePrimary
    let controlHighlighted = Colors.grey5

    // MARK: SegmentedControls

    let textSegmentedControl = Colors.o2BluePrimary
    let textSegmentedControlSelected = Colors.white
    let segmentedControlBackgroundSelected = Colors.o2BluePrimary

    let textSegmentedControlInverse = Colors.white
    let textSegmentedControlInverseSelected = Colors.o2BluePrimary
    let segmentedControlBackgroundInverseSelected = Colors.white

    // MARK: Feedback

    let feedbackInfoBackground = Colors.grey0
    let feedbackErrorBackground = Colors.pepper
    let textLinkSnackbar = Colors.o2BlueLight

    // MARK: Bubbles

    let bubbleTimeBackground = Colors.grey0
    let bubbleMeBackground = Colors.grey4
    let bubbleMeBackgroundSelected = Colors.grey3
    let bubbleOtherBackground = Colors.o2BlueLight30
    let bubbleOtherBackgroundSelected = Colors.o2BlueLight60
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.o2BlueMid
    let buttonBotBorder = Colors.o2BlueLight
    let accentBackground = Colors.o2Teal

    // MARK: List

    let contactListAlphabet = Colors.grey1

    // MARK: Assistant

    let assistantButtonBackground = Colors.o2BlueLight30Percent25
    let assistantButtonBackgroundHighlighted = Colors.o2BlueLight60Percent25
    let assistantButtonBackgroundSelected = Colors.o2BlueLight60Percent25
    let assistantButtonBackgroundDisabled = Colors.o2BlueLight60Percent25

    let assistantButtonBorderBackground = Colors.white
    let assistantButtonBorderBackgroundSelected = Colors.o2BlueLight60
    let assistantButtonBorderBackgroundDisabled = Colors.o2BlueLight60

    let assistantButtonNotificationsBackground = Colors.white

    let assistantDivider = Colors.o2BlueLight60
    let assistantArrow = Colors.o2BlueLight60
    let assistantPlaceholderText = Colors.o2BlueLight30
    let assistantCardShadow = Colors.o2BluePrimaryDarkPercent40

    let assistantBadge = Colors.grey0

    // MARK: Charts

    let chartPrimaryInactive = Colors.grey4
    let chartPrimaryActive = Colors.o2BlueMid
    let chartSecondaryInactive = Colors.grey4
    let chartSecondaryActive = Colors.o2Orange
    let ratingInactive = Colors.grey4
    let ratingActive = Colors.o2Orange

    // MARK: Skeletons

    let skeletonBackground = Colors.grey4
    let skeletonWave = Colors.grey5

    // MARK: Progress bars

    let progressBar = Colors.o2BluePrimary

    // MARK: Status

    let tagBackgroundFirst = Colors.o2Green
    let tagBackgroundSecond = Colors.grey3
    let tagBackgroundThird = Colors.o2BluePrimary
    let tagBackgroundFourth = Colors.o2Orange

    // MARK: Account Widget

    let amountBillingInfoWarning = Colors.pepperDark
    let chartWarning = Colors.o2Yellow
    let chartWarningLight = Colors.o2Yellow
    let chartBackground = Colors.whitePercent40
    let chartUnlimited = Colors.o2BlueLight
    let chartDanger = Colors.o2Coral
    let chartPrimary = Colors.o2Green
    let chartPrimaryDark = Colors.o2Green
    let chartPrimaryLight = Colors.o2Green
    let chartCritical = Colors.o2Coral

    // MARK: IPComms (Deprecated)

    let bubbleLocationIncomingBackgroundTint = Colors.o2BlueLight30

    // MARK: Explore

    let timeIndicatorWarning = Colors.pink0

    // MARK: Support

    let textPrimaryOverImage = Colors.grey0
    let textSecondaryOverImage = Colors.grey5
    let tableBackground = Colors.grey5

    // MARK: BadgeView

    let badgeColor = Colors.pepperDark

    // MARK: Notification Inbox

    let scrollContentIndicatorBackgroundFirst = Colors.o2BluePrimary
    let scrollContentIndicatorBackgroundSecond = Colors.o2BluePrimaryDark

    // MARK: Cells

    let cellBackgroundHighlighted = Colors.grey4
}

private enum Colors {
    static let white = UIColor.white
    static let whitePercent20 = UIColor(r: 255, g: 255, b: 255, a: 51)
    static let whitePercent40 = UIColor(r: 255, g: 255, b: 255, a: 40)

    static let grey0 = UIColor(r: 0, g: 0, b: 51)
    static let grey1 = UIColor(r: 112, g: 112, b: 112)
    static let grey2 = UIColor(r: 153, g: 153, b: 153)
    static let grey3 = UIColor(r: 221, g: 221, b: 221)
    static let grey4 = UIColor(r: 238, g: 238, b: 238)
    static let grey5 = UIColor(r: 246, g: 246, b: 246)

    static let o2BluePrimary = UIColor(r: 0, g: 25, b: 165)
    static let o2BluePrimaryDark = UIColor(r: 0, g: 0, b: 102)
    static let o2BluePrimaryDarkPercent40 = UIColor(r: 4, g: 38, b: 78, a: 102)
    static let o2BluePrimaryLight60 = UIColor(r: 108, g: 139, b: 175)
    static let o2BluePrimaryLight10 = UIColor(r: 204, g: 209, b: 237)
    static let o2BlueMid = UIColor(r: 0, g: 123, b: 178)
    static let o2BlueMidDark = UIColor(r: 0, g: 103, b: 149)
    static let o2BlueLight = UIColor(r: 65, g: 182, b: 230)
    static let o2BlueLight10 = UIColor(r: 236, g: 247, b: 252)
    static let o2BlueLight60 = UIColor(r: 141, g: 211, b: 240)
    static let o2BlueLight60Percent25 = UIColor(r: 141, g: 211, b: 240, a: 64)
    static let o2BlueLight30 = UIColor(r: 198, g: 233, b: 247)
    static let o2BlueLight30Percent25 = UIColor(r: 198, g: 233, b: 247, a: 64)
    static let o2BlueLight30Percent70 = UIColor(r: 198, g: 233, b: 247, a: 178)
    static let o2BlueLight30Percent40 = UIColor(r: 198, g: 233, b: 247, a: 102)

    static let o2Teal = UIColor(r: 1, g: 183, b: 180)
    static let o2TealDark = UIColor(r: 9, g: 158, b: 155)
    static let o2TealLight = UIColor(r: 177, g: 228, b: 227)
    static let o2Green = UIColor(r: 145, g: 201, b: 14)
    static let o2Orange = UIColor(r: 255, g: 127, b: 65)
    static let o2Yellow = UIColor(r: 254, g: 219, b: 0)
    static let o2Coral = UIColor(r: 255, g: 112, b: 110)
    static let pink0 = UIColor(r: 203, g: 49, b: 160)
    static let o2Purple = UIColor(r: 149, g: 54, b: 152)
    static let pepper = UIColor(r: 255, g: 55, b: 74)
    static let pepperDark = UIColor(r: 215, g: 50, b: 65)
    static let pepperLight = UIColor(r: 255, g: 97, b: 115)

    static let o2GradientSecond = UIColor(r: 11, g: 70, b: 128)
    static let o2GradientThird = UIColor(r: 13, g: 113, b: 173)
    static let o2GradientFourth = UIColor(r: 68, g: 158, b: 208)
}
