//
//  ColorToolkit.swift
//  Mistica
//
//  Created by Víctor Pimentel on 14/12/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

private var currentColorPalette: ColorPalette = MovistarColorPalette()

public extension UIColor {
	// MARK: Text

	@objc(textPrimaryColor)
	static var textPrimary: UIColor {
		currentColorPalette.textPrimary
	}

	@objc(textDisabledColor)
	static var textDisabled: UIColor {
		currentColorPalette.textDisabled
	}

	@objc(textPrimaryInverseColor)
	static var textPrimaryInverse: UIColor {
		currentColorPalette.textPrimaryInverse
	}

	@objc(textSecondaryColor)
	static var textSecondary: UIColor {
		currentColorPalette.textSecondary
	}

	@objc(textSecondaryAlternativeColor)
	static var textSecondaryAlternative: UIColor {
		currentColorPalette.textSecondaryAlternative
	}

	@objc(textSecondaryInverseColor)
	static var textSecondaryInverse: UIColor {
		currentColorPalette.textSecondaryInverse
	}

	@objc(textHintColor)
	static var textHint: UIColor {
		currentColorPalette.textHint
	}

	@objc(textAccentColor)
	static var textAccent: UIColor {
		currentColorPalette.textAccent
	}

	@objc(textDangerColor)
	static var textDanger: UIColor {
		currentColorPalette.textDanger
	}

	@objc(textAccentSelectedColor)
	static var textAccentSelected: UIColor {
		currentColorPalette.textAccentSelected
	}

	@objc(textLinkColor)
	static var textLink: UIColor {
		currentColorPalette.textLink
	}

	@objc(textLinkSelectedColor)
	static var textLinkSelected: UIColor {
		currentColorPalette.textLinkSelected
	}

	@objc(textLinkDisabledColor)
	static var textLinkDisabled: UIColor {
		currentColorPalette.textLinkDisabled
	}

	@objc(textButtonPrimaryColor)
	static var textButtonPrimary: UIColor {
		currentColorPalette.textButtonPrimary
	}

	@objc(textButtonPrimaryInverseColor)
	static var textButtonPrimaryInverse: UIColor {
		currentColorPalette.textButtonPrimaryInverse
	}

	static var textButtonPrimaryInverseSelected: UIColor {
		currentColorPalette.textButtonPrimaryInverseSelected
	}

	static var textButtonPrimaryInverseDisabled: UIColor {
		currentColorPalette.textButtonPrimaryInverseDisabled
	}

	@objc(textButtonSecondaryColor)
	static var textButtonSecondary: UIColor {
		currentColorPalette.textButtonSecondary
	}

	@objc(textButtonSecondarySelectedColor)
	static var textButtonSecondarySelected: UIColor {
		currentColorPalette.textButtonSecondarySelected
	}

	@objc(textButtonSecondaryDisabledColor)
	static var textButtonSecondaryDisabled: UIColor {
		currentColorPalette.textButtonSecondaryDisabled
	}

	@objc(textButtonSecondaryInverseColor)
	static var textButtonSecondaryInverse: UIColor {
		currentColorPalette.textButtonSecondaryInverse
	}

	@objc(textButtonSecondaryInverseSelectedColor)
	static var textButtonSecondaryInverseSelected: UIColor {
		currentColorPalette.textButtonSecondaryInverseSelected
	}

	@objc(textButtonSecondaryInverseDisabledColor)
	static var textButtonSecondaryInverseDisabled: UIColor {
		currentColorPalette.textButtonSecondaryInverseDisabled
	}

	@objc(textButtonTertiaryColor)
	static var textButtonTertiary: UIColor {
		currentColorPalette.textButtonTertiary
	}

	static var textLinkInverse: UIColor {
		currentColorPalette.textLinkInverse
	}

	static var textLinkInverseSelected: UIColor {
		currentColorPalette.textLinkInverseSelected
	}

	static var textLinkInverseDisabled: UIColor {
		currentColorPalette.textLinkInverseDisabled
	}

	@objc(textInputLabelColor)
	static var textInputLabel: UIColor {
		currentColorPalette.textInputLabel
	}

