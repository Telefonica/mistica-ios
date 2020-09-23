//
//  MovistarColorPalette.swift
//  Mistica
//
//  Created by Víctor Pimentel on 14/12/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

struct MovistarColorPalette: ColorPalette {
    // MARK: Text

    let textPrimary = Colors.grey0
    let textDisabled = Colors.grey3
    let textPrimaryInverse = Colors.white
    let textSecondary = Colors.grey1
    let textSecondaryAlternative = Colors.grey2
    let textSecondaryInverse = Colors.lightBlueGrey
    let textHint = Colors.grey2
    let textDanger = Colors.pink

    let textAccent = Colors.movistarGreen
    let textAccentSelected = Colors.movistarGreenDark

    let textLink = Colors.movistarBlue
    let textLinkSelected = Colors.movistarBlueDark
    let textLinkDisabled = Colors.movistarBlueLight30

    let textButtonPrimary = Colors.white
    let textButtonPrimaryInverse = Colors.movistarBlue
    let textButtonPrimaryInverseSelected = Colors.movistarBlue
    let textButtonPrimaryInverseDisabled = Colors.movistarBlueLight30
    let textButtonSecondary = Colors.movistarGreen
    let textButtonSecondarySelected = Colors.movistarGreenDark
    let textButtonSecondaryDisabled = Colors.movistarGreenLight50
    let textButtonSecondaryInverse = Colors.white
    let textButtonSecondaryInverseSelected = Colors.white
    let textButtonSecondaryInverseDisabled = Colors.movistarBlueLight50
    let textButtonTertiary = Colors.grey0

    let textLinkInverse = Colors.white
    let textLinkInverseSelected = Colors.white
    let textLinkInverseDisabled = Colors.movistarBlueLight50

    let textInputLabel = Colors.movistarBlue
    let textInputLabelError = Colors.pepper

    let gradientBackgroundFirst = Colors.movistarGradientFirst
    let gradientBackgroundSecond = Colors.movistarGradientSecond
    let gradientBackgroundThird = Colors.movistarGradientThird
    let gradientBackgroundFourth = Colors.movistarGradientFourth

    var backgroundBrandFirst: UIColor {
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    }

    var backgroundBrandSecond: UIColor {
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    }

    var backgroundBrandThird: UIColor {
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    }

    var backgroundBrandFourth: UIColor {
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    }

    // MARK: Backgrounds

    let background = Colors.white
    let backgroundOpacity = Colors.grey0
    let divider = Colors.grey4
    let backgroundAlternative = Colors.grey5

    let backgroundPromo = Colors.purple

    let rowBackground = Colors.white
    let rowBackgroundHighlighted = Colors.grey5
    let placeholderBackground = Colors.movistarBlue

    let border = Colors.grey3
    let borderSelected = Colors.movistarGreen

    // MARK: Icons

    let iconPrimary = Colors.grey0
    let iconAccent = Colors.movistarGreen
    let iconDisabled = Colors.grey3
    let iconSecondary = Colors.grey2
    let iconTertiary = Colors.movistarBlue
    let iconInverse = Colors.white

    // MARK: Search bar

    var navigationsSearchBarBackground: UIColor {
        UIColor(Colors.movistarBlueDark, variants: [.prominent: Colors.movistarProminentBlueDark])
    }

    let navigationSearchBarText = Colors.white
    var navigationSearchBarHintText: UIColor {
        UIColor(Colors.movistarBlueLight30, variants: [.prominent: Colors.movistarProminentBlueLight30])
    }

    let iconNavigationBar = Colors.white

    // MARK: Navigation bar

    var navigationBarBackground: UIColor {
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    }

    var navigationBarDivider: UIColor {
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    }

    let navigationBarPrimary = Colors.white
    var navigationBarSecondary: UIColor {
        UIColor(Colors.movistarBlueLight30, variants: [.prominent: Colors.movistarProminentBlueLight30])
    }

    // MARK: Tab bar

    let appBarBackground = Colors.white
    let appBarText = Colors.grey2
    var appBarTextSelected: UIColor {
        UIColor(Colors.movistarBlue, variants: [.prominent: Colors.movistarProminentBlue])
    }

