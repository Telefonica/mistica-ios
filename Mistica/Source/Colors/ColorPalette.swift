//
//  ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

protocol ColorPalette {
    // BACKGROUNDS
    var appBarBackground: UIColor { get }
    var background: UIColor { get }
    var backgroundAlternative: UIColor { get }
    var backgroundBrand: UIColor { get }
    var backgroundFeedbackBottom: UIColor { get }
    var backgroundOverlay: UIColor { get }
    var backgroundSkeleton: UIColor { get }
    var backgroundSkeletonInverse: UIColor { get }
    var navigationBarBackground: UIColor { get }
    var navigationSearchBarBackground: UIColor { get }
    
    // BORDERS
    var border: UIColor { get }
    var borderDark: UIColor { get }
    var borderLight: UIColor { get }
    var borderSelected: UIColor { get }
    
    // BORDERS
    var buttonDangerBackground: UIColor { get }
    var buttonDangerBackgroundDisabled: UIColor { get }
    var buttonDangerBackgroundSelected: UIColor { get }
    var buttonLinkBackgroundSelected: UIColor { get }
    var buttonPrimaryBackground: UIColor { get }
    var buttonPrimaryBackgroundDisabled: UIColor { get }
    var buttonPrimaryBackgroundDisabledInverse: UIColor { get }
    var buttonPrimaryBackgroundInverse: UIColor { get }
    var buttonPrimaryBackgroundSelected: UIColor { get }
    var buttonPrimaryBackgroundSelectedInverse: UIColor { get }
    var buttonSecondaryBackground: UIColor { get }
    var buttonSecondaryBackgroundDisabled: UIColor { get }
    var buttonSecondaryBackgroundSelected: UIColor { get }
    var buttonSecondaryBorderDisabledInverse: UIColor { get }
    var buttonSecondaryBorderInverse: UIColor { get }
    var buttonSecondaryBorderSelectedInverse: UIColor { get }
    
    var textButtonPrimary: UIColor { get }
    var textButtonPrimaryInverse: UIColor { get }
    var textButtonPrimaryInverseDisabled: UIColor { get }
    var textButtonPrimaryInverseSelected: UIColor { get }
    var textButtonSecondary: UIColor { get }
    var textButtonSecondaryDisabled: UIColor { get }
    var textButtonSecondarySelected: UIColor { get }
    var textButtonSecondaryInverse: UIColor { get }
    var textButtonSecondaryInverseDisabled: UIColor { get }
    var textButtonSecondaryInverseSelected: UIColor { get }
    var textLink: UIColor { get }
    var textLinkDanger: UIColor { get }
    var textLinkDangerDisabled: UIColor { get }
    var textLinkDisabled: UIColor { get }
    var textLinkSnackbar: UIColor { get }
    
    // CONTROLS
    var control: UIColor { get }
    var controlActivated: UIColor { get }
    var controlError: UIColor { get }
    var loadingBar: UIColor { get }
    var loadingBarBackground: UIColor { get }
    var loadingBarBackgroundInverse: UIColor { get }
    var loadingBarInverse: UIColor { get }
        
    // DIVIDERS
    var divider: UIColor { get }
    var navigationBarDivider: UIColor { get }

    // FEEDBACKS
    var badge: UIColor { get }
    var feedbackErrorBackground: UIColor { get }
    var feedbackInfoBackground: UIColor { get }
    
    // GLOBAL
    var brand: UIColor { get }
    var inverse: UIColor { get }
    var neutralHigh: UIColor { get }
    var neutralLow: UIColor { get }
    var neutralMedium: UIColor { get }
    var promo: UIColor { get }
    var highlight: UIColor { get }
    
    var textPrimary: UIColor { get }
    var textPrimaryInverse: UIColor { get }
    var textSecondary: UIColor { get }
    var textSecondaryInverse: UIColor { get }
    var textDisabled: UIColor { get }
    var textAmount: UIColor { get }
    
    // STATES
    var error: UIColor { get }
    var success: UIColor { get }
    var warning: UIColor { get }

    // BARS TEXTS
    var textNavigationBarPrimary: UIColor { get }
    var textNavigationBarSecondary: UIColor { get }
    var textNavigationSearchBarHint: UIColor { get }
    var textNavigationSearchBarText: UIColor { get }
    var textAppBar: UIColor { get }
    var textAppBarSelected: UIColor { get }
    
    // GRADIENTS
    var backgroundBrandGradient: [UIColor] { get }
}
    
protocol AppColorPalette {
        
    // MARK: Text

    var textSecondaryAlternative: UIColor { get }
    var textHint: UIColor { get }
    var textAccent: UIColor { get }
    var textInputLabel: UIColor { get }
    var textInputLabelError: UIColor { get }
    var gradientBackgroundFirst: UIColor { get }
    var gradientBackgroundSecond: UIColor { get }
    var gradientBackgroundThird: UIColor { get }
    var gradientBackgroundFourth: UIColor { get }

    // MARK: Search bar

    var navigationsSearchBarBackground: UIColor { get }
    var navigationSearchBarHintText: UIColor { get }
    var iconNavigationBar: UIColor { get }

    // MARK: Buttons

    var buttonTertiaryBackground: UIColor { get }
    var buttonTertiaryBackgroundSelected: UIColor { get }
    var buttonTertiaryBackgroundDisabled: UIColor { get }
    var quickActionPrimaryBackground: UIColor { get }
    var quickActionBackgroundDestructive: UIColor { get }

    // MARK: Controls

    var controlHighlighted: UIColor { get }

    // MARK: Bubbles

    var bubbleTimeBackground: UIColor { get }
    var bubbleMeBackground: UIColor { get }
    var bubbleMeBackgroundSelected: UIColor { get }
    var bubbleOtherBackground: UIColor { get }
    var bubbleOtherBackgroundSelected: UIColor { get }
    var accentBackground: UIColor { get }

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

    // MARK: Explore

    var timeIndicatorWarning: UIColor { get }

    // MARK: Support

    var textPrimaryOverImage: UIColor { get }
    var textSecondaryOverImage: UIColor { get }
    var tableBackground: UIColor { get }

    // MARK: Scroll Content Indicator

    var scrollContentIndicatorBackgroundFirst: UIColor { get }
    var scrollContentIndicatorBackgroundSecond: UIColor { get }

    // MARK: Cells

    var cellBackgroundHighlighted: UIColor { get }
}
