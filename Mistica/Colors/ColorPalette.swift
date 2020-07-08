//
//  ColorPalette.swift
//  Mistica
//
//  Created by Víctor Pimentel on 14/12/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

protocol ColorPalette {
	// MARK: Text

	var textPrimary: UIColor { get }
	var textDisabled: UIColor { get }
	var textPrimaryInverse: UIColor { get }
	var textSecondary: UIColor { get }
	var textSecondaryAlternative: UIColor { get }
	var textSecondaryInverse: UIColor { get }
	var textHint: UIColor { get }
	var textDanger: UIColor { get }

	var textAccent: UIColor { get }
	var textAccentSelected: UIColor { get }

	var textLink: UIColor { get }
	var textLinkSelected: UIColor { get }
	var textLinkDisabled: UIColor { get }

	var textButtonPrimary: UIColor { get }
	var textButtonPrimaryInverse: UIColor { get }
	var textButtonPrimaryInverseSelected: UIColor { get }
	var textButtonPrimaryInverseDisabled: UIColor { get }

	var textButtonSecondary: UIColor { get }
	var textButtonSecondarySelected: UIColor { get }
	var textButtonSecondaryDisabled: UIColor { get }
	var textButtonSecondaryInverse: UIColor { get }
	var textButtonSecondaryInverseSelected: UIColor { get }
	var textButtonSecondaryInverseDisabled: UIColor { get }
	var textButtonTertiary: UIColor { get }

	var textLinkInverse: UIColor { get }
	var textLinkInverseSelected: UIColor { get }
	var textLinkInverseDisabled: UIColor { get }

	var textInputLabel: UIColor { get }
	var textInputLabelError: UIColor { get }

	var gradientBackgroundFirst: UIColor { get }
	var gradientBackgroundSecond: UIColor { get }
	var gradientBackgroundThird: UIColor { get }
	var gradientBackgroundFourth: UIColor { get }

	var backgroundBrandFirst: UIColor { get }
	var backgroundBrandSecond: UIColor { get }
	var backgroundBrandThird: UIColor { get }
	var backgroundBrandFourth: UIColor { get }

	// MARK: Backgrounds

	var background: UIColor { get }
	var backgroundOpacity: UIColor { get }
	var divider: UIColor { get }
	var backgroundAlternative: UIColor { get }

	var backgroundPromo: UIColor { get }

	var rowBackground: UIColor { get }
	var placeholderBackground: UIColor { get }

	var border: UIColor { get }
	var borderSelected: UIColor { get }

	// MARK: Icons

	var iconPrimary: UIColor { get }
	var iconAccent: UIColor { get }
	var iconDisabled: UIColor { get }
	var iconSecondary: UIColor { get }
	var iconTertiary: UIColor { get }
	var iconInverse: UIColor { get }

	// MARK: Search bar

	var navigationsSearchBarBackground: UIColor { get }
	var navigationSearchBarText: UIColor { get }
	var navigationSearchBarHintText: UIColor { get }
	var iconNavigationBar: UIColor { get }

	// MARK: Navigation bar

	var navigationBarBackground: UIColor { get }
	var navigationBarDivider: UIColor { get }
	var navigationBarPrimary: UIColor { get }
	var navigationBarSecondary: UIColor { get }

	// MARK: Tab bar

	var appBarBackground: UIColor { get }
	var appBarText: UIColor { get }
	var appBarTextSelected: UIColor { get }

	// MARK: Buttons

	var buttonPrimaryBackground: UIColor { get }
	var buttonPrimaryBackgroundSelected: UIColor { get }
	var buttonPrimaryBackgroundDisabled: UIColor { get }
	var buttonSecondaryBackground: UIColor { get }
	var buttonSecondaryBackgroundSelected: UIColor { get }
	var buttonSecondaryBackgroundDisabled: UIColor { get }
	var buttonTertiaryBackground: UIColor { get }
	var buttonTertiaryBackgroundSelected: UIColor { get }
	var buttonTertiaryBackgroundDisabled: UIColor { get }

	var buttonDanger: UIColor { get }
	var buttonDangerSelected: UIColor { get }
	var buttonDangerDisabled: UIColor { get }

	var quickActionPrimaryBackground: UIColor { get }
	var quickActionBackgroundDestructive: UIColor { get }

	var buttonBorder: UIColor { get }
	var buttonBorderSelected: UIColor { get }
	var buttonBorderDisabled: UIColor { get }
	var buttonBorderHighlighted: UIColor { get }