	@objc(textInputLabelError)
	static var textInputLabelError: UIColor {
		currentColorPalette.textInputLabelError
	}

	@objc(gradientBackgroundFirstColor)
	static var gradientBackgroundFirst: UIColor {
		currentColorPalette.gradientBackgroundFirst
	}

	@objc(gradientBackgroundSecondColor)
	static var gradientBackgroundSecond: UIColor {
		currentColorPalette.gradientBackgroundSecond
	}

	@objc(gradientBackgroundThirdColor)
	static var gradientBackgroundThird: UIColor {
		currentColorPalette.gradientBackgroundThird
	}

	@objc(gradientBackgroundFourthColor)
	static var gradientBackgroundFourth: UIColor {
		currentColorPalette.gradientBackgroundFourth
	}

	@objc(backgroundBrandFirstColor)
	static var backgroundBrandFirst: UIColor {
		currentColorPalette.backgroundBrandFirst
	}

	@objc(backgroundBrandSecondColor)
	static var backgroundBrandSecond: UIColor {
		currentColorPalette.backgroundBrandSecond
	}

	@objc(backgroundBrandThirdColor)
	static var backgroundBrandThird: UIColor {
		currentColorPalette.backgroundBrandThird
	}

	@objc(backgroundBrandFourthColor)
	static var backgroundBrandFourth: UIColor {
		currentColorPalette.backgroundBrandFourth
	}

	// MARK: Backgrounds

	@objc(backgroundColor)
	static var background: UIColor {
		currentColorPalette.background
	}

	@objc(backgroundOpacityColor)
	/// Usually for veils and transparencies
	static var backgroundOpacity: UIColor {
		currentColorPalette.backgroundOpacity
	}

	@objc(dividerColor)
	static var divider: UIColor {
		currentColorPalette.divider
	}

	@objc(backgroundAlternativeColor)
	static var backgroundAlternative: UIColor {
		currentColorPalette.backgroundAlternative
	}

	@objc(backgroundPromoColor)
	static var backgroundPromo: UIColor {
		currentColorPalette.backgroundPromo
	}

	@objc(rowBackgroundColor)
	static var rowBackground: UIColor {
		currentColorPalette.rowBackground
	}

	@objc(placeholderBackgroundColor)
	static var placeholderBackground: UIColor {
		currentColorPalette.placeholderBackground
	}

	@objc(borderColor)
	static var border: UIColor {
		currentColorPalette.border
	}

	@objc(borderSelectedColor)
	static var borderSelected: UIColor {
		currentColorPalette.borderSelected
	}

	// MARK: Icons

	@objc(iconPrimaryColor)
	static var iconPrimary: UIColor {
		currentColorPalette.iconPrimary
	}

	@objc(iconAccentColor)
	static var iconAccent: UIColor {
		currentColorPalette.iconAccent
	}

	@objc(iconDisabledColor)
	static var iconDisabled: UIColor {
		currentColorPalette.iconDisabled
	}

	@objc(iconSecondaryColor)
	static var iconSecondary: UIColor {
		currentColorPalette.iconSecondary
	}

	@objc(iconTertiaryColor)
	static var iconTertiary: UIColor {
		currentColorPalette.iconTertiary
	}

	@objc(iconInverseColor)
	static var iconInverse: UIColor {
		currentColorPalette.iconInverse
	}

	// MARK: Search bar

	@objc(navigationsSearchBarBackgroundColor)
	static var navigationsSearchBarBackground: UIColor {
		currentColorPalette.navigationsSearchBarBackground
	}

	@objc(navigationSearchBarTextColor)
	static var navigationSearchBarText: UIColor {
		currentColorPalette.navigationSearchBarText
	}

	@objc(navigationSearchBarHintTextColor)
	static var navigationSearchBarHintText: UIColor {
		currentColorPalette.navigationSearchBarHintText
	}

	@objc(iconNavigationBarColor)
	static var iconNavigationBar: UIColor {
		currentColorPalette.iconNavigationBar
	}

	// MARK: Navigation bar

	@objc(navigationBarBackgroundColor)
	static var navigationBarBackground: UIColor {
		currentColorPalette.navigationBarBackground
	}

