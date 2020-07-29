//
//  ColorToolkit.swift
//  Mistica
//
//  Created by Víctor Pimentel on 14/12/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public extension UIColor {
    // MARK: Text

    @objc(textPrimaryColor)
    static var textPrimary: UIColor {
        Mistica.currentColorPalette.textPrimary
    }

    @objc(textDisabledColor)
    static var textDisabled: UIColor {
        Mistica.currentColorPalette.textDisabled
    }

    @objc(textPrimaryInverseColor)
    static var textPrimaryInverse: UIColor {
        Mistica.currentColorPalette.textPrimaryInverse
    }

    @objc(textSecondaryColor)
    static var textSecondary: UIColor {
        Mistica.currentColorPalette.textSecondary
    }

    @objc(textSecondaryAlternativeColor)
    static var textSecondaryAlternative: UIColor {
        Mistica.currentColorPalette.textSecondaryAlternative
    }

    @objc(textSecondaryInverseColor)
    static var textSecondaryInverse: UIColor {
        Mistica.currentColorPalette.textSecondaryInverse
    }

    @objc(textHintColor)
    static var textHint: UIColor {
        Mistica.currentColorPalette.textHint
    }

    @objc(textAccentColor)
    static var textAccent: UIColor {
        Mistica.currentColorPalette.textAccent
    }

    @objc(textDangerColor)
    static var textDanger: UIColor {
        Mistica.currentColorPalette.textDanger
    }

    @objc(textAccentSelectedColor)
    static var textAccentSelected: UIColor {
        Mistica.currentColorPalette.textAccentSelected
    }

    @objc(textLinkColor)
    static var textLink: UIColor {
        Mistica.currentColorPalette.textLink
    }

    @objc(textLinkSelectedColor)
    static var textLinkSelected: UIColor {
        Mistica.currentColorPalette.textLinkSelected
    }

    @objc(textLinkDisabledColor)
    static var textLinkDisabled: UIColor {
        Mistica.currentColorPalette.textLinkDisabled
    }

    @objc(textButtonPrimaryColor)
    static var textButtonPrimary: UIColor {
        Mistica.currentColorPalette.textButtonPrimary
    }

    @objc(textButtonPrimaryInverseColor)
    static var textButtonPrimaryInverse: UIColor {
        Mistica.currentColorPalette.textButtonPrimaryInverse
    }

    static var textButtonPrimaryInverseSelected: UIColor {
        Mistica.currentColorPalette.textButtonPrimaryInverseSelected
    }

    static var textButtonPrimaryInverseDisabled: UIColor {
        Mistica.currentColorPalette.textButtonPrimaryInverseDisabled
    }

    @objc(textButtonSecondaryColor)
    static var textButtonSecondary: UIColor {
        Mistica.currentColorPalette.textButtonSecondary
    }

    @objc(textButtonSecondarySelectedColor)
    static var textButtonSecondarySelected: UIColor {
        Mistica.currentColorPalette.textButtonSecondarySelected
    }

    @objc(textButtonSecondaryDisabledColor)
    static var textButtonSecondaryDisabled: UIColor {
        Mistica.currentColorPalette.textButtonSecondaryDisabled
    }

    @objc(textButtonSecondaryInverseColor)
    static var textButtonSecondaryInverse: UIColor {
        Mistica.currentColorPalette.textButtonSecondaryInverse
    }

    @objc(textButtonSecondaryInverseSelectedColor)
    static var textButtonSecondaryInverseSelected: UIColor {
        Mistica.currentColorPalette.textButtonSecondaryInverseSelected
    }

    @objc(textButtonSecondaryInverseDisabledColor)
    static var textButtonSecondaryInverseDisabled: UIColor {
        Mistica.currentColorPalette.textButtonSecondaryInverseDisabled
    }

    @objc(textButtonTertiaryColor)
    static var textButtonTertiary: UIColor {
        Mistica.currentColorPalette.textButtonTertiary
    }

    static var textLinkInverse: UIColor {
        Mistica.currentColorPalette.textLinkInverse
    }

    static var textLinkInverseSelected: UIColor {
        Mistica.currentColorPalette.textLinkInverseSelected
    }

    static var textLinkInverseDisabled: UIColor {
        Mistica.currentColorPalette.textLinkInverseDisabled
    }

    @objc(textInputLabelColor)
    static var textInputLabel: UIColor {
        Mistica.currentColorPalette.textInputLabel
    }

    @objc(textInputLabelError)
    static var textInputLabelError: UIColor {
        Mistica.currentColorPalette.textInputLabelError
    }

    @objc(gradientBackgroundFirstColor)
    static var gradientBackgroundFirst: UIColor {
        Mistica.currentColorPalette.gradientBackgroundFirst
    }

    @objc(gradientBackgroundSecondColor)
    static var gradientBackgroundSecond: UIColor {
        Mistica.currentColorPalette.gradientBackgroundSecond
    }

    @objc(gradientBackgroundThirdColor)
    static var gradientBackgroundThird: UIColor {
        Mistica.currentColorPalette.gradientBackgroundThird
    }

    @objc(gradientBackgroundFourthColor)
    static var gradientBackgroundFourth: UIColor {
        Mistica.currentColorPalette.gradientBackgroundFourth
    }

    @objc(backgroundBrandFirstColor)
    static var backgroundBrandFirst: UIColor {
        Mistica.currentColorPalette.backgroundBrandFirst
    }

    @objc(backgroundBrandSecondColor)
    static var backgroundBrandSecond: UIColor {
        Mistica.currentColorPalette.backgroundBrandSecond
    }

    @objc(backgroundBrandThirdColor)
    static var backgroundBrandThird: UIColor {
        Mistica.currentColorPalette.backgroundBrandThird
    }

    @objc(backgroundBrandFourthColor)
    static var backgroundBrandFourth: UIColor {
        Mistica.currentColorPalette.backgroundBrandFourth
    }

    // MARK: Backgrounds

    @objc(backgroundColor)
    static var background: UIColor {
        Mistica.currentColorPalette.background
    }

    @objc(backgroundOpacityColor)
    /// Usually for veils and transparencies
    static var backgroundOpacity: UIColor {
        Mistica.currentColorPalette.backgroundOpacity
    }

    @objc(dividerColor)
    static var divider: UIColor {
        Mistica.currentColorPalette.divider
    }

    @objc(backgroundAlternativeColor)
    static var backgroundAlternative: UIColor {
        Mistica.currentColorPalette.backgroundAlternative
    }

    @objc(backgroundPromoColor)
    static var backgroundPromo: UIColor {
        Mistica.currentColorPalette.backgroundPromo
    }

    @objc(rowBackgroundColor)
    static var rowBackground: UIColor {
        Mistica.currentColorPalette.rowBackground
    }

    @objc(placeholderBackgroundColor)
    static var placeholderBackground: UIColor {
        Mistica.currentColorPalette.placeholderBackground
    }

    @objc(borderColor)
    static var border: UIColor {
        Mistica.currentColorPalette.border
    }

    @objc(borderSelectedColor)
    static var borderSelected: UIColor {
        Mistica.currentColorPalette.borderSelected
    }

    // MARK: Icons

    @objc(iconPrimaryColor)
    static var iconPrimary: UIColor {
        Mistica.currentColorPalette.iconPrimary
    }

    @objc(iconAccentColor)
    static var iconAccent: UIColor {
        Mistica.currentColorPalette.iconAccent
    }

    @objc(iconDisabledColor)
    static var iconDisabled: UIColor {
        Mistica.currentColorPalette.iconDisabled
    }

    @objc(iconSecondaryColor)
    static var iconSecondary: UIColor {
        Mistica.currentColorPalette.iconSecondary
    }

    @objc(iconTertiaryColor)
    static var iconTertiary: UIColor {
        Mistica.currentColorPalette.iconTertiary
    }

    @objc(iconInverseColor)
    static var iconInverse: UIColor {
        Mistica.currentColorPalette.iconInverse
    }

    // MARK: Search bar

    @objc(navigationsSearchBarBackgroundColor)
    static var navigationsSearchBarBackground: UIColor {
        Mistica.currentColorPalette.navigationsSearchBarBackground
    }

    @objc(navigationSearchBarTextColor)
    static var navigationSearchBarText: UIColor {
        Mistica.currentColorPalette.navigationSearchBarText
    }

    @objc(navigationSearchBarHintTextColor)
    static var navigationSearchBarHintText: UIColor {
        Mistica.currentColorPalette.navigationSearchBarHintText
    }

    @objc(iconNavigationBarColor)
    static var iconNavigationBar: UIColor {
        Mistica.currentColorPalette.iconNavigationBar
    }

    // MARK: Navigation bar

    @objc(navigationBarBackgroundColor)
    static var navigationBarBackground: UIColor {
        Mistica.currentColorPalette.navigationBarBackground
    }

    @objc(navigationBarDividerColor)
    static var navigationBarDivider: UIColor {
        Mistica.currentColorPalette.navigationBarDivider
    }

    @objc(navigationBarPrimaryColor)
    static var navigationBarPrimary: UIColor {
        Mistica.currentColorPalette.navigationBarPrimary
    }

    @objc(navigationBarSecondaryColor)
    static var navigationBarSecondary: UIColor {
        Mistica.currentColorPalette.navigationBarSecondary
    }

    // MARK: Tab bar

    @objc(appBarBackgroundColor)
    static var appBarBackground: UIColor {
        Mistica.currentColorPalette.appBarBackground
    }

    @objc(appBarTextColor)
    static var appBarText: UIColor {
        Mistica.currentColorPalette.appBarText
    }

    @objc(appBarTextSelectedColor)
    static var appBarTextSelected: UIColor {
        Mistica.currentColorPalette.appBarTextSelected
    }

    // MARK: Buttons

    @objc(buttonPrimaryBackgroundColor)
    static var buttonPrimaryBackground: UIColor {
        Mistica.currentColorPalette.buttonPrimaryBackground
    }

    @objc(buttonPrimaryBackgroundSelectedColor)
    static var buttonPrimaryBackgroundSelected: UIColor {
        Mistica.currentColorPalette.buttonPrimaryBackgroundSelected
    }

    @objc(buttonPrimaryBackgroundDisabledColor)
    static var buttonPrimaryBackgroundDisabled: UIColor {
        Mistica.currentColorPalette.buttonPrimaryBackgroundDisabled
    }

    @objc(buttonSecondaryBackgroundColor)
    static var buttonSecondaryBackground: UIColor {
        Mistica.currentColorPalette.buttonSecondaryBackground
    }

    @objc(buttonSecondaryBackgroundSelectedColor)
    static var buttonSecondaryBackgroundSelected: UIColor {
        Mistica.currentColorPalette.buttonSecondaryBackgroundSelected
    }

    @objc(buttonSecondaryBackgroundDisabledColor)
    static var buttonSecondaryBackgroundDisabled: UIColor {
        Mistica.currentColorPalette.buttonSecondaryBackgroundDisabled
    }

    @objc(buttonTertiaryBackgroundColor)
    static var buttonTertiaryBackground: UIColor {
        Mistica.currentColorPalette.buttonTertiaryBackground
    }

    @objc(buttonTertiaryBackgroundSelectedColor)
    static var buttonTertiaryBackgroundSelected: UIColor {
        Mistica.currentColorPalette.buttonTertiaryBackgroundSelected
    }

    @objc(buttonTertiaryBackgroundDisabledColor)
    static var buttonTertiaryBackgroundDisabled: UIColor {
        Mistica.currentColorPalette.buttonTertiaryBackgroundDisabled
    }

    @objc(buttonDangerColor)
    static var buttonDanger: UIColor {
        Mistica.currentColorPalette.buttonDanger
    }

    @objc(buttonDangerSelectedColor)
    static var buttonDangerSelected: UIColor {
        Mistica.currentColorPalette.buttonDangerSelected
    }

    @objc(buttonDangerDisabledColor)
    static var buttonDangerDisabled: UIColor {
        Mistica.currentColorPalette.buttonDangerDisabled
    }

    @objc(quickActionPrimaryBackgroundColor)
    static var quickActionPrimaryBackground: UIColor {
        Mistica.currentColorPalette.quickActionPrimaryBackground
    }

    @objc(quickActionBackgroundDestructiveColor)
    static var quickActionBackgroundDestructive: UIColor {
        Mistica.currentColorPalette.quickActionBackgroundDestructive
    }

    @objc(buttonBorderColor)
    static var buttonBorder: UIColor {
        Mistica.currentColorPalette.buttonBorder
    }

    @objc(buttonBorderSelectedColor)
    static var buttonBorderSelected: UIColor {
        Mistica.currentColorPalette.buttonBorderSelected
    }

    @objc(buttonBorderDisabledColor)
    static var buttonBorderDisabled: UIColor {
        Mistica.currentColorPalette.buttonBorderDisabled
    }

    @objc(buttonBorderHighlightedColor)
    static var buttonBorderHighlighted: UIColor {
        Mistica.currentColorPalette.buttonBorderHighlighted
    }

    static var buttonPrimaryBackgroundInverse: UIColor {
        Mistica.currentColorPalette.buttonPrimaryBackgroundInverse
    }

    static var buttonPrimaryBackgroundSelectedInverse: UIColor {
        Mistica.currentColorPalette.buttonPrimaryBackgroundSelectedInverse
    }

    static var buttonPrimaryBackgroundDisabledInverse: UIColor {
        Mistica.currentColorPalette.buttonPrimaryBackgroundDisabledInverse
    }

    static var buttonSecondaryBorderInverse: UIColor {
        Mistica.currentColorPalette.buttonSecondaryBorderInverse
    }

    static var buttonSecondaryBorderSelectedInverse: UIColor {
        Mistica.currentColorPalette.buttonSecondaryBorderSelectedInverse
    }

    static var buttonSecondaryBorderDisabledInverse: UIColor {
        Mistica.currentColorPalette.buttonSecondaryBorderDisabledInverse
    }

    static var buttonLinkBackgroundSelected: UIColor {
        Mistica.currentColorPalette.buttonLinkBackgroundSelected
    }

    static var buttonLinkBackgroundSelectedInverse: UIColor {
        Mistica.currentColorPalette.buttonLinkBackgroundSelectedInverse
    }

    // MARK: Controls

    @objc(controlColor)
    static var control: UIColor {
        Mistica.currentColorPalette.control
    }

    @objc(controlActivatedColor)
    static var controlActivated: UIColor {
        Mistica.currentColorPalette.controlActivated
    }

    @objc(controlHighlightedColor)
    static var controlHighlighted: UIColor {
        Mistica.currentColorPalette.controlHighlighted
    }

    // MARK: SegmentedControls

    @objc(textSegmentedControlColor)
    static var textSegmentedControl: UIColor {
        Mistica.currentColorPalette.textSegmentedControl
    }

    @objc(textSegmentedControlSelectedColor)
    static var textSegmentedControlSelected: UIColor {
        Mistica.currentColorPalette.textSegmentedControlSelected
    }

    static var segmentedControlBackgroundSelected: UIColor {
        Mistica.currentColorPalette.segmentedControlBackgroundSelected
    }

    // MARK: Feedback

    @objc(feedbackInfoBackgroundColor)
    static var feedbackInfoBackground: UIColor {
        Mistica.currentColorPalette.feedbackInfoBackground
    }

    @objc(feedbackErrorBackgroundColor)
    static var feedbackErrorBackground: UIColor {
        Mistica.currentColorPalette.feedbackErrorBackground
    }

    static var textLinkSnackbar: UIColor {
        Mistica.currentColorPalette.textLinkSnackbar
    }

    @objc(textSegmentedControlInverseColor)
    static var textSegmentedControlInverse: UIColor {
        Mistica.currentColorPalette.textSegmentedControlInverse
    }

    @objc(textSegmentedControlInverseSelectedColor)
    static var textSegmentedControlInverseSelected: UIColor {
        Mistica.currentColorPalette.textSegmentedControlInverseSelected
    }

    @objc(segmentedControlBackgroundInverseSelectedColor)
    static var segmentedControlBackgroundInverseSelected: UIColor {
        Mistica.currentColorPalette.segmentedControlBackgroundInverseSelected
    }

    // MARK: Bubbles

    @objc(bubbleTimeBackgroundColor)
    static var bubbleTimeBackground: UIColor {
        Mistica.currentColorPalette.bubbleTimeBackground
    }

    @objc(bubbleMeBackgroundColor)
    static var bubbleMeBackground: UIColor {
        Mistica.currentColorPalette.bubbleMeBackground
    }

    @objc(bubbleMeBackgroundSelectedColor)
    static var bubbleMeBackgroundSelected: UIColor {
        Mistica.currentColorPalette.bubbleMeBackgroundSelected
    }

    @objc(bubbleOtherBackgroundColor)
    static var bubbleOtherBackground: UIColor {
        Mistica.currentColorPalette.bubbleOtherBackground
    }

    @objc(bubbleOtherBackgroundSelectedColor)
    static var bubbleOtherBackgroundSelected: UIColor {
        Mistica.currentColorPalette.bubbleOtherBackgroundSelected
    }

    @objc(buttonBotColor)
    static var buttonBot: UIColor {
        Mistica.currentColorPalette.buttonBot
    }

    @objc(buttonBotSelectedColor)
    static var buttonBotSelected: UIColor {
        Mistica.currentColorPalette.buttonBotSelected
    }

    @objc(buttonBotBorderColor)
    static var buttonBotBorder: UIColor {
        Mistica.currentColorPalette.buttonBotBorder
    }

    @objc(accentBackgroundColor)
    static var accentBackground: UIColor {
        Mistica.currentColorPalette.accentBackground
    }

    // MARK: List

    @objc(contactListAlphabetColor)
    static var contactListAlphabet: UIColor {
        Mistica.currentColorPalette.contactListAlphabet
    }

    // MARK: Assistant

    @objc(assistantButtonBackgroundColor)
    static var assistantButtonBackground: UIColor {
        Mistica.currentColorPalette.assistantButtonBackground
    }

    @objc(assistantButtonBackgroundHighlightedColor)
    static var assistantButtonBackgroundHighlighted: UIColor {
        Mistica.currentColorPalette.assistantButtonBackgroundHighlighted
    }

    @objc(assistantButtonBackgroundSelectedColor)
    static var assistantButtonBackgroundSelected: UIColor {
        Mistica.currentColorPalette.assistantButtonBackgroundSelected
    }

    @objc(assistantButtonBackgroundDisabledColor)
    static var assistantButtonBackgroundDisabled: UIColor {
        Mistica.currentColorPalette.assistantButtonBackgroundDisabled
    }

    @objc(assistantButtonBorderBackgroundColor)
    static var assistantButtonBorderBackground: UIColor {
        Mistica.currentColorPalette.assistantButtonBorderBackground
    }

    @objc(assistantButtonBorderBackgroundSelectedColor)
    static var assistantButtonBorderBackgroundSelected: UIColor {
        Mistica.currentColorPalette.assistantButtonBorderBackgroundSelected
    }

    @objc(assistantButtonBorderBackgroundDisabledColor)
    static var assistantButtonBorderBackgroundDisabled: UIColor {
        Mistica.currentColorPalette.assistantButtonBorderBackgroundDisabled
    }

    @objc(assistantButtonNotificationsBackgroundColor)
    static var assistantButtonNotificationsBackground: UIColor {
        Mistica.currentColorPalette.assistantButtonNotificationsBackground
    }

    @objc(assistantDividerColor)
    static var assistantDivider: UIColor {
        Mistica.currentColorPalette.assistantDivider
    }

    @objc(assistantArrowColor)
    static var assistantArrow: UIColor {
        Mistica.currentColorPalette.assistantArrow
    }

    @objc(assistantPlaceholderTextColor)
    static var assistantPlaceholderText: UIColor {
        Mistica.currentColorPalette.assistantPlaceholderText
    }

    @objc(assistantCardShadowColor)
    static var assistantCardShadow: UIColor {
        Mistica.currentColorPalette.assistantCardShadow
    }

    @objc(assistantBadgeColor)
    static var assistantBadge: UIColor {
        Mistica.currentColorPalette.assistantBadge
    }

    // MARK: Charts

    @objc(chartPrimaryInactiveColor)
    static var chartPrimaryInactive: UIColor {
        Mistica.currentColorPalette.chartPrimaryInactive
    }

    @objc(chartPrimaryActiveColor)
    static var chartPrimaryActive: UIColor {
        Mistica.currentColorPalette.chartPrimaryActive
    }

    @objc(chartSecondaryInactiveColor)
    static var chartSecondaryInactive: UIColor {
        Mistica.currentColorPalette.chartSecondaryInactive
    }

    @objc(chartSecondaryActiveColor)
    static var chartSecondaryActive: UIColor {
        Mistica.currentColorPalette.chartSecondaryActive
    }

    @objc(ratingInactiveColor)
    static var ratingInactive: UIColor {
        Mistica.currentColorPalette.ratingInactive
    }

    @objc(ratingActiveColor)
    static var ratingActive: UIColor {
        Mistica.currentColorPalette.ratingActive
    }

    // MARK: Skeletons

    @objc(skeletonBackgroundColor)
    static var skeletonBackground: UIColor {
        Mistica.currentColorPalette.skeletonBackground
    }

    @objc(skeletonWaveColor)
    static var skeletonWave: UIColor {
        Mistica.currentColorPalette.skeletonWave
    }

    // MARK: Progress bars

    @objc(progressBarColor)
    static var progressBar: UIColor {
        Mistica.currentColorPalette.progressBar
    }

    // MARK: Status

    @objc(tagBackgroundFirstColor)
    static var tagBackgroundFirst: UIColor {
        Mistica.currentColorPalette.tagBackgroundFirst
    }

    @objc(tagBackgroundSecondColor)
    static var tagBackgroundSecond: UIColor {
        Mistica.currentColorPalette.tagBackgroundSecond
    }

    @objc(tagBackgroundThirdColor)
    static var tagBackgroundThird: UIColor {
        Mistica.currentColorPalette.tagBackgroundThird
    }

    @objc(tagBackgroundFourthColor)
    static var tagBackgroundFourth: UIColor {
        Mistica.currentColorPalette.tagBackgroundFourth
    }

    // MARK: Account Widget

    @objc(amountBillingInfoWarningColor)
    static var amountBillingInfoWarning: UIColor {
        Mistica.currentColorPalette.amountBillingInfoWarning
    }

    @objc(chartWarningColor)
    static var chartWarning: UIColor {
        Mistica.currentColorPalette.chartWarning
    }

    @objc(chartWarningLightColor)
    static var chartWarningLight: UIColor {
        Mistica.currentColorPalette.chartWarningLight
    }

    @objc(chartBackgroundColor)
    static var chartBackground: UIColor {
        Mistica.currentColorPalette.chartBackground
    }

    @objc(chartUnlimitedColor)
    static var chartUnlimited: UIColor {
        Mistica.currentColorPalette.chartUnlimited
    }

    @objc(chartDangerColor)
    static var chartDanger: UIColor {
        Mistica.currentColorPalette.chartDanger
    }

    @objc(chartPrimaryColor)
    static var chartPrimary: UIColor {
        Mistica.currentColorPalette.chartPrimary
    }

    @objc(chartPrimaryDarkColor)
    static var chartPrimaryDark: UIColor {
        Mistica.currentColorPalette.chartPrimaryDark
    }

    @objc(chartPrimaryLightColor)
    static var chartPrimaryLight: UIColor {
        Mistica.currentColorPalette.chartPrimaryLight
    }

    @objc(chartCriticalColor)
    static var chartCritical: UIColor {
        Mistica.currentColorPalette.chartCritical
    }

    // MARK: IPComms (Deprecated)

    @objc(rowBackgroundHighlightedColor)
    static var rowBackgroundHighlighted: UIColor {
        Mistica.currentColorPalette.rowBackgroundHighlighted
    }

    @objc(bubbleLocationIncomingBackgroundTintColor)
    static var bubbleLocationIncomingBackgroundTint: UIColor {
        Mistica.currentColorPalette.bubbleLocationIncomingBackgroundTint
    }

    // MARK: Explore

    static var timeIndicatorWarning: UIColor {
        Mistica.currentColorPalette.timeIndicatorWarning
    }

    // MARK: Support

    static var textPrimaryOverImage: UIColor {
        Mistica.currentColorPalette.textPrimaryOverImage
    }

    static var textSecondaryOverImage: UIColor {
        Mistica.currentColorPalette.textSecondaryOverImage
    }

    static var tableBackground: UIColor {
        Mistica.currentColorPalette.tableBackground
    }

    // MARK: BadgeView

    static var badgeColor: UIColor {
        Mistica.currentColorPalette.badgeColor
    }

    // MARK: Notification Inbox

    static var scrollContentIndicatorBackgroundFirst: UIColor {
        Mistica.currentColorPalette.scrollContentIndicatorBackgroundFirst
    }

    static var scrollContentIndicatorBackgroundSecond: UIColor {
        Mistica.currentColorPalette.scrollContentIndicatorBackgroundSecond
    }

    // MARK: IPComms (Deprecated)

    @objc(cellBackgroundHighlightedColor)
    static var cellBackgroundHighlighted: UIColor {
        Mistica.currentColorPalette.cellBackgroundHighlighted
    }
}

public extension BrandStyle {
    /// This is a temporary flag while we are waiting to communicate some OBs these changes
    /// This will be removed in the future and use the new tinting style for every brand
    var shouldUseLegacyTintForControls: Bool {
        switch self {
        case .movistar, .vivo, .o2:
            return false
        case .o2Classic:
            return true
        }
    }

    var preferredStatusBarStyle: UIStatusBarStyle {
        switch self {
        case .movistar, .vivo, .o2, .o2Classic:
            return .lightContent
        }
    }
}
