//
//  ColorToolkit+UIColor.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension UIColor {
    @objc(backgroundColor)
    static var background: UIColor {
        MisticaConfig.currentColors.background
    }

    @objc(backgroundAlternativeColor)
    static var backgroundAlternative: UIColor {
        MisticaConfig.currentColors.backgroundAlternative
    }

    @objc(backgroundBrandColor)
    static var backgroundBrand: UIColor {
        MisticaConfig.currentColors.backgroundBrand
    }

    @objc(backgroundBrandSecondaryColor)
    static var backgroundBrandSecondary: UIColor {
        MisticaConfig.currentColors.backgroundBrandSecondary
    }

    @objc(backgroundContainerColor)
    static var backgroundContainer: UIColor {
        MisticaConfig.currentColors.backgroundContainer
    }

    @objc(backgroundContainerErrorColor)
    static var backgroundContainerError: UIColor {
        MisticaConfig.currentColors.backgroundContainerError
    }

    @objc(backgroundContainerHoverColor)
    static var backgroundContainerHover: UIColor {
        MisticaConfig.currentColors.backgroundContainerHover
    }

    @objc(backgroundContainerPressedColor)
    static var backgroundContainerPressed: UIColor {
        MisticaConfig.currentColors.backgroundContainerPressed
    }

    @objc(backgroundContainerBrandColor)
    static var backgroundContainerBrand: UIColor {
        MisticaConfig.currentColors.backgroundContainerBrand
    }

    @objc(backgroundContainerBrandHoverColor)
    static var backgroundContainerBrandHover: UIColor {
        MisticaConfig.currentColors.backgroundContainerBrandHover
    }

    @objc(backgroundContainerBrandPressedColor)
    static var backgroundContainerBrandPressed: UIColor {
        MisticaConfig.currentColors.backgroundContainerBrandPressed
    }

    @objc(backgroundContainerBrandOverInverseColor)
    static var backgroundContainerBrandOverInverse: UIColor {
        MisticaConfig.currentColors.backgroundContainerBrandOverInverse
    }

    @objc(backgroundContainerAlternativeColor)
    static var backgroundContainerAlternative: UIColor {
        MisticaConfig.currentColors.backgroundContainerAlternative
    }

    @objc(backgroundOverlayColor)
    static var backgroundOverlay: UIColor {
        MisticaConfig.currentColors.backgroundOverlay
    }

    @objc(backgroundSkeletonColor)
    static var backgroundSkeleton: UIColor {
        MisticaConfig.currentColors.backgroundSkeleton
    }

    @objc(backgroundSkeletonInverseColor)
    static var backgroundSkeletonInverse: UIColor {
        MisticaConfig.currentColors.backgroundSkeletonInverse
    }

    @objc(backgroundBrandTopColor)
    static var backgroundBrandTop: UIColor {
        MisticaConfig.currentColors.backgroundBrandTop
    }

    @objc(backgroundBrandBottomColor)
    static var backgroundBrandBottom: UIColor {
        MisticaConfig.currentColors.backgroundBrandBottom
    }

    @objc(appBarBackgroundColor)
    static var appBarBackground: UIColor {
        MisticaConfig.currentColors.appBarBackground
    }

    @objc(navigationBarBackgroundColor)
    static var navigationBarBackground: UIColor {
        MisticaConfig.currentColors.navigationBarBackground
    }

    @objc(skeletonWaveColor)
    static var skeletonWave: UIColor {
        MisticaConfig.currentColors.skeletonWave
    }

    @objc(borderLowColor)
    static var borderLow: UIColor {
        MisticaConfig.currentColors.borderLow
    }

    @objc(borderColor)
    static var border: UIColor {
        MisticaConfig.currentColors.border
    }

    @objc(borderHighColor)
    static var borderHigh: UIColor {
        MisticaConfig.currentColors.borderHigh
    }

    @objc(borderSelectedColor)
    static var borderSelected: UIColor {
        MisticaConfig.currentColors.borderSelected
    }

    @objc(coverBackgroundHoverColor)
    static var coverBackgroundHover: UIColor {
        MisticaConfig.currentColors.coverBackgroundHover
    }

    @objc(coverBackgroundPressedColor)
    static var coverBackgroundPressed: UIColor {
        MisticaConfig.currentColors.coverBackgroundPressed
    }

    @objc(buttonDangerBackgroundColor)
    static var buttonDangerBackground: UIColor {
        MisticaConfig.currentColors.buttonDangerBackground
    }

    @objc(buttonDangerBackgroundSelectedColor)
    static var buttonDangerBackgroundSelected: UIColor {
        MisticaConfig.currentColors.buttonDangerBackgroundSelected
    }

    @objc(buttonDangerBackgroundHoverColor)
    static var buttonDangerBackgroundHover: UIColor {
        MisticaConfig.currentColors.buttonDangerBackgroundHover
    }

    @objc(buttonLinkDangerBackgroundSelectedColor)
    static var buttonLinkDangerBackgroundSelected: UIColor {
        MisticaConfig.currentColors.buttonLinkDangerBackgroundSelected
    }

    @objc(buttonLinkDangerBackgroundInverseColor)
    static var buttonLinkDangerBackgroundInverse: UIColor {
        MisticaConfig.currentColors.buttonLinkDangerBackgroundInverse
    }

    @objc(buttonLinkDangerBackgroundInverseSelectedColor)
    static var buttonLinkDangerBackgroundInverseSelected: UIColor {
        MisticaConfig.currentColors.buttonLinkDangerBackgroundInverseSelected
    }

    @objc(buttonLinkBackgroundSelectedColor)
    static var buttonLinkBackgroundSelected: UIColor {
        MisticaConfig.currentColors.buttonLinkBackgroundSelected
    }

    @objc(buttonLinkBackgroundInverseSelectedColor)
    static var buttonLinkBackgroundInverseSelected: UIColor {
        MisticaConfig.currentColors.buttonLinkBackgroundInverseSelected
    }

    @objc(buttonPrimaryBackgroundColor)
    static var buttonPrimaryBackground: UIColor {
        MisticaConfig.currentColors.buttonPrimaryBackground
    }

    @objc(buttonPrimaryBackgroundInverseColor)
    static var buttonPrimaryBackgroundInverse: UIColor {
        MisticaConfig.currentColors.buttonPrimaryBackgroundInverse
    }

    @objc(buttonPrimaryBackgroundSelectedColor)
    static var buttonPrimaryBackgroundSelected: UIColor {
        MisticaConfig.currentColors.buttonPrimaryBackgroundSelected
    }

    @objc(buttonPrimaryBackgroundHoverColor)
    static var buttonPrimaryBackgroundHover: UIColor {
        MisticaConfig.currentColors.buttonPrimaryBackgroundHover
    }

    @objc(buttonPrimaryBackgroundInverseSelectedColor)
    static var buttonPrimaryBackgroundInverseSelected: UIColor {
        MisticaConfig.currentColors.buttonPrimaryBackgroundInverseSelected
    }

    @objc(buttonSecondaryBorderColor)
    static var buttonSecondaryBorder: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBorder
    }

    @objc(buttonSecondaryBorderSelectedColor)
    static var buttonSecondaryBorderSelected: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBorderSelected
    }

    @objc(buttonSecondaryBackgroundHoverColor)
    static var buttonSecondaryBackgroundHover: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBackgroundHover
    }

    @objc(buttonSecondaryBackgroundSelectedColor)
    static var buttonSecondaryBackgroundSelected: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBackgroundSelected
    }

    @objc(buttonSecondaryBorderInverseColor)
    static var buttonSecondaryBorderInverse: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBorderInverse
    }

    @objc(buttonSecondaryBorderInverseSelectedColor)
    static var buttonSecondaryBorderInverseSelected: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBorderInverseSelected
    }

    @objc(buttonSecondaryBackgroundInverseHoverColor)
    static var buttonSecondaryBackgroundInverseHover: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBackgroundInverseHover
    }

    @objc(buttonSecondaryBackgroundInverseSelectedColor)
    static var buttonSecondaryBackgroundInverseSelected: UIColor {
        MisticaConfig.currentColors.buttonSecondaryBackgroundInverseSelected
    }

    @objc(textButtonPrimaryColor)
    static var textButtonPrimary: UIColor {
        MisticaConfig.currentColors.textButtonPrimary
    }

    @objc(textButtonPrimaryInverseColor)
    static var textButtonPrimaryInverse: UIColor {
        MisticaConfig.currentColors.textButtonPrimaryInverse
    }

    @objc(textButtonPrimaryInverseSelectedColor)
    static var textButtonPrimaryInverseSelected: UIColor {
        MisticaConfig.currentColors.textButtonPrimaryInverseSelected
    }

    @objc(textButtonSecondaryColor)
    static var textButtonSecondary: UIColor {
        MisticaConfig.currentColors.textButtonSecondary
    }

    @objc(textButtonSecondarySelectedColor)
    static var textButtonSecondarySelected: UIColor {
        MisticaConfig.currentColors.textButtonSecondarySelected
    }

    @objc(textButtonSecondaryInverseColor)
    static var textButtonSecondaryInverse: UIColor {
        MisticaConfig.currentColors.textButtonSecondaryInverse
    }

    @objc(textButtonSecondaryInverseSelectedColor)
    static var textButtonSecondaryInverseSelected: UIColor {
        MisticaConfig.currentColors.textButtonSecondaryInverseSelected
    }

    @objc(textLinkColor)
    static var textLink: UIColor {
        MisticaConfig.currentColors.textLink
    }

    @objc(textLinkInverseColor)
    static var textLinkInverse: UIColor {
        MisticaConfig.currentColors.textLinkInverse
    }

    @objc(textLinkDangerColor)
    static var textLinkDanger: UIColor {
        MisticaConfig.currentColors.textLinkDanger
    }

    @objc(textLinkSnackbarColor)
    static var textLinkSnackbar: UIColor {
        MisticaConfig.currentColors.textLinkSnackbar
    }

    @objc(textActivatedColor)
    static var textActivated: UIColor {
        MisticaConfig.currentColors.textActivated
    }

    @objc(textBrandColor)
    static var textBrand: UIColor {
        MisticaConfig.currentColors.textBrand
    }

    @objc(controlColor)
    static var control: UIColor {
        MisticaConfig.currentColors.control
    }

    @objc(controlActivatedColor)
    static var controlActivated: UIColor {
        MisticaConfig.currentColors.controlActivated
    }

    @objc(controlInverseColor)
    static var controlInverse: UIColor {
        MisticaConfig.currentColors.controlInverse
    }

    @objc(controlActivatedInverseColor)
    static var controlActivatedInverse: UIColor {
        MisticaConfig.currentColors.controlActivatedInverse
    }

    @objc(controlErrorColor)
    static var controlError: UIColor {
        MisticaConfig.currentColors.controlError
    }

    @objc(barTrackColor)
    static var barTrack: UIColor {
        MisticaConfig.currentColors.barTrack
    }

    @objc(loadingBarColor)
    static var loadingBar: UIColor {
        MisticaConfig.currentColors.loadingBar
    }

    @objc(loadingBarBackgroundColor)
    static var loadingBarBackground: UIColor {
        MisticaConfig.currentColors.loadingBarBackground
    }

    @objc(toggleAndroidInactiveColor)
    static var toggleAndroidInactive: UIColor {
        MisticaConfig.currentColors.toggleAndroidInactive
    }

    @objc(toggleAndroidBackgroundActiveColor)
    static var toggleAndroidBackgroundActive: UIColor {
        MisticaConfig.currentColors.toggleAndroidBackgroundActive
    }

    @objc(iosControlKnobColor)
    static var iosControlKnob: UIColor {
        MisticaConfig.currentColors.iosControlKnob
    }

    @objc(dividerColor)
    static var divider: UIColor {
        MisticaConfig.currentColors.divider
    }

    @objc(dividerInverseColor)
    static var dividerInverse: UIColor {
        MisticaConfig.currentColors.dividerInverse
    }

    @objc(navigationBarDividerColor)
    static var navigationBarDivider: UIColor {
        MisticaConfig.currentColors.navigationBarDivider
    }

    @objc(badgeColor)
    static var badge: UIColor {
        MisticaConfig.currentColors.badge
    }

    @objc(feedbackErrorBackgroundColor)
    static var feedbackErrorBackground: UIColor {
        MisticaConfig.currentColors.feedbackErrorBackground
    }

    @objc(feedbackInfoBackgroundColor)
    static var feedbackInfoBackground: UIColor {
        MisticaConfig.currentColors.feedbackInfoBackground
    }

    @objc(brandColor)
    static var brand: UIColor {
        MisticaConfig.currentColors.brand
    }

    @objc(brandHighColor)
    static var brandHigh: UIColor {
        MisticaConfig.currentColors.brandHigh
    }

    @objc(inverseColor)
    static var inverse: UIColor {
        MisticaConfig.currentColors.inverse
    }

    @objc(neutralHighColor)
    static var neutralHigh: UIColor {
        MisticaConfig.currentColors.neutralHigh
    }

    @objc(neutralMediumColor)
    static var neutralMedium: UIColor {
        MisticaConfig.currentColors.neutralMedium
    }

    @objc(neutralMediumInverseColor)
    static var neutralMediumInverse: UIColor {
        MisticaConfig.currentColors.neutralMediumInverse
    }

    @objc(neutralLowColor)
    static var neutralLow: UIColor {
        MisticaConfig.currentColors.neutralLow
    }

    @objc(neutralLowAlternativeColor)
    static var neutralLowAlternative: UIColor {
        MisticaConfig.currentColors.neutralLowAlternative
    }

    @objc(textPrimaryColor)
    static var textPrimary: UIColor {
        MisticaConfig.currentColors.textPrimary
    }

    @objc(textPrimaryInverseColor)
    static var textPrimaryInverse: UIColor {
        MisticaConfig.currentColors.textPrimaryInverse
    }

    @objc(textSecondaryColor)
    static var textSecondary: UIColor {
        MisticaConfig.currentColors.textSecondary
    }

    @objc(textSecondaryInverseColor)
    static var textSecondaryInverse: UIColor {
        MisticaConfig.currentColors.textSecondaryInverse
    }

    @objc(successColor)
    static var success: UIColor {
        MisticaConfig.currentColors.success
    }

    @objc(warningColor)
    static var warning: UIColor {
        MisticaConfig.currentColors.warning
    }

    @objc(errorColor)
    static var error: UIColor {
        MisticaConfig.currentColors.error
    }

    @objc(textErrorColor)
    static var textError: UIColor {
        MisticaConfig.currentColors.textError
    }

    @objc(textErrorInverseColor)
    static var textErrorInverse: UIColor {
        MisticaConfig.currentColors.textErrorInverse
    }

    @objc(promoColor)
    static var promo: UIColor {
        MisticaConfig.currentColors.promo
    }

    @objc(highlightColor)
    static var highlight: UIColor {
        MisticaConfig.currentColors.highlight
    }

    @objc(successLowColor)
    static var successLow: UIColor {
        MisticaConfig.currentColors.successLow
    }

    @objc(warningLowColor)
    static var warningLow: UIColor {
        MisticaConfig.currentColors.warningLow
    }

    @objc(errorLowColor)
    static var errorLow: UIColor {
        MisticaConfig.currentColors.errorLow
    }

    @objc(promoLowColor)
    static var promoLow: UIColor {
        MisticaConfig.currentColors.promoLow
    }

    @objc(brandLowColor)
    static var brandLow: UIColor {
        MisticaConfig.currentColors.brandLow
    }

    @objc(successHighColor)
    static var successHigh: UIColor {
        MisticaConfig.currentColors.successHigh
    }

    @objc(warningHighColor)
    static var warningHigh: UIColor {
        MisticaConfig.currentColors.warningHigh
    }

    @objc(errorHighColor)
    static var errorHigh: UIColor {
        MisticaConfig.currentColors.errorHigh
    }

    @objc(promoHighColor)
    static var promoHigh: UIColor {
        MisticaConfig.currentColors.promoHigh
    }

    @objc(successHighInverseColor)
    static var successHighInverse: UIColor {
        MisticaConfig.currentColors.successHighInverse
    }

    @objc(warningHighInverseColor)
    static var warningHighInverse: UIColor {
        MisticaConfig.currentColors.warningHighInverse
    }

    @objc(errorHighInverseColor)
    static var errorHighInverse: UIColor {
        MisticaConfig.currentColors.errorHighInverse
    }

    @objc(promoHighInverseColor)
    static var promoHighInverse: UIColor {
        MisticaConfig.currentColors.promoHighInverse
    }

    @objc(textNavigationBarPrimaryColor)
    static var textNavigationBarPrimary: UIColor {
        MisticaConfig.currentColors.textNavigationBarPrimary
    }

    @objc(textNavigationBarSecondaryColor)
    static var textNavigationBarSecondary: UIColor {
        MisticaConfig.currentColors.textNavigationBarSecondary
    }

    @objc(textNavigationSearchBarHintColor)
    static var textNavigationSearchBarHint: UIColor {
        MisticaConfig.currentColors.textNavigationSearchBarHint
    }

    @objc(textNavigationSearchBarTextColor)
    static var textNavigationSearchBarText: UIColor {
        MisticaConfig.currentColors.textNavigationSearchBarText
    }

    @objc(textAppBarColor)
    static var textAppBar: UIColor {
        MisticaConfig.currentColors.textAppBar
    }

    @objc(textAppBarSelectedColor)
    static var textAppBarSelected: UIColor {
        MisticaConfig.currentColors.textAppBarSelected
    }

    @objc(customTabsBackgroundColor)
    static var customTabsBackground: UIColor {
        MisticaConfig.currentColors.customTabsBackground
    }

    @objc(tagTextPromoColor)
    static var tagTextPromo: UIColor {
        MisticaConfig.currentColors.tagTextPromo
    }

    @objc(tagTextActiveColor)
    static var tagTextActive: UIColor {
        MisticaConfig.currentColors.tagTextActive
    }

    @objc(tagTextInactiveColor)
    static var tagTextInactive: UIColor {
        MisticaConfig.currentColors.tagTextInactive
    }

    @objc(tagTextSuccessColor)
    static var tagTextSuccess: UIColor {
        MisticaConfig.currentColors.tagTextSuccess
    }

    @objc(tagTextWarningColor)
    static var tagTextWarning: UIColor {
        MisticaConfig.currentColors.tagTextWarning
    }

    @objc(tagTextErrorColor)
    static var tagTextError: UIColor {
        MisticaConfig.currentColors.tagTextError
    }

    @objc(tagBackgroundPromoColor)
    static var tagBackgroundPromo: UIColor {
        MisticaConfig.currentColors.tagBackgroundPromo
    }

    @objc(tagBackgroundActiveColor)
    static var tagBackgroundActive: UIColor {
        MisticaConfig.currentColors.tagBackgroundActive
    }

    @objc(tagBackgroundInactiveColor)
    static var tagBackgroundInactive: UIColor {
        MisticaConfig.currentColors.tagBackgroundInactive
    }

    @objc(tagBackgroundSuccessColor)
    static var tagBackgroundSuccess: UIColor {
        MisticaConfig.currentColors.tagBackgroundSuccess
    }

    @objc(tagBackgroundWarningColor)
    static var tagBackgroundWarning: UIColor {
        MisticaConfig.currentColors.tagBackgroundWarning
    }

    @objc(tagBackgroundErrorColor)
    static var tagBackgroundError: UIColor {
        MisticaConfig.currentColors.tagBackgroundError
    }
}

public extension BrandStyle {
    var preferredStatusBarStyle: UIStatusBarStyle {
        switch self {
        case .movistar, .vivo, .o2, .o2New, .blau, .custom, .vivoNew, .telefonica:
            return .lightContent
        }
    }
}