	@objc(navigationBarDividerColor)
	static var navigationBarDivider: UIColor {
		currentColorPalette.navigationBarDivider
	}

	@objc(navigationBarPrimaryColor)
	static var navigationBarPrimary: UIColor {
		currentColorPalette.navigationBarPrimary
	}

	@objc(navigationBarSecondaryColor)
	static var navigationBarSecondary: UIColor {
		currentColorPalette.navigationBarSecondary
	}

	// MARK: Tab bar

	@objc(appBarBackgroundColor)
	static var appBarBackground: UIColor {
		currentColorPalette.appBarBackground
	}

	@objc(appBarTextColor)
	static var appBarText: UIColor {
		currentColorPalette.appBarText
	}

	@objc(appBarTextSelectedColor)
	static var appBarTextSelected: UIColor {
		currentColorPalette.appBarTextSelected
	}

	// MARK: Buttons

	@objc(buttonPrimaryBackgroundColor)
	static var buttonPrimaryBackground: UIColor {
		currentColorPalette.buttonPrimaryBackground
	}

	@objc(buttonPrimaryBackgroundSelectedColor)
	static var buttonPrimaryBackgroundSelected: UIColor {
		currentColorPalette.buttonPrimaryBackgroundSelected
	}

	@objc(buttonPrimaryBackgroundDisabledColor)
	static var buttonPrimaryBackgroundDisabled: UIColor {
		currentColorPalette.buttonPrimaryBackgroundDisabled
	}

	@objc(buttonSecondaryBackgroundColor)
	static var buttonSecondaryBackground: UIColor {
		currentColorPalette.buttonSecondaryBackground
	}

	@objc(buttonSecondaryBackgroundSelectedColor)
	static var buttonSecondaryBackgroundSelected: UIColor {
		currentColorPalette.buttonSecondaryBackgroundSelected
	}

	@objc(buttonSecondaryBackgroundDisabledColor)
	static var buttonSecondaryBackgroundDisabled: UIColor {
		currentColorPalette.buttonSecondaryBackgroundDisabled
	}

	@objc(buttonTertiaryBackgroundColor)
	static var buttonTertiaryBackground: UIColor {
		currentColorPalette.buttonTertiaryBackground
	}

	@objc(buttonTertiaryBackgroundSelectedColor)
	static var buttonTertiaryBackgroundSelected: UIColor {
		currentColorPalette.buttonTertiaryBackgroundSelected
	}

	@objc(buttonTertiaryBackgroundDisabledColor)
	static var buttonTertiaryBackgroundDisabled: UIColor {
		currentColorPalette.buttonTertiaryBackgroundDisabled
	}

	@objc(buttonDangerColor)
	static var buttonDanger: UIColor {
		currentColorPalette.buttonDanger
	}

	@objc(buttonDangerSelectedColor)
	static var buttonDangerSelected: UIColor {
		currentColorPalette.buttonDangerSelected
	}

	@objc(buttonDangerDisabledColor)
	static var buttonDangerDisabled: UIColor {
		currentColorPalette.buttonDangerDisabled
	}

	@objc(quickActionPrimaryBackgroundColor)
	static var quickActionPrimaryBackground: UIColor {
		currentColorPalette.quickActionPrimaryBackground
	}

	@objc(quickActionBackgroundDestructiveColor)
	static var quickActionBackgroundDestructive: UIColor {
		currentColorPalette.quickActionBackgroundDestructive
	}

	@objc(buttonBorderColor)
	static var buttonBorder: UIColor {
		currentColorPalette.buttonBorder
	}

	@objc(buttonBorderSelectedColor)
	static var buttonBorderSelected: UIColor {
		currentColorPalette.buttonBorderSelected
	}

	@objc(buttonBorderDisabledColor)
	static var buttonBorderDisabled: UIColor {
		currentColorPalette.buttonBorderDisabled
	}

	@objc(buttonBorderHighlightedColor)
	static var buttonBorderHighlighted: UIColor {
		currentColorPalette.buttonBorderHighlighted
	}