	var buttonPrimaryBackgroundInverse: UIColor { get }
	var buttonPrimaryBackgroundSelectedInverse: UIColor { get }
	var buttonPrimaryBackgroundDisabledInverse: UIColor { get }

	var buttonSecondaryBorderInverse: UIColor { get }
	var buttonSecondaryBorderSelectedInverse: UIColor { get }
	var buttonSecondaryBorderDisabledInverse: UIColor { get }

	var buttonLinkBackgroundSelected: UIColor { get }
	var buttonLinkBackgroundSelectedInverse: UIColor { get }

	// MARK: Controls

	var control: UIColor { get }
	var controlActivated: UIColor { get }
	var controlHighlighted: UIColor { get }

	// MARK: SegmentedControls

	var textSegmentedControl: UIColor { get }
	var textSegmentedControlSelected: UIColor { get }
	var segmentedControlBackgroundSelected: UIColor { get }

	var textSegmentedControlInverse: UIColor { get }
	var textSegmentedControlInverseSelected: UIColor { get }
	var segmentedControlBackgroundInverseSelected: UIColor { get }

	// MARK: Feedback

	var feedbackInfoBackground: UIColor { get }
	var feedbackErrorBackground: UIColor { get }
	var textLinkSnackbar: UIColor { get }

	// MARK: Bubbles

	var bubbleTimeBackground: UIColor { get }
	var bubbleMeBackground: UIColor { get }
	var bubbleMeBackgroundSelected: UIColor { get }
	var bubbleOtherBackground: UIColor { get }
	var bubbleOtherBackgroundSelected: UIColor { get }
	var buttonBot: UIColor { get }
	var buttonBotSelected: UIColor { get }
	var buttonBotBorder: UIColor { get }
	var accentBackground: UIColor { get }

	// MARK: List

	var contactListAlphabet: UIColor { get }

	// MARK: Assistant

	var assistantButtonBackground: UIColor { get }
	var assistantButtonBackgroundHighlighted: UIColor { get }
	var assistantButtonBackgroundSelected: UIColor { get }
	var assistantButtonBackgroundDisabled: UIColor { get }

	var assistantButtonBorderBackground: UIColor { get }
	var assistantButtonBorderBackgroundSelected: UIColor { get }
	var assistantButtonBorderBackgroundDisabled: UIColor { get }

	var assistantButtonNotificationsBackground: UIColor { get }

	var assistantDivider: UIColor { get }
	var assistantArrow: UIColor { get }
	var assistantPlaceholderText: UIColor { get }
	var assistantCardShadow: UIColor { get }

	var assistantBadge: UIColor { get }

	// MARK: Charts

	var chartPrimaryInactive: UIColor { get }
	var chartPrimaryActive: UIColor { get }
	var chartSecondaryInactive: UIColor { get }
	var chartSecondaryActive: UIColor { get }
	var ratingInactive: UIColor { get }
	var ratingActive: UIColor { get }

	// MARK: Skeletons

	var skeletonBackground: UIColor { get }
	var skeletonWave: UIColor { get }

	// MARK: Progress bars

	var progressBar: UIColor { get }

	// MARK: Status

	var tagBackgroundFirst: UIColor { get }
	var tagBackgroundSecond: UIColor { get }
	var tagBackgroundThird: UIColor { get }
	var tagBackgroundFourth: UIColor { get }

	// MARK: Account Widget

	var amountBillingInfoWarning: UIColor { get }
	var chartWarning: UIColor { get }
	var chartWarningLight: UIColor { get }
	var chartBackground: UIColor { get }
	var chartUnlimited: UIColor { get }
	var chartDanger: UIColor { get }
	var chartPrimary: UIColor { get }
	var chartPrimaryDark: UIColor { get }
	var chartPrimaryLight: UIColor { get }
	var chartCritical: UIColor { get }

	// MARK: IPComms (Deprecated)

	var rowBackgroundHighlighted: UIColor { get }
	var bubbleLocationIncomingBackgroundTint: UIColor { get }

	// MARK: Explore

	var timeIndicatorWarning: UIColor { get }

	// MARK: Support

	var textPrimaryOverImage: UIColor { get }
	var textSecondaryOverImage: UIColor { get }
	var tableBackground: UIColor { get }

	// MARK: BadgeView

	var badgeColor: UIColor { get }

	// MARK: Scroll Content Indicator

	var scrollContentIndicatorBackgroundFirst: UIColor { get }
	var scrollContentIndicatorBackgroundSecond: UIColor { get }

	// MARK: Cells

	var cellBackgroundHighlighted: UIColor { get }
}
