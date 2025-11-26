//
//  BlauColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct BlauColors: MisticaColors {
    static let palette = BlauColorPalette()

    let background = BlauColors.palette.white | BlauColors.palette.darkModeBlack

    let backgroundAlternative = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeBlack

    let backgroundBrand = MisticaColor.solid(BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack)

    let backgroundNegative = BlauColors.palette.blauBlueSecondary | BlauColors.palette.darkModeBlack

    let backgroundBrandSecondary = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack

    let backgroundContainer = BlauColors.palette.white | BlauColors.palette.darkModeGrey

    let backgroundContainerError = BlauColors.palette.blauRed10 | BlauColors.palette.darkModeGrey

    let backgroundContainerHover = BlauColors.palette.blauBlueSecondary.withAlphaComponent(0.05) | BlauColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerPressed = BlauColors.palette.blauBlueSecondary.withAlphaComponent(0.08) | BlauColors.palette.white.withAlphaComponent(0.08)

    let backgroundContainerBrand = MisticaColor.solid(BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeGrey)

    let backgroundContainerBrandHover = BlauColors.palette.darkModeBlack.withAlphaComponent(0.05) | BlauColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = BlauColors.palette.darkModeBlack.withAlphaComponent(0.08) | BlauColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeGrey

    let backgroundContainerNegative = BlauColors.palette.darkModeBlack.withAlphaComponent(0.4) | BlauColors.palette.darkModeGrey

    let backgroundContainerBrandOverBrand = BlauColors.palette.blauBluePrimary30 | BlauColors.palette.darkModeGrey

    let backgroundContainerAlternative = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey

    let backgroundOverlay = BlauColors.palette.blauBlueSecondary.withAlphaComponent(0.75) | BlauColors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = BlauColors.palette.grey3 | BlauColors.palette.darkModeGrey

    let backgroundSkeletonInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.darkModeGrey

    let backgroundSkeletonNegative = BlauColors.palette.blauBlueSecondary | BlauColors.palette.darkModeGrey

    let backgroundSkeletonBrand = BlauColors.palette.blauBlueSecondary | BlauColors.palette.darkModeGrey

    let backgroundBrandTop = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack

    let backgroundBrandBottom = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack

    let appBarBackground = BlauColors.palette.white | BlauColors.palette.darkModeGrey

    let navigationBarBackground = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack

    let skeletonWave = BlauColors.palette.grey2 | BlauColors.palette.grey5

    let borderLow = BlauColors.palette.grey1 | BlauColors.palette.darkModeBlack

    let border = BlauColors.palette.grey3 | BlauColors.palette.darkModeGrey

    let borderHigh = BlauColors.palette.grey5

    let borderSelected = BlauColors.palette.blauBlueSecondary60

    let completedStep = BlauColors.palette.blauBlueSecondary

    let completedStepInverse = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.blauBlueSecondary

    let completedStepNegative = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.blauBlueSecondary

    let completedStepBrand = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.blauBlueSecondary

    let coverBackgroundHover = BlauColors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = BlauColors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = BlauColors.palette.blauRed

    let buttonDangerBackgroundPressed = BlauColors.palette.blauRed70

    let buttonDangerBackgroundHover = BlauColors.palette.blauRed70

    let buttonLinkDangerBackgroundInverse = BlauColors.palette.white | BlauColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundNegative = BlauColors.palette.white | BlauColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundBrand = BlauColors.palette.white | BlauColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundMedia = BlauColors.palette.white

    let buttonLinkDangerBackgroundPressed = BlauColors.palette.blauRed10 | BlauColors.palette.blauRed.withAlphaComponent(0.3)

    let buttonLinkDangerBackgroundInversePressed = BlauColors.palette.blauRed10 | BlauColors.palette.blauPurple.withAlphaComponent(0.3)

    let buttonLinkDangerBackgroundNegativePressed = BlauColors.palette.blauRed10 | BlauColors.palette.blauPurple.withAlphaComponent(0.3)

    let buttonLinkDangerBackgroundBrandPressed = BlauColors.palette.blauRed10 | BlauColors.palette.blauPurple.withAlphaComponent(0.3)

    let buttonLinkDangerBackgroundMediaPressed = BlauColors.palette.blauRed10

    let buttonLinkBackgroundPressed = BlauColors.palette.blauPurple10 | BlauColors.palette.blauPurple.withAlphaComponent(0.3)

    let buttonLinkBackgroundInversePressed = BlauColors.palette.white.withAlphaComponent(0.15) | BlauColors.palette.blauPurple.withAlphaComponent(0.3)

    let buttonLinkBackgroundNegativePressed = BlauColors.palette.white.withAlphaComponent(0.15) | BlauColors.palette.blauPurple.withAlphaComponent(0.3)

    let buttonLinkBackgroundBrandPressed = BlauColors.palette.white.withAlphaComponent(0.15) | BlauColors.palette.blauPurple.withAlphaComponent(0.3)

    let buttonLinkBackgroundMediaPressed = BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonPrimaryBackground = BlauColors.palette.blauBlueSecondary

    let buttonPrimaryBackgroundInverse = BlauColors.palette.white | BlauColors.palette.blauBlueSecondary

    let buttonPrimaryBackgroundNegative = BlauColors.palette.white | BlauColors.palette.blauBlueSecondary

    let buttonPrimaryBackgroundBrand = BlauColors.palette.blauBlueSecondary

    let buttonPrimaryBackgroundMedia = BlauColors.palette.white

    let buttonPrimaryBackgroundHover = BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundInverseHover = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundNegativeHover = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundBrandHover = BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundMediaHover = BlauColors.palette.blauBluePrimary20

    let buttonPrimaryBackgroundPressed = BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundInversePressed = BlauColors.palette.blauBluePrimary30 | BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundNegativePressed = BlauColors.palette.blauBluePrimary30 | BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundBrandPressed = BlauColors.palette.blauBlueSecondary60

    let buttonPrimaryBackgroundMediaPressed = BlauColors.palette.blauBluePrimary30

    let buttonSecondaryBackgroundBrand = BlauColors.palette.white | BlauColors.palette.white.withAlphaComponent(0)

    let buttonSecondaryBorder = BlauColors.palette.blauBlueSecondary | BlauColors.palette.white

    let buttonSecondaryBorderInverse = BlauColors.palette.white

    let buttonSecondaryBorderNegative = BlauColors.palette.white

    let buttonSecondaryBorderBrand = BlauColors.palette.white.withAlphaComponent(0) | BlauColors.palette.white

    let buttonSecondaryBorderMedia = BlauColors.palette.white

    let buttonSecondaryBorderPressed = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.white

    let buttonSecondaryBorderInversePressed = BlauColors.palette.white

    let buttonSecondaryBorderNegativePressed = BlauColors.palette.white

    let buttonSecondaryBorderBrandPressed = BlauColors.palette.white.withAlphaComponent(0) | BlauColors.palette.white

    let buttonSecondaryBorderMediaPressed = BlauColors.palette.white

    let buttonSecondaryBackgroundHover = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInverseHover = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundNegativeHover = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundBrandHover = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundMediaHover = BlauColors.palette.white.withAlphaComponent(0.2)

    let buttonSecondaryBackgroundPressed = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInversePressed = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundNegativePressed = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundBrandPressed = BlauColors.palette.blauBlueSecondary10 | BlauColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundMediaPressed = BlauColors.palette.white.withAlphaComponent(0.2)

    let textButtonPrimary = BlauColors.palette.white | BlauColors.palette.grey2

    let textButtonPrimaryInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2

    let textButtonPrimaryNegative = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2

    let textButtonPrimaryBrand = BlauColors.palette.white | BlauColors.palette.grey2

    let textButtonPrimaryMedia = BlauColors.palette.blauBlueSecondary

    let textButtonPrimaryInversePressed = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2

    let textButtonPrimaryNegativePressed = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2

    let textButtonPrimaryBrandPressed = BlauColors.palette.white | BlauColors.palette.grey2

    let textButtonPrimaryMediaPressed = BlauColors.palette.blauBlueSecondary60

    let textButtonSecondary = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2

    let textButtonSecondaryInverse = BlauColors.palette.white | BlauColors.palette.grey2

    let textButtonSecondaryNegative = BlauColors.palette.white | BlauColors.palette.grey2

    let textButtonSecondaryBrand = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2

    let textButtonSecondaryMedia = BlauColors.palette.white

    let textButtonSecondaryPressed = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2

    let textButtonSecondaryInversePressed = BlauColors.palette.white | BlauColors.palette.grey2

    let textButtonSecondaryNegativePressed = BlauColors.palette.white | BlauColors.palette.grey2

    let textButtonSecondaryBrandPressed = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2

    let textButtonSecondaryMediaPressed = BlauColors.palette.white

    let textLink = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30

    let textLinkInverse = BlauColors.palette.white | BlauColors.palette.blauPurple30

    let textLinkNegative = BlauColors.palette.white | BlauColors.palette.blauPurple30

    let textLinkBrand = BlauColors.palette.grey6 | BlauColors.palette.blauPurple30

    let textLinkMedia = BlauColors.palette.white

    let textLinkDanger = BlauColors.palette.blauRed | BlauColors.palette.blauRed40

    let textLinkDangerMedia = BlauColors.palette.blauRed

    let textLinkSnackbar = BlauColors.palette.blauPurple30

    let textActivated = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let textBrand = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let inputBorder = BlauColors.palette.grey4 | BlauColors.palette.darkModeGrey5

    let inputBorderInverse = BlauColors.palette.white | BlauColors.palette.darkModeGrey5

    let inputBorderNegative = BlauColors.palette.white | BlauColors.palette.darkModeGrey5

    let inputBorderBrand = BlauColors.palette.grey6 | BlauColors.palette.darkModeGrey5

    let control = BlauColors.palette.grey4

    let controlActivated = BlauColors.palette.blauBlueSecondary

    let controlInverse = BlauColors.palette.blauBluePrimary30 | BlauColors.palette.grey4

    let controlNegative = BlauColors.palette.blauBluePrimary30 | BlauColors.palette.grey4

    let controlBrand = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey4

    let controlActivatedInverse = BlauColors.palette.white | BlauColors.palette.blauBlueSecondary

    let controlActivatedNegative = BlauColors.palette.white | BlauColors.palette.blauBlueSecondary

    let controlActivatedBrand = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.blauBlueSecondary

    let controlError = BlauColors.palette.blauRed

    let chevronIndicator = BlauColors.palette.grey5 | BlauColors.palette.grey4

    let barTrack = BlauColors.palette.grey3 | BlauColors.palette.grey5

    let barTrackInverse = BlauColors.palette.grey6.withAlphaComponent(0.2) | BlauColors.palette.grey5

    let barTrackNegative = BlauColors.palette.grey6.withAlphaComponent(0.2) | BlauColors.palette.grey5

    let barTrackBrand = BlauColors.palette.grey6.withAlphaComponent(0.2) | BlauColors.palette.grey5

    let loadingBar = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let loadingBarBackground = BlauColors.palette.blauBlueSecondary20 | BlauColors.palette.grey5

    let toggleAndroidInactive = BlauColors.palette.grey2 | BlauColors.palette.grey3

    let toggleAndroidBackgroundActive = BlauColors.palette.blauBlueSecondary30 | BlauColors.palette.blauBluePrimary30

    let toggleAndroidActiveBrand = BlauColors.palette.blauBlueSecondary60

    let toggleAndroidInactiveBrand = BlauColors.palette.grey2 | BlauColors.palette.grey3

    let toggleAndroidBackgroundActiveBrand = BlauColors.palette.blauBlueSecondary30 | BlauColors.palette.blauBluePrimary30

    let toggleAndroidBackgroundInactiveBrand = BlauColors.palette.grey2 | BlauColors.palette.grey4

    let iosControlKnob = BlauColors.palette.white | BlauColors.palette.grey2

    let controlKnobInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2

    let controlKnobNegative = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2

    let controlKnobBrand = BlauColors.palette.blauBlueSecondary | BlauColors.palette.grey2

    let divider = BlauColors.palette.grey3 | BlauColors.palette.white.withAlphaComponent(0.09)

    let dividerInverse = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.05)

    let dividerNegative = BlauColors.palette.white.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.05)

    let dividerBrand = BlauColors.palette.grey6.withAlphaComponent(0.2) | BlauColors.palette.white.withAlphaComponent(0.05)

    let navigationBarDivider = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack

    let badge = BlauColors.palette.blauRed

    let feedbackErrorBackground = BlauColors.palette.blauRed

    let feedbackInfoBackground = BlauColors.palette.grey6 | BlauColors.palette.darkModeGrey

    let brand = BlauColors.palette.blauBluePrimary

    let brandHigh = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.white.withAlphaComponent(0.05)

    let inverse = BlauColors.palette.white | BlauColors.palette.grey2

    let negative = BlauColors.palette.white | BlauColors.palette.grey2

    let neutralHigh = BlauColors.palette.grey6 | BlauColors.palette.grey2

    let neutralMedium = BlauColors.palette.grey5 | BlauColors.palette.grey4

    let neutralMediumInverse = BlauColors.palette.grey5 | BlauColors.palette.grey4

    let neutralMediumNegative = BlauColors.palette.grey5 | BlauColors.palette.grey4

    let neutralMediumBrand = BlauColors.palette.grey5 | BlauColors.palette.grey4

    let neutralLow = BlauColors.palette.grey1 | BlauColors.palette.darkModeGrey6

    let neutralLowAlternative = BlauColors.palette.grey2 | BlauColors.palette.darkModeGrey6

    let textPrimary = BlauColors.palette.grey6 | BlauColors.palette.grey2

    let textPrimaryInverse = BlauColors.palette.white | BlauColors.palette.grey2

    let textPrimaryNegative = BlauColors.palette.white | BlauColors.palette.grey2

    let textPrimaryBrand = BlauColors.palette.grey6 | BlauColors.palette.grey2

    let textPrimaryMedia = BlauColors.palette.white

    let textSecondary = BlauColors.palette.grey5 | BlauColors.palette.grey4

    let textSecondaryInverse = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.grey4

    let textSecondaryNegative = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.grey4

    let textSecondaryBrand = BlauColors.palette.grey6 | BlauColors.palette.grey4

    let textSecondaryMedia = BlauColors.palette.white

    let error = BlauColors.palette.blauRed

    let textError = BlauColors.palette.blauRed | BlauColors.palette.blauRed40

    let textErrorInverse = BlauColors.palette.white | BlauColors.palette.blauRed40

    let textErrorNegative = BlauColors.palette.white | BlauColors.palette.blauRed40

    let textErrorBrand = BlauColors.palette.grey6 | BlauColors.palette.blauRed40

    let success = BlauColors.palette.blauGreen70 | BlauColors.palette.blauGreen

    let warning = BlauColors.palette.blauYellow65 | BlauColors.palette.blauYellow

    let promo = BlauColors.palette.blauPurple

    let highlight = BlauColors.palette.blauBluePrimary

    let successLow = BlauColors.palette.blauGreen10 | BlauColors.palette.darkModeGrey6

    let warningLow = BlauColors.palette.blauYellow10 | BlauColors.palette.darkModeGrey6

    let errorLow = BlauColors.palette.blauRed10 | BlauColors.palette.darkModeGrey6

    let promoLow = BlauColors.palette.blauPurple10 | BlauColors.palette.darkModeGrey6

    let brandLow = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let successHigh = BlauColors.palette.blauGreen70 | BlauColors.palette.blauGreen30

    let warningHigh = BlauColors.palette.blauYellow70 | BlauColors.palette.blauYellow40

    let errorHigh = BlauColors.palette.blauRed70 | BlauColors.palette.blauRed40

    let promoHigh = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30

    let successHighInverse = BlauColors.palette.blauGreen70

    let successHighNegative = BlauColors.palette.blauGreen70

    let successHighBrand = BlauColors.palette.blauGreen70

    let warningHighInverse = BlauColors.palette.blauYellow70

    let warningHighNegative = BlauColors.palette.blauYellow70

    let warningHighBrand = BlauColors.palette.blauYellow70

    let errorHighInverse = BlauColors.palette.blauRed70

    let errorHighNegative = BlauColors.palette.blauRed70

    let errorHighBrand = BlauColors.palette.blauRed70

    let promoHighInverse = BlauColors.palette.blauPurple

    let promoHighNegative = BlauColors.palette.blauPurple

    let promoHighBrand = BlauColors.palette.blauPurple

    let textNavigationBarPrimary = BlauColors.palette.grey6 | BlauColors.palette.grey2

    let textNavigationBarSecondary = BlauColors.palette.grey6 | BlauColors.palette.grey4

    let textNavigationSearchBarHint = BlauColors.palette.grey6 | BlauColors.palette.grey4

    let textNavigationSearchBarText = BlauColors.palette.grey6 | BlauColors.palette.grey2

    let textAppBar = BlauColors.palette.grey5

    let textAppBarSelected = BlauColors.palette.blauBlueSecondary60 | BlauColors.palette.grey2

    let customTabsBackground = BlauColors.palette.blauBluePrimary | BlauColors.palette.darkModeBlack

    let tagTextPromo = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30

    let tagTextActive = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextInactive = BlauColors.palette.grey5 | BlauColors.palette.grey3

    let tagTextInfo = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextSuccess = BlauColors.palette.blauGreen70 | BlauColors.palette.blauGreen30

    let tagTextWarning = BlauColors.palette.blauYellow70 | BlauColors.palette.blauYellow40

    let tagTextError = BlauColors.palette.blauRed70 | BlauColors.palette.blauRed40

    let tagBackgroundPromo = BlauColors.palette.blauPurple10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundActive = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInactive = BlauColors.palette.grey1 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInfo = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundSuccess = BlauColors.palette.blauGreen10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundWarning = BlauColors.palette.blauYellow10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundError = BlauColors.palette.blauRed10 | BlauColors.palette.darkModeGrey6

    let tagTextPromoInverse = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30

    let tagTextPromoNegative = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30

    let tagTextPromoBrand = BlauColors.palette.blauPurple | BlauColors.palette.blauPurple30

    let tagTextActiveInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextActiveNegative = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextActiveBrand = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextInactiveInverse = BlauColors.palette.grey5 | BlauColors.palette.grey3

    let tagTextInactiveNegative = BlauColors.palette.grey5 | BlauColors.palette.grey3

    let tagTextInactiveBrand = BlauColors.palette.grey5 | BlauColors.palette.grey3

    let tagTextInfoInverse = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextInfoNegative = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextInfoBrand = BlauColors.palette.blauBlueSecondary | BlauColors.palette.blauBluePrimary

    let tagTextSuccessInverse = BlauColors.palette.blauGreen70 | BlauColors.palette.blauGreen30

    let tagTextSuccessNegative = BlauColors.palette.blauGreen70 | BlauColors.palette.blauGreen30

    let tagTextSuccessBrand = BlauColors.palette.blauGreen70 | BlauColors.palette.blauGreen30

    let tagTextWarningInverse = BlauColors.palette.blauYellow70 | BlauColors.palette.blauYellow40

    let tagTextWarningNegative = BlauColors.palette.blauYellow70 | BlauColors.palette.blauYellow40

    let tagTextWarningBrand = BlauColors.palette.blauYellow70 | BlauColors.palette.blauYellow40

    let tagTextErrorInverse = BlauColors.palette.blauRed70 | BlauColors.palette.blauRed40

    let tagTextErrorNegative = BlauColors.palette.blauRed70 | BlauColors.palette.blauRed40

    let tagTextErrorBrand = BlauColors.palette.blauRed70 | BlauColors.palette.blauRed40

    let tagBackgroundPromoInverse = BlauColors.palette.blauPurple10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundPromoNegative = BlauColors.palette.blauPurple10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundPromoBrand = BlauColors.palette.blauPurple10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundActiveInverse = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundActiveNegative = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundActiveBrand = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInactiveInverse = BlauColors.palette.grey1 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInactiveNegative = BlauColors.palette.grey1 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInactiveBrand = BlauColors.palette.grey1 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInfoInverse = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInfoNegative = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundInfoBrand = BlauColors.palette.blauBluePrimary20 | BlauColors.palette.darkModeGrey6

    let tagBackgroundSuccessInverse = BlauColors.palette.blauGreen10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundSuccessNegative = BlauColors.palette.blauGreen10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundSuccessBrand = BlauColors.palette.blauGreen10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundWarningInverse = BlauColors.palette.blauYellow10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundWarningNegative = BlauColors.palette.blauYellow10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundWarningBrand = BlauColors.palette.blauYellow10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundErrorInverse = BlauColors.palette.blauRed10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundErrorNegative = BlauColors.palette.blauRed10 | BlauColors.palette.darkModeGrey6

    let tagBackgroundErrorBrand = BlauColors.palette.blauRed10 | BlauColors.palette.darkModeGrey6

    let cardContentOverlay = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            BlauColors.palette.grey6.withAlphaComponent(0),
            BlauColors.palette.grey6.withAlphaComponent(0.4),
            BlauColors.palette.grey6.withAlphaComponent(0.7)
        ],
        stops: [0, 0.3, 1],
        angle: 180
    ))

    let cardFooterOverlay = BlauColors.palette.grey6.withAlphaComponent(0.7)
}