	static var buttonPrimaryBackgroundInverse: UIColor {
		currentColorPalette.buttonPrimaryBackgroundInverse
	}

	static var buttonPrimaryBackgroundSelectedInverse: UIColor {
		currentColorPalette.buttonPrimaryBackgroundSelectedInverse
	}

	static var buttonPrimaryBackgroundDisabledInverse: UIColor {
		currentColorPalette.buttonPrimaryBackgroundDisabledInverse
	}

	static var buttonSecondaryBorderInverse: UIColor {
		currentColorPalette.buttonSecondaryBorderInverse
	}

	static var buttonSecondaryBorderSelectedInverse: UIColor {
		currentColorPalette.buttonSecondaryBorderSelectedInverse
	}

	static var buttonSecondaryBorderDisabledInverse: UIColor {
		currentColorPalette.buttonSecondaryBorderDisabledInverse
	}

	static var buttonLinkBackgroundSelected: UIColor {
		currentColorPalette.buttonLinkBackgroundSelected
	}

	static var buttonLinkBackgroundSelectedInverse: UIColor {
		currentColorPalette.buttonLinkBackgroundSelectedInverse
	}

	// MARK: Controls

	@objc(controlColor)
	static var control: UIColor {
		currentColorPalette.control
	}

	@objc(controlActivatedColor)
	static var controlActivated: UIColor {
		currentColorPalette.controlActivated
	}

	@objc(controlHighlightedColor)
	static var controlHighlighted: UIColor {
		currentColorPalette.controlHighlighted
	}

	// MARK: SegmentedControls

	@objc(textSegmentedControlColor)
	static var textSegmentedControl: UIColor {
		currentColorPalette.textSegmentedControl
	}

	@objc(textSegmentedControlSelectedColor)
	static var textSegmentedControlSelected: UIColor {
		currentColorPalette.textSegmentedControlSelected
	}

	static var segmentedControlBackgroundSelected: UIColor {
		currentColorPalette.segmentedControlBackgroundSelected
	}

	// MARK: Feedback

	@objc(feedbackInfoBackgroundColor)
	static var feedbackInfoBackground: UIColor {
		currentColorPalette.feedbackInfoBackground
	}

	@objc(feedbackErrorBackgroundColor)
	static var feedbackErrorBackground: UIColor {
		currentColorPalette.feedbackErrorBackground
	}

	static var textLinkSnackbar: UIColor {
		currentColorPalette.textLinkSnackbar
	}

	@objc(textSegmentedControlInverseColor)
	static var textSegmentedControlInverse: UIColor {
		currentColorPalette.textSegmentedControlInverse
	}

	@objc(textSegmentedControlInverseSelectedColor)
	static var textSegmentedControlInverseSelected: UIColor {
		currentColorPalette.textSegmentedControlInverseSelected
	}

	@objc(segmentedControlBackgroundInverseSelectedColor)
	static var segmentedControlBackgroundInverseSelected: UIColor {
		currentColorPalette.segmentedControlBackgroundInverseSelected
	}

	// MARK: Bubbles

	@objc(bubbleTimeBackgroundColor)
	static var bubbleTimeBackground: UIColor {
		currentColorPalette.bubbleTimeBackground
	}

	@objc(bubbleMeBackgroundColor)
	static var bubbleMeBackground: UIColor {
		currentColorPalette.bubbleMeBackground
	}

	@objc(bubbleMeBackgroundSelectedColor)
	static var bubbleMeBackgroundSelected: UIColor {
		currentColorPalette.bubbleMeBackgroundSelected
	}

	@objc(bubbleOtherBackgroundColor)
	static var bubbleOtherBackground: UIColor {
		currentColorPalette.bubbleOtherBackground
	}

	@objc(bubbleOtherBackgroundSelectedColor)
	static var bubbleOtherBackgroundSelected: UIColor {
		currentColorPalette.bubbleOtherBackgroundSelected
	}

	@objc(buttonBotColor)
	static var buttonBot: UIColor {
		currentColorPalette.buttonBot
	}

	@objc(buttonBotSelectedColor)
	static var buttonBotSelected: UIColor {
		currentColorPalette.buttonBotSelected
	}