    // MARK: Buttons

    let buttonPrimaryBackground = Colors.movistarGreen
    let buttonPrimaryBackgroundSelected = Colors.movistarGreenDark
    let buttonPrimaryBackgroundDisabled = Colors.movistarGreenLight50
    let buttonSecondaryBackground = Colors.movistarGreen
    let buttonSecondaryBackgroundSelected = Colors.movistarGreenDark
    let buttonSecondaryBackgroundDisabled = Colors.movistarGreenLight50
    let buttonTertiaryBackground = Colors.grey4
    let buttonTertiaryBackgroundSelected = Colors.grey3
    let buttonTertiaryBackgroundDisabled = Colors.grey4

    let buttonDanger = Colors.pepper
    let buttonDangerSelected = Colors.pepperDark
    let buttonDangerDisabled = Colors.pepperLight

    let quickActionPrimaryBackground = Colors.grey0
    let quickActionBackgroundDestructive = Colors.pepper

    let buttonBorder = Colors.grey3
    let buttonBorderSelected = Colors.grey3
    let buttonBorderDisabled = Colors.grey3
    let buttonBorderHighlighted = Colors.grey3

    let buttonPrimaryBackgroundInverse = Colors.white
    let buttonPrimaryBackgroundSelectedInverse = Colors.movistarBlueLight60
    let buttonPrimaryBackgroundDisabledInverse = Colors.movistarBlueLight60

    let buttonSecondaryBorderInverse = Colors.white
    let buttonSecondaryBorderSelectedInverse = Colors.movistarBlueLight60
    let buttonSecondaryBorderDisabledInverse = Colors.movistarBlueLight60

    let buttonLinkBackgroundSelected = Colors.movistarBlueLight10
    let buttonLinkBackgroundSelectedInverse = Colors.whitePercent20

    // MARK: Controls

    let control = Colors.grey3
    let controlActivated = Colors.movistarBlue
    let controlHighlighted = Colors.grey5

    // MARK: SegmentedControls

    let textSegmentedControl = Colors.movistarBlue
    let textSegmentedControlSelected = Colors.white
    let segmentedControlBackgroundSelected = Colors.movistarBlue

    let textSegmentedControlInverse = Colors.white
    let textSegmentedControlInverseSelected = Colors.movistarBlue
    let segmentedControlBackgroundInverseSelected = Colors.white

    // MARK: Feedback

    let feedbackInfoBackground = Colors.grey0
    let feedbackErrorBackground = Colors.pepper
    let textLinkSnackbar = Colors.movistarBlueLight60

    // MARK: Bubbles

    let bubbleTimeBackground = Colors.corporate
    let bubbleMeBackground = Colors.grey5
    let bubbleMeBackgroundSelected = Colors.grey4
    let bubbleOtherBackground = Colors.movistarGreenLight30
    let bubbleOtherBackgroundSelected = Colors.movistarGreenLight50
    let buttonBot = Colors.white
    let buttonBotSelected = Colors.movistarGreen
    let buttonBotBorder = Colors.movistarGreenLight30
    let accentBackground = Colors.movistarGreen

    // MARK: List

    let contactListAlphabet = Colors.grey2

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

    let chartPrimaryInactive = Colors.grey4
    let chartPrimaryActive = Colors.movistarGreen
    let chartSecondaryInactive = Colors.movistarBlueLight30
    let chartSecondaryActive = Colors.movistarBlue
    let ratingInactive = Colors.grey4
    let ratingActive = Colors.egg

    // MARK: Skeletons

    let skeletonBackground = Colors.grey4
    let skeletonWave = Colors.grey5

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

    // MARK: IPComms (Deprecated)

    let bubbleLocationIncomingBackgroundTint = Colors.movistarGreenLight50

    // MARK: Explore

    let timeIndicatorWarning = Colors.pink

    // MARK: Support

    var textPrimaryOverImage: UIColor {
        UIColor(Colors.movistarCoolGrey, variants: [.prominent: Colors.white])
    }

