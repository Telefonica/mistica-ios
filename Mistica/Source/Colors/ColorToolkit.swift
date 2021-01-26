//
//  ColorToolkit.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension UIColor {
    // MARK: Text

    @objc(textPrimaryColor)
    static var textPrimary: UIColor {
        MisticaConfig.currentColorPalette.textPrimary
    }

    @objc(textDisabledColor)
    static var textDisabled: UIColor {
        MisticaConfig.currentColorPalette.textDisabled
    }

    @objc(textPrimaryInverseColor)
    static var textPrimaryInverse: UIColor {
        MisticaConfig.currentColorPalette.textPrimaryInverse
    }

    @objc(textSecondaryColor)
    static var textSecondary: UIColor {
        MisticaConfig.currentColorPalette.textSecondary
    }

    @objc(textSecondaryAlternativeColor)
    static var textSecondaryAlternative: UIColor {
        MisticaConfig.currentColorPalette.textSecondaryAlternative
    }

    @objc(textSecondaryInverseColor)
    static var textSecondaryInverse: UIColor {
        MisticaConfig.currentColorPalette.textSecondaryInverse
    }

    @objc(textHintColor)
    static var textHint: UIColor {
        MisticaConfig.currentColorPalette.textHint
    }

    @objc(textAccentColor)
    static var textAccent: UIColor {
        MisticaConfig.currentColorPalette.textAccent
    }

    @objc(textDangerColor)
    static var textDanger: UIColor {
        MisticaConfig.currentColorPalette.textDanger
    }

    @objc(textAccentSelectedColor)
    static var textAccentSelected: UIColor {
        MisticaConfig.currentColorPalette.textAccentSelected
    }

    @objc(textLinkColor)
    static var textLink: UIColor {
        MisticaConfig.currentColorPalette.textLink
    }

    @objc(textLinkSelectedColor)
    static var textLinkSelected: UIColor {
        MisticaConfig.currentColorPalette.textLinkSelected
    }

    @objc(textLinkDisabledColor)
    static var textLinkDisabled: UIColor {
        MisticaConfig.currentColorPalette.textLinkDisabled
    }

    @objc(textButtonPrimaryColor)
    static var textButtonPrimary: UIColor {
        MisticaConfig.currentColorPalette.textButtonPrimary
    }

    @objc(textButtonPrimaryInverseColor)
    static var textButtonPrimaryInverse: UIColor {
        MisticaConfig.currentColorPalette.textButtonPrimaryInverse
    }

    static var textButtonPrimaryInverseSelected: UIColor {
        MisticaConfig.currentColorPalette.textButtonPrimaryInverseSelected
    }

    static var textButtonPrimaryInverseDisabled: UIColor {
        MisticaConfig.currentColorPalette.textButtonPrimaryInverseDisabled
    }

    @objc(textButtonSecondaryColor)
    static var textButtonSecondary: UIColor {
        MisticaConfig.currentColorPalette.textButtonSecondary
    }

    @objc(textButtonSecondarySelectedColor)
    static var textButtonSecondarySelected: UIColor {
        MisticaConfig.currentColorPalette.textButtonSecondarySelected
    }

    @objc(textButtonSecondaryDisabledColor)
    static var textButtonSecondaryDisabled: UIColor {
        MisticaConfig.currentColorPalette.textButtonSecondaryDisabled
    }

    @objc(textButtonSecondaryInverseColor)
    static var textButtonSecondaryInverse: UIColor {
        MisticaConfig.currentColorPalette.textButtonSecondaryInverse
    }

    @objc(textButtonSecondaryInverseSelectedColor)
    static var textButtonSecondaryInverseSelected: UIColor {
        MisticaConfig.currentColorPalette.textButtonSecondaryInverseSelected
    }

    @objc(textButtonSecondaryInverseDisabledColor)
    static var textButtonSecondaryInverseDisabled: UIColor {
        MisticaConfig.currentColorPalette.textButtonSecondaryInverseDisabled
    }

    @objc(textButtonTertiaryColor)
    static var textButtonTertiary: UIColor {
        MisticaConfig.currentColorPalette.textButtonTertiary
    }

    static var textLinkInverse: UIColor {
        MisticaConfig.currentColorPalette.textLinkInverse
    }

    static var textLinkInverseSelected: UIColor {
        MisticaConfig.currentColorPalette.textLinkInverseSelected
    }

    static var textLinkInverseDisabled: UIColor {
        MisticaConfig.currentColorPalette.textLinkInverseDisabled
    }

    @objc(textInputLabelColor)
    static var textInputLabel: UIColor {
        MisticaConfig.currentColorPalette.textInputLabel
    }

    @objc(textInputLabelError)
    static var textInputLabelError: UIColor {
        MisticaConfig.currentColorPalette.textInputLabelError
    }

    @objc(gradientBackgroundFirstColor)
    static var gradientBackgroundFirst: UIColor {
        MisticaConfig.currentColorPalette.gradientBackgroundFirst
    }

    @objc(gradientBackgroundSecondColor)
    static var gradientBackgroundSecond: UIColor {
        MisticaConfig.currentColorPalette.gradientBackgroundSecond
    }

    @objc(gradientBackgroundThirdColor)
    static var gradientBackgroundThird: UIColor {
        MisticaConfig.currentColorPalette.gradientBackgroundThird
    }

    @objc(gradientBackgroundFourthColor)
    static var gradientBackgroundFourth: UIColor {
        MisticaConfig.currentColorPalette.gradientBackgroundFourth
    }

    @objc(backgroundBrandFirstColor)
    static var backgroundBrandFirst: UIColor {
        MisticaConfig.currentColorPalette.backgroundBrandFirst
    }

    @objc(backgroundBrandSecondColor)
    static var backgroundBrandSecond: UIColor {
        MisticaConfig.currentColorPalette.backgroundBrandSecond
    }

    @objc(backgroundBrandThirdColor)
    static var backgroundBrandThird: UIColor {
        MisticaConfig.currentColorPalette.backgroundBrandThird
    }

    @objc(backgroundBrandFourthColor)
    static var backgroundBrandFourth: UIColor {
        MisticaConfig.currentColorPalette.backgroundBrandFourth
    }

    // MARK: Backgrounds

    @objc(backgroundColor)
    static var background: UIColor {
        MisticaConfig.currentColorPalette.background
    }

    @objc(backgroundOpacityColor)
    /// Usually for veils and transparencies
    static var backgroundOpacity: UIColor {
        MisticaConfig.currentColorPalette.backgroundOpacity
    }

    @objc(dividerColor)
    static var divider: UIColor {
        MisticaConfig.currentColorPalette.divider
    }

    @objc(backgroundAlternativeColor)
    static var backgroundAlternative: UIColor {
        MisticaConfig.currentColorPalette.backgroundAlternative
    }

    @objc(backgroundPromoColor)
    static var backgroundPromo: UIColor {
        MisticaConfig.currentColorPalette.backgroundPromo
    }

    @objc(rowBackgroundColor)
    static var rowBackground: UIColor {
        MisticaConfig.currentColorPalette.rowBackground
    }

    @objc(placeholderBackgroundColor)
    static var placeholderBackground: UIColor {
        MisticaConfig.currentColorPalette.placeholderBackground
    }

    @objc(borderColor)
    static var border: UIColor {
        MisticaConfig.currentColorPalette.border
    }

    @objc(borderDark)
    static var borderDark: UIColor {
        MisticaConfig.currentColorPalette.borderDark
    }

    @objc(borderSelectedColor)
    static var borderSelected: UIColor {
        MisticaConfig.currentColorPalette.borderSelected
    }

    // MARK: Icons

    @objc(iconPrimaryColor)
    static var iconPrimary: UIColor {
        MisticaConfig.currentColorPalette.iconPrimary
    }

    @objc(iconAccentColor)
    static var iconAccent: UIColor {
        MisticaConfig.currentColorPalette.iconAccent
    }

    @objc(iconDisabledColor)
    static var iconDisabled: UIColor {
        MisticaConfig.currentColorPalette.iconDisabled
    }

    @objc(iconSecondaryColor)
    static var iconSecondary: UIColor {
        MisticaConfig.currentColorPalette.iconSecondary
    }

    @objc(iconTertiaryColor)
    static var iconTertiary: UIColor {
        MisticaConfig.currentColorPalette.iconTertiary
    }

    @objc(iconInverseColor)
    static var iconInverse: UIColor {
        MisticaConfig.currentColorPalette.iconInverse
    }

    // MARK: Search bar

    @objc(navigationsSearchBarBackgroundColor)
    static var navigationsSearchBarBackground: UIColor {
        MisticaConfig.currentColorPalette.navigationsSearchBarBackground
    }

    @objc(navigationSearchBarTextColor)
    static var navigationSearchBarText: UIColor {
        MisticaConfig.currentColorPalette.navigationSearchBarText
    }

    @objc(navigationSearchBarHintTextColor)
    static var navigationSearchBarHintText: UIColor {
        MisticaConfig.currentColorPalette.navigationSearchBarHintText
    }

    @objc(iconNavigationBarColor)
    static var iconNavigationBar: UIColor {
        MisticaConfig.currentColorPalette.iconNavigationBar
    }

    // MARK: Navigation bar

    @objc(navigationBarBackgroundColor)
    static var navigationBarBackground: UIColor {
        MisticaConfig.currentColorPalette.navigationBarBackground
    }

    @objc(navigationBarDividerColor)
    static var navigationBarDivider: UIColor {
        MisticaConfig.currentColorPalette.navigationBarDivider
    }

    @objc(navigationBarPrimaryColor)
    static var navigationBarPrimary: UIColor {
        MisticaConfig.currentColorPalette.navigationBarPrimary
    }

    @objc(navigationBarSecondaryColor)
    static var navigationBarSecondary: UIColor {
        MisticaConfig.currentColorPalette.navigationBarSecondary
    }

    // MARK: Tab bar

    @objc(appBarBackgroundColor)
    static var appBarBackground: UIColor {
        MisticaConfig.currentColorPalette.appBarBackground
    }

    @objc(appBarTextColor)
    static var appBarText: UIColor {
        MisticaConfig.currentColorPalette.appBarText
    }

    @objc(appBarTextSelectedColor)
    static var appBarTextSelected: UIColor {
        MisticaConfig.currentColorPalette.appBarTextSelected
    }

    // MARK: Buttons

    @objc(buttonPrimaryBackgroundColor)
    static var buttonPrimaryBackground: UIColor {
        MisticaConfig.currentColorPalette.buttonPrimaryBackground
    }

    @objc(buttonPrimaryBackgroundSelectedColor)
    static var buttonPrimaryBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.buttonPrimaryBackgroundSelected
    }

    @objc(buttonPrimaryBackgroundDisabledColor)
    static var buttonPrimaryBackgroundDisabled: UIColor {
        MisticaConfig.currentColorPalette.buttonPrimaryBackgroundDisabled
    }

    @objc(buttonSecondaryBackgroundColor)
    static var buttonSecondaryBackground: UIColor {
        MisticaConfig.currentColorPalette.buttonSecondaryBackground
    }

    @objc(buttonSecondaryBackgroundSelectedColor)
    static var buttonSecondaryBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.buttonSecondaryBackgroundSelected
    }

    @objc(buttonSecondaryBackgroundDisabledColor)
    static var buttonSecondaryBackgroundDisabled: UIColor {
        MisticaConfig.currentColorPalette.buttonSecondaryBackgroundDisabled
    }

    @objc(buttonTertiaryBackgroundColor)
    static var buttonTertiaryBackground: UIColor {
        MisticaConfig.currentColorPalette.buttonTertiaryBackground
    }

    @objc(buttonTertiaryBackgroundSelectedColor)
    static var buttonTertiaryBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.buttonTertiaryBackgroundSelected
    }

    @objc(buttonTertiaryBackgroundDisabledColor)
    static var buttonTertiaryBackgroundDisabled: UIColor {
        MisticaConfig.currentColorPalette.buttonTertiaryBackgroundDisabled
    }

    @objc(buttonDangerColor)
    static var buttonDanger: UIColor {
        MisticaConfig.currentColorPalette.buttonDanger
    }

    @objc(buttonDangerSelectedColor)
    static var buttonDangerSelected: UIColor {
        MisticaConfig.currentColorPalette.buttonDangerSelected
    }

    @objc(buttonDangerDisabledColor)
    static var buttonDangerDisabled: UIColor {
        MisticaConfig.currentColorPalette.buttonDangerDisabled
    }

    @objc(quickActionPrimaryBackgroundColor)
    static var quickActionPrimaryBackground: UIColor {
        MisticaConfig.currentColorPalette.quickActionPrimaryBackground
    }

    @objc(quickActionBackgroundDestructiveColor)
    static var quickActionBackgroundDestructive: UIColor {
        MisticaConfig.currentColorPalette.quickActionBackgroundDestructive
    }

    @objc(buttonBorderColor)
    static var buttonBorder: UIColor {
        MisticaConfig.currentColorPalette.buttonBorder
    }

    @objc(buttonBorderSelectedColor)
    static var buttonBorderSelected: UIColor {
        MisticaConfig.currentColorPalette.buttonBorderSelected
    }

    @objc(buttonBorderDisabledColor)
    static var buttonBorderDisabled: UIColor {
        MisticaConfig.currentColorPalette.buttonBorderDisabled
    }

    @objc(buttonBorderHighlightedColor)
    static var buttonBorderHighlighted: UIColor {
        MisticaConfig.currentColorPalette.buttonBorderHighlighted
    }

    static var buttonPrimaryBackgroundInverse: UIColor {
        MisticaConfig.currentColorPalette.buttonPrimaryBackgroundInverse
    }

    static var buttonPrimaryBackgroundSelectedInverse: UIColor {
        MisticaConfig.currentColorPalette.buttonPrimaryBackgroundSelectedInverse
    }

    static var buttonPrimaryBackgroundDisabledInverse: UIColor {
        MisticaConfig.currentColorPalette.buttonPrimaryBackgroundDisabledInverse
    }

    static var buttonSecondaryBorderInverse: UIColor {
        MisticaConfig.currentColorPalette.buttonSecondaryBorderInverse
    }

    static var buttonSecondaryBorderSelectedInverse: UIColor {
        MisticaConfig.currentColorPalette.buttonSecondaryBorderSelectedInverse
    }

    static var buttonSecondaryBorderDisabledInverse: UIColor {
        MisticaConfig.currentColorPalette.buttonSecondaryBorderDisabledInverse
    }

    static var buttonLinkBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.buttonLinkBackgroundSelected
    }

    static var buttonLinkBackgroundSelectedInverse: UIColor {
        MisticaConfig.currentColorPalette.buttonLinkBackgroundSelectedInverse
    }

    // MARK: Controls

    @objc(controlColor)
    static var control: UIColor {
        MisticaConfig.currentColorPalette.control
    }

    @objc(controlActivatedColor)
    static var controlActivated: UIColor {
        MisticaConfig.currentColorPalette.controlActivated
    }

    @objc(controlHighlightedColor)
    static var controlHighlighted: UIColor {
        MisticaConfig.currentColorPalette.controlHighlighted
    }

    // MARK: SegmentedControls

    @objc(textSegmentedControlColor)
    static var textSegmentedControl: UIColor {
        MisticaConfig.currentColorPalette.textSegmentedControl
    }

    @objc(textSegmentedControlSelectedColor)
    static var textSegmentedControlSelected: UIColor {
        MisticaConfig.currentColorPalette.textSegmentedControlSelected
    }

    static var segmentedControlBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.segmentedControlBackgroundSelected
    }

    // MARK: Feedback

    @objc(feedbackInfoBackgroundColor)
    static var feedbackInfoBackground: UIColor {
        MisticaConfig.currentColorPalette.feedbackInfoBackground
    }

    @objc(feedbackErrorBackgroundColor)
    static var feedbackErrorBackground: UIColor {
        MisticaConfig.currentColorPalette.feedbackErrorBackground
    }

    static var textLinkSnackbar: UIColor {
        MisticaConfig.currentColorPalette.textLinkSnackbar
    }

    @objc(textSegmentedControlInverseColor)
    static var textSegmentedControlInverse: UIColor {
        MisticaConfig.currentColorPalette.textSegmentedControlInverse
    }

    @objc(textSegmentedControlInverseSelectedColor)
    static var textSegmentedControlInverseSelected: UIColor {
        MisticaConfig.currentColorPalette.textSegmentedControlInverseSelected
    }

    @objc(segmentedControlBackgroundInverseSelectedColor)
    static var segmentedControlBackgroundInverseSelected: UIColor {
        MisticaConfig.currentColorPalette.segmentedControlBackgroundInverseSelected
    }

    // MARK: Bubbles

    @objc(bubbleTimeBackgroundColor)
    static var bubbleTimeBackground: UIColor {
        MisticaConfig.currentColorPalette.bubbleTimeBackground
    }

    @objc(bubbleMeBackgroundColor)
    static var bubbleMeBackground: UIColor {
        MisticaConfig.currentColorPalette.bubbleMeBackground
    }

    @objc(bubbleMeBackgroundSelectedColor)
    static var bubbleMeBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.bubbleMeBackgroundSelected
    }

    @objc(bubbleOtherBackgroundColor)
    static var bubbleOtherBackground: UIColor {
        MisticaConfig.currentColorPalette.bubbleOtherBackground
    }

    @objc(bubbleOtherBackgroundSelectedColor)
    static var bubbleOtherBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.bubbleOtherBackgroundSelected
    }

    @objc(buttonBotColor)
    static var buttonBot: UIColor {
        MisticaConfig.currentColorPalette.buttonBot
    }

    @objc(buttonBotSelectedColor)
    static var buttonBotSelected: UIColor {
        MisticaConfig.currentColorPalette.buttonBotSelected
    }

    @objc(buttonBotBorderColor)
    static var buttonBotBorder: UIColor {
        MisticaConfig.currentColorPalette.buttonBotBorder
    }

    @objc(accentBackgroundColor)
    static var accentBackground: UIColor {
        MisticaConfig.currentColorPalette.accentBackground
    }

    // MARK: List

    @objc(contactListAlphabetColor)
    static var contactListAlphabet: UIColor {
        MisticaConfig.currentColorPalette.contactListAlphabet
    }

    // MARK: Assistant

    @objc(assistantButtonBackgroundColor)
    static var assistantButtonBackground: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonBackground
    }

    @objc(assistantButtonBackgroundHighlightedColor)
    static var assistantButtonBackgroundHighlighted: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonBackgroundHighlighted
    }

    @objc(assistantButtonBackgroundSelectedColor)
    static var assistantButtonBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonBackgroundSelected
    }

    @objc(assistantButtonBackgroundDisabledColor)
    static var assistantButtonBackgroundDisabled: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonBackgroundDisabled
    }

    @objc(assistantButtonBorderBackgroundColor)
    static var assistantButtonBorderBackground: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonBorderBackground
    }

    @objc(assistantButtonBorderBackgroundSelectedColor)
    static var assistantButtonBorderBackgroundSelected: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonBorderBackgroundSelected
    }

    @objc(assistantButtonBorderBackgroundDisabledColor)
    static var assistantButtonBorderBackgroundDisabled: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonBorderBackgroundDisabled
    }

    @objc(assistantButtonNotificationsBackgroundColor)
    static var assistantButtonNotificationsBackground: UIColor {
        MisticaConfig.currentColorPalette.assistantButtonNotificationsBackground
    }

    @objc(assistantDividerColor)
    static var assistantDivider: UIColor {
        MisticaConfig.currentColorPalette.assistantDivider
    }

    @objc(assistantArrowColor)
    static var assistantArrow: UIColor {
        MisticaConfig.currentColorPalette.assistantArrow
    }

    @objc(assistantPlaceholderTextColor)
    static var assistantPlaceholderText: UIColor {
        MisticaConfig.currentColorPalette.assistantPlaceholderText
    }

    @objc(assistantCardShadowColor)
    static var assistantCardShadow: UIColor {
        MisticaConfig.currentColorPalette.assistantCardShadow
    }

    @objc(assistantBadgeColor)
    static var assistantBadge: UIColor {
        MisticaConfig.currentColorPalette.assistantBadge
    }

    // MARK: Charts

    @objc(chartPrimaryInactiveColor)
    static var chartPrimaryInactive: UIColor {
        MisticaConfig.currentColorPalette.chartPrimaryInactive
    }

    @objc(chartPrimaryActiveColor)
    static var chartPrimaryActive: UIColor {
        MisticaConfig.currentColorPalette.chartPrimaryActive
    }

    @objc(chartSecondaryInactiveColor)
    static var chartSecondaryInactive: UIColor {
        MisticaConfig.currentColorPalette.chartSecondaryInactive
    }

    @objc(chartSecondaryActiveColor)
    static var chartSecondaryActive: UIColor {
        MisticaConfig.currentColorPalette.chartSecondaryActive
    }

    @objc(ratingInactiveColor)
    static var ratingInactive: UIColor {
        MisticaConfig.currentColorPalette.ratingInactive
    }

    @objc(ratingActiveColor)
    static var ratingActive: UIColor {
        MisticaConfig.currentColorPalette.ratingActive
    }

    // MARK: Skeletons

    @objc(skeletonBackgroundColor)
    static var skeletonBackground: UIColor {
        MisticaConfig.currentColorPalette.skeletonBackground
    }

    @objc(skeletonWaveColor)
    static var skeletonWave: UIColor {
        MisticaConfig.currentColorPalette.skeletonWave
    }

    // MARK: Progress bars

    @objc(progressBarColor)
    static var progressBar: UIColor {
        MisticaConfig.currentColorPalette.progressBar
    }

    // MARK: Status

    @objc(tagBackgroundFirstColor)
    static var tagBackgroundFirst: UIColor {
        MisticaConfig.currentColorPalette.tagBackgroundFirst
    }

    @objc(tagBackgroundSecondColor)
    static var tagBackgroundSecond: UIColor {
        MisticaConfig.currentColorPalette.tagBackgroundSecond
    }

    @objc(tagBackgroundThirdColor)
    static var tagBackgroundThird: UIColor {
        MisticaConfig.currentColorPalette.tagBackgroundThird
    }

    @objc(tagBackgroundFourthColor)
    static var tagBackgroundFourth: UIColor {
        MisticaConfig.currentColorPalette.tagBackgroundFourth
    }

    // MARK: Account Widget

    @objc(amountBillingInfoWarningColor)
    static var amountBillingInfoWarning: UIColor {
        MisticaConfig.currentColorPalette.amountBillingInfoWarning
    }

    @objc(chartWarningColor)
    static var chartWarning: UIColor {
        MisticaConfig.currentColorPalette.chartWarning
    }

    @objc(chartWarningLightColor)
    static var chartWarningLight: UIColor {
        MisticaConfig.currentColorPalette.chartWarningLight
    }

    @objc(chartBackgroundColor)
    static var chartBackground: UIColor {
        MisticaConfig.currentColorPalette.chartBackground
    }

    @objc(chartUnlimitedColor)
    static var chartUnlimited: UIColor {
        MisticaConfig.currentColorPalette.chartUnlimited
    }

    @objc(chartDangerColor)
    static var chartDanger: UIColor {
        MisticaConfig.currentColorPalette.chartDanger
    }

    @objc(chartPrimaryColor)
    static var chartPrimary: UIColor {
        MisticaConfig.currentColorPalette.chartPrimary
    }

    @objc(chartPrimaryDarkColor)
    static var chartPrimaryDark: UIColor {
        MisticaConfig.currentColorPalette.chartPrimaryDark
    }

    @objc(chartPrimaryLightColor)
    static var chartPrimaryLight: UIColor {
        MisticaConfig.currentColorPalette.chartPrimaryLight
    }

    @objc(chartCriticalColor)
    static var chartCritical: UIColor {
        MisticaConfig.currentColorPalette.chartCritical
    }

    // MARK: IPComms (Deprecated)

    @objc(rowBackgroundHighlightedColor)
    static var rowBackgroundHighlighted: UIColor {
        MisticaConfig.currentColorPalette.rowBackgroundHighlighted
    }

    @objc(bubbleLocationIncomingBackgroundTintColor)
    static var bubbleLocationIncomingBackgroundTint: UIColor {
        MisticaConfig.currentColorPalette.bubbleLocationIncomingBackgroundTint
    }

    // MARK: Explore

    static var timeIndicatorWarning: UIColor {
        MisticaConfig.currentColorPalette.timeIndicatorWarning
    }

    // MARK: Support

    static var textPrimaryOverImage: UIColor {
        MisticaConfig.currentColorPalette.textPrimaryOverImage
    }

    static var textSecondaryOverImage: UIColor {
        MisticaConfig.currentColorPalette.textSecondaryOverImage
    }

    static var tableBackground: UIColor {
        MisticaConfig.currentColorPalette.tableBackground
    }

    // MARK: BadgeView

    static var badgeColor: UIColor {
        MisticaConfig.currentColorPalette.badgeColor
    }

    // MARK: Notification Inbox

    static var scrollContentIndicatorBackgroundFirst: UIColor {
        MisticaConfig.currentColorPalette.scrollContentIndicatorBackgroundFirst
    }

    static var scrollContentIndicatorBackgroundSecond: UIColor {
        MisticaConfig.currentColorPalette.scrollContentIndicatorBackgroundSecond
    }

    // MARK: IPComms (Deprecated)

    @objc(cellBackgroundHighlightedColor)
    static var cellBackgroundHighlighted: UIColor {
        MisticaConfig.currentColorPalette.cellBackgroundHighlighted
    }
}

public extension BrandStyle {
    var preferredStatusBarStyle: UIStatusBarStyle {
        switch self {
        case .movistar, .vivo, .o2, .o2Classic:
            return .lightContent
        }
    }
}