	@objc(buttonBotBorderColor)
	static var buttonBotBorder: UIColor {
		currentColorPalette.buttonBotBorder
	}

	@objc(accentBackgroundColor)
	static var accentBackground: UIColor {
		currentColorPalette.accentBackground
	}

	// MARK: List

	@objc(contactListAlphabetColor)
	static var contactListAlphabet: UIColor {
		currentColorPalette.contactListAlphabet
	}

	// MARK: Assistant

	@objc(assistantButtonBackgroundColor)
	static var assistantButtonBackground: UIColor {
		currentColorPalette.assistantButtonBackground
	}

	@objc(assistantButtonBackgroundHighlightedColor)
	static var assistantButtonBackgroundHighlighted: UIColor {
		currentColorPalette.assistantButtonBackgroundHighlighted
	}

	@objc(assistantButtonBackgroundSelectedColor)
	static var assistantButtonBackgroundSelected: UIColor {
		currentColorPalette.assistantButtonBackgroundSelected
	}

	@objc(assistantButtonBackgroundDisabledColor)
	static var assistantButtonBackgroundDisabled: UIColor {
		currentColorPalette.assistantButtonBackgroundDisabled
	}

	@objc(assistantButtonBorderBackgroundColor)
	static var assistantButtonBorderBackground: UIColor {
		currentColorPalette.assistantButtonBorderBackground
	}

	@objc(assistantButtonBorderBackgroundSelectedColor)
	static var assistantButtonBorderBackgroundSelected: UIColor {
		currentColorPalette.assistantButtonBorderBackgroundSelected
	}

	@objc(assistantButtonBorderBackgroundDisabledColor)
	static var assistantButtonBorderBackgroundDisabled: UIColor {
		currentColorPalette.assistantButtonBorderBackgroundDisabled
	}

	@objc(assistantButtonNotificationsBackgroundColor)
	static var assistantButtonNotificationsBackground: UIColor {
		currentColorPalette.assistantButtonNotificationsBackground
	}

	@objc(assistantDividerColor)
	static var assistantDivider: UIColor {
		currentColorPalette.assistantDivider
	}

	@objc(assistantArrowColor)
	static var assistantArrow: UIColor {
		currentColorPalette.assistantArrow
	}

	@objc(assistantPlaceholderTextColor)
	static var assistantPlaceholderText: UIColor {
		currentColorPalette.assistantPlaceholderText
	}

	@objc(assistantCardShadowColor)
	static var assistantCardShadow: UIColor {
		currentColorPalette.assistantCardShadow
	}

	@objc(assistantBadgeColor)
	static var assistantBadge: UIColor {
		currentColorPalette.assistantBadge
	}

	// MARK: Charts

	@objc(chartPrimaryInactiveColor)
	static var chartPrimaryInactive: UIColor {
		currentColorPalette.chartPrimaryInactive
	}

	@objc(chartPrimaryActiveColor)
	static var chartPrimaryActive: UIColor {
		currentColorPalette.chartPrimaryActive
	}

	@objc(chartSecondaryInactiveColor)
	static var chartSecondaryInactive: UIColor {
		currentColorPalette.chartSecondaryInactive
	}

	@objc(chartSecondaryActiveColor)
	static var chartSecondaryActive: UIColor {
		currentColorPalette.chartSecondaryActive
	}

	@objc(ratingInactiveColor)
	static var ratingInactive: UIColor {
		currentColorPalette.ratingInactive
	}

	@objc(ratingActiveColor)
	static var ratingActive: UIColor {
		currentColorPalette.ratingActive
	}

	// MARK: Skeletons

	@objc(skeletonBackgroundColor)
	static var skeletonBackground: UIColor {
		currentColorPalette.skeletonBackground
	}

	@objc(skeletonWaveColor)
	static var skeletonWave: UIColor {
		currentColorPalette.skeletonWave
	}

	// MARK: Progress bars

	@objc(progressBarColor)
	static var progressBar: UIColor {
		currentColorPalette.progressBar
	}

	// MARK: Status

	@objc(tagBackgroundFirstColor)
	static var tagBackgroundFirst: UIColor {
		currentColorPalette.tagBackgroundFirst
	}