public struct BlauColorPalette: Sendable {
    public init() {}
    public let blauBluePrimary = UIColor(hex: "#00B6F1")!
    public let blauBluePrimary10 = UIColor(hex: "#F7FDFF")!
    public let blauBluePrimary20 = UIColor(hex: "#E5F6FD")!
    public let blauBluePrimary30 = UIColor(hex: "#B3E9FB")!
    public let blauBlueSecondary = UIColor(hex: "#0072BC")!
    public let blauBlueSecondary10 = UIColor(hex: "#E5F1F9")!
    public let blauBlueSecondary20 = UIColor(hex: "#B2D4EC")!
    public let blauBlueSecondary30 = UIColor(hex: "#80B7DF")!
    public let blauBlueSecondary60 = UIColor(hex: "#005A99")!
    public let blauPurple = UIColor(hex: "#7814B3")!
    public let blauPurple10 = UIColor(hex: "#F1E7F7")!
    public let blauPurple30 = UIColor(hex: "#BB89D9")!
    public let blauYellow = UIColor(hex: "#FFA922")!
    public let blauYellow10 = UIColor(hex: "#FFF6E9")!
    public let blauYellow40 = UIColor(hex: "#FFC364")!
    public let blauYellow60 = UIColor(hex: "#F09500")!
    public let blauYellow65 = UIColor(hex: "#D28200")!
    public let blauYellow70 = UIColor(hex: "#996614")!
    public let blauGreen = UIColor(hex: "#30D300")!
    public let blauGreen10 = UIColor(hex: "#EAFBE5")!
    public let blauGreen30 = UIColor(hex: "#97E980")!
    public let blauGreen70 = UIColor(hex: "#1D7F00")!
    public let blauRed = UIColor(hex: "#D12937")!
    public let blauRed10 = UIColor(hex: "#FEECE8")!
    public let blauRed20 = UIColor(hex: "#FCC7B9")!
    public let blauRed30 = UIColor(hex: "#FA9E87")!
    public let blauRed40 = UIColor(hex: "#F97C5D")!
    public let blauRed70 = UIColor(hex: "#BC3310")!
    public let grey1 = UIColor(hex: "#F6F6F6")!
    public let grey2 = UIColor(hex: "#F2F2F2")!
    public let grey3 = UIColor(hex: "#DDDDDD")!
    public let grey4 = UIColor(hex: "#8A8C90")!
    public let grey5 = UIColor(hex: "#666666")!
    public let grey6 = UIColor(hex: "#000000")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey5 = UIColor(hex: "#6D7D88")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
}