    var textSecondaryOverImage: UIColor {
        UIColor(Colors.grey2, variants: [.prominent: Colors.white])
    }

    var tableBackground: UIColor {
        UIColor(.white, variants: [.prominent: Colors.grey5])
    }

    // MARK: BadgeView

    let badgeColor = Colors.pepperDark

    // MARK: Notification Inbox

    let scrollContentIndicatorBackgroundFirst = Colors.movistarBlue
    let scrollContentIndicatorBackgroundSecond = Colors.movistarBlueDark

    // MARK: Cells

    let cellBackgroundHighlighted = Colors.grey4
}

private enum Colors {
    static let white = UIColor.white
    static let whitePercent20 = UIColor(r: 255, g: 255, b: 255, a: 51)
    static let whitePercent40 = UIColor(r: 255, g: 255, b: 255, a: 102)

    static let grey0 = UIColor(r: 49, g: 50, b: 53)
    static let grey1 = UIColor(r: 134, g: 136, b: 140)
    static let grey2 = UIColor(r: 153, g: 153, b: 153)
    static let grey3 = UIColor(r: 221, g: 221, b: 221)
    static let grey4 = UIColor(r: 238, g: 238, b: 238)
    static let grey5 = UIColor(r: 246, g: 246, b: 246)

    static let egg = UIColor(r: 242, g: 141, b: 21)
    static let eggLight = UIColor(r: 248, g: 210, b: 179)
    static let pink = UIColor(r: 230, g: 55, b: 128)
    static let purple = UIColor(r: 161, g: 62, b: 161)
    static let lightBlueGrey = UIColor(r: 178, g: 217, b: 237)

    static let movistarCoolGrey = UIColor(r: 49, g: 50, b: 53)
    static let movistarGreen = UIColor(r: 92, g: 182, b: 21)
    static let movistarGreenDark = UIColor(r: 73, g: 145, b: 16)
    static let movistarGreenLight50 = UIColor(r: 173, g: 218, b: 138)
    static let movistarGreenLight50Percent70 = UIColor(r: 173, g: 218, b: 138, a: 178)
    static let movistarGreenLight50Percent40 = UIColor(r: 173, g: 218, b: 138, a: 102)
    static let movistarGreenLight30 = UIColor(r: 206, g: 233, b: 185)
    static let movistarBlue = UIColor(r: 1, g: 157, b: 244)
    static let movistarBlueDark = UIColor(r: 0, g: 142, b: 221)
    static let movistarBlueLight60 = UIColor(r: 101, g: 195, b: 248)
    static let movistarBlueLight50 = UIColor(r: 128, g: 206, b: 249)
    static let movistarBlueLight30 = UIColor(r: 179, g: 225, b: 251)
    static let movistarBlueLight10 = UIColor(r: 230, g: 245, b: 253)
    static let movistarBlueDarkPercent80 = UIColor(r: 0, g: 142, b: 221, a: 204)

    static let movistarGradientFirst = UIColor(r: 1, g: 157, b: 244)
    static let movistarGradientSecond = UIColor(r: 1, g: 157, b: 244)
    static let movistarGradientThird = UIColor(r: 1, g: 157, b: 244)
    static let movistarGradientFourth = UIColor(r: 1, g: 157, b: 244)

    static let movistarBlueLight30Percent25 = UIColor(r: 179, g: 225, b: 251, a: 64)
    static let movistarBlueLight60Percent25 = UIColor(r: 101, g: 195, b: 248, a: 64)

    static let corporate = UIColor(r: 25, g: 25, b: 25)

    static let pepper = UIColor(r: 255, g: 55, b: 74)
    static let pepperDark = UIColor(r: 215, g: 50, b: 65)
    static let pepperLight = UIColor(r: 255, g: 195, b: 200)

    // Prominent
    static let movistarProminentBlue = UIColor(r: 11, g: 39, b: 57)
    static let movistarProminentBlueDark = UIColor(r: 0, g: 30, b: 41)
    static let movistarProminentBlueLight30 = UIColor(r: 182, g: 190, b: 195, a: 64)
}