	@objc(tagBackgroundSecondColor)
	static var tagBackgroundSecond: UIColor {
		currentColorPalette.tagBackgroundSecond
	}

	@objc(tagBackgroundThirdColor)
	static var tagBackgroundThird: UIColor {
		currentColorPalette.tagBackgroundThird
	}

	@objc(tagBackgroundFourthColor)
	static var tagBackgroundFourth: UIColor {
		currentColorPalette.tagBackgroundFourth
	}

	// MARK: Account Widget

	@objc(amountBillingInfoWarningColor)
	static var amountBillingInfoWarning: UIColor {
		currentColorPalette.amountBillingInfoWarning
	}

	@objc(chartWarningColor)
	static var chartWarning: UIColor {
		currentColorPalette.chartWarning
	}

	@objc(chartWarningLightColor)
	static var chartWarningLight: UIColor {
		currentColorPalette.chartWarningLight
	}

	@objc(chartBackgroundColor)
	static var chartBackground: UIColor {
		currentColorPalette.chartBackground
	}

	@objc(chartUnlimitedColor)
	static var chartUnlimited: UIColor {
		currentColorPalette.chartUnlimited
	}

	@objc(chartDangerColor)
	static var chartDanger: UIColor {
		currentColorPalette.chartDanger
	}

	@objc(chartPrimaryColor)
	static var chartPrimary: UIColor {
		currentColorPalette.chartPrimary
	}

	@objc(chartPrimaryDarkColor)
	static var chartPrimaryDark: UIColor {
		currentColorPalette.chartPrimaryDark
	}

	@objc(chartPrimaryLightColor)
	static var chartPrimaryLight: UIColor {
		currentColorPalette.chartPrimaryLight
	}

	@objc(chartCriticalColor)
	static var chartCritical: UIColor {
		currentColorPalette.chartCritical
	}

	// MARK: IPComms (Deprecated)

	@objc(rowBackgroundHighlightedColor)
	static var rowBackgroundHighlighted: UIColor {
		currentColorPalette.rowBackgroundHighlighted
	}

	@objc(bubbleLocationIncomingBackgroundTintColor)
	static var bubbleLocationIncomingBackgroundTint: UIColor {
		currentColorPalette.bubbleLocationIncomingBackgroundTint
	}

	// MARK: Explore

	static var timeIndicatorWarning: UIColor {
		currentColorPalette.timeIndicatorWarning
	}

	// MARK: Support

	static var textPrimaryOverImage: UIColor {
		currentColorPalette.textPrimaryOverImage
	}

	static var textSecondaryOverImage: UIColor {
		currentColorPalette.textSecondaryOverImage
	}

	static var tableBackground: UIColor {
		currentColorPalette.tableBackground
	}

	// MARK: BadgeView

	static var badgeColor: UIColor {
		currentColorPalette.badgeColor
	}

	// MARK: Notification Inbox

	static var scrollContentIndicatorBackgroundFirst: UIColor {
		currentColorPalette.scrollContentIndicatorBackgroundFirst
	}

	static var scrollContentIndicatorBackgroundSecond: UIColor {
		currentColorPalette.scrollContentIndicatorBackgroundSecond
	}

	// MARK: IPComms (Deprecated)

	@objc(cellBackgroundHighlightedColor)
	static var cellBackgroundHighlighted: UIColor {
		currentColorPalette.cellBackgroundHighlighted
	}

	// MARK: Color Palette

	class func configure(for brandStyle: BrandStyle) {
		switch brandStyle {
		case .movistarES:
			currentColorPalette = MovistarColorPalette()
		case .vivo:
			currentColorPalette = VivoColorPalette()
		case .o2:
			currentColorPalette = O2ColorPalette()
		}
	}
}

public extension BrandStyle {
	/// This is a temporary flag while we are waiting to communicate some OBs these changes
	/// This will be removed in the future and use the new tinting style for every brand
	var shouldUseLegacyTintForControls: Bool {
		switch self {
		case .movistarES:
			return false
		case .vivo:
			return false
		case .o2:
			return true
		}
	}
}
