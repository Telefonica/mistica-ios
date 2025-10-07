//
//  MovistarNewColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct MovistarNewColors: MisticaColors {
    static let palette = MovistarNewColorPalette()

    let background = MovistarNewColors.palette.white | MovistarNewColors.palette.darkModeBlack

    let backgroundAlternative = MovistarNewColors.palette.movistarWhite | MovistarNewColors.palette.darkModeBlack

    let backgroundBrand = MisticaColor.solid(MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeBlack)

    let backgroundBrandSecondary = MovistarNewColors.palette.movistarBlack | MovistarNewColors.palette.darkModeBlack

    let backgroundContainer = MovistarNewColors.palette.white | MovistarNewColors.palette.darkModeGrey

    let backgroundContainerError = MovistarNewColors.palette.salmon100 | MovistarNewColors.palette.darkModeGrey

    let backgroundContainerHover = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.02) | MovistarNewColors.palette.white.withAlphaComponent(0.08)

    let backgroundContainerPressed = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.02) | MovistarNewColors.palette.white.withAlphaComponent(0.08)

    let backgroundContainerBrand = MisticaColor.solid(MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeGrey)

    let backgroundContainerBrandHover = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.1) | MovistarNewColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.2) | MovistarNewColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = MovistarNewColors.palette.blue800 | MovistarNewColors.palette.darkModeGrey

    let backgroundContainerAlternative = MovistarNewColors.palette.grey100 | MovistarNewColors.palette.darkModeGrey

    let backgroundOverlay = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.6) | MovistarNewColors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = MovistarNewColors.palette.grey200 | MovistarNewColors.palette.grey600

    let backgroundSkeletonInverse = MovistarNewColors.palette.blue500 | MovistarNewColors.palette.grey600

    let backgroundBrandTop = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeBlack

    let backgroundBrandBottom = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeBlack

    let appBarBackground = MovistarNewColors.palette.white | MovistarNewColors.palette.darkModeGrey

    let navigationBarBackground = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeBlack

    let skeletonWave = MovistarNewColors.palette.grey200 | MovistarNewColors.palette.grey600

    let borderLow = MovistarNewColors.palette.grey100 | MovistarNewColors.palette.darkModeBlack

    let border = MovistarNewColors.palette.grey300 | MovistarNewColors.palette.darkModeGrey

    let borderHigh = MovistarNewColors.palette.grey600 | MovistarNewColors.palette.grey500

    let borderSelected = MovistarNewColors.palette.blue800 | MovistarNewColors.palette.darkModeMovistarBlue

    let completedStep = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.blue800

    let completedStepInverse = MovistarNewColors.palette.blue500

    let coverBackgroundHover = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.25) | MovistarNewColors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.35) | MovistarNewColors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = MovistarNewColors.palette.red

    let buttonDangerBackgroundPressed = MovistarNewColors.palette.redHigh

    let buttonDangerBackgroundHover = MovistarNewColors.palette.redHigh

    let buttonLinkDangerBackgroundInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundMedia = MovistarNewColors.palette.white

    let buttonLinkDangerBackgroundPressed = MovistarNewColors.palette.salmon100 | MovistarNewColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkDangerBackgroundInversePressed = MovistarNewColors.palette.salmon100 | MovistarNewColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkDangerBackgroundMediaPressed = MovistarNewColors.palette.salmon100

    let buttonLinkBackgroundPressed = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundInversePressed = MovistarNewColors.palette.white.withAlphaComponent(0.3) | MovistarNewColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundMediaPressed = MovistarNewColors.palette.white.withAlphaComponent(0.3) | MovistarNewColors.palette.white.withAlphaComponent(0.2)

    let buttonPrimaryBackground = MovistarNewColors.palette.movistarBlue

    let buttonPrimaryBackgroundInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.movistarBlue

    let buttonPrimaryBackgroundMedia = MovistarNewColors.palette.white

    let buttonPrimaryBackgroundHover = MovistarNewColors.palette.blueHigh

    let buttonPrimaryBackgroundInverseHover = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.blue800

    let buttonPrimaryBackgroundMediaHover = MovistarNewColors.palette.blue100

    let buttonPrimaryBackgroundPressed = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.blue800

    let buttonPrimaryBackgroundInversePressed = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.blue800

    let buttonPrimaryBackgroundMediaPressed = MovistarNewColors.palette.blue100

    let buttonSecondaryBorder = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.white

    let buttonSecondaryBorderInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let buttonSecondaryBorderMedia = MovistarNewColors.palette.white

    let buttonSecondaryBorderPressed = MovistarNewColors.palette.blue800 | MovistarNewColors.palette.white

    let buttonSecondaryBorderInversePressed = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let buttonSecondaryBorderMediaPressed = MovistarNewColors.palette.white

    let buttonSecondaryBackgroundHover = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInverseHover = MovistarNewColors.palette.white.withAlphaComponent(0.2) | MovistarNewColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundMediaHover = MovistarNewColors.palette.white.withAlphaComponent(0.2)

    let buttonSecondaryBackgroundPressed = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.white.withAlphaComponent(0.25)

    let buttonSecondaryBackgroundInversePressed = MovistarNewColors.palette.white.withAlphaComponent(0.3) | MovistarNewColors.palette.white.withAlphaComponent(0.25)

    let buttonSecondaryBackgroundMediaPressed = MovistarNewColors.palette.white.withAlphaComponent(0.3)

    let textButtonPrimary = MovistarNewColors.palette.white

    let textButtonPrimaryInverse = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.white

    let textButtonPrimaryMedia = MovistarNewColors.palette.movistarBlue

    let textButtonPrimaryInversePressed = MovistarNewColors.palette.blue800 | MovistarNewColors.palette.blueLight

    let textButtonPrimaryMediaPressed = MovistarNewColors.palette.blueHigh

    let textButtonSecondary = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.grey200

    let textButtonSecondaryInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let textButtonSecondaryMedia = MovistarNewColors.palette.white

    let textButtonSecondaryPressed = MovistarNewColors.palette.blue800 | MovistarNewColors.palette.grey200

    let textButtonSecondaryInversePressed = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let textButtonSecondaryMediaPressed = MovistarNewColors.palette.white

    let textLink = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeMovistarBlue

    let textLinkInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.darkModeMovistarBlue

    let textLinkMedia = MovistarNewColors.palette.white

    let textLinkDanger = MovistarNewColors.palette.red | MovistarNewColors.palette.red350

    let textLinkDangerMedia = MovistarNewColors.palette.red

    let textLinkSnackbar = MovistarNewColors.palette.blue300 | MovistarNewColors.palette.darkModeMovistarBlue

    let textActivated = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.blue300

    let textBrand = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.blue300

    let inputBorder = MovistarNewColors.palette.grey500 | MovistarNewColors.palette.grey400

    let inputBorderInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey400

    let control = MovistarNewColors.palette.grey500 | MovistarNewColors.palette.grey400

    let controlActivated = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeMovistarBlue

    let controlInverse = MovistarNewColors.palette.blueLight | MovistarNewColors.palette.grey400

    let controlActivatedInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.darkModeMovistarBlue

    let controlError = MovistarNewColors.palette.red

    let barTrack = MovistarNewColors.palette.grey300 | MovistarNewColors.palette.grey600

    let barTrackInverse = MovistarNewColors.palette.movistarBlack.withAlphaComponent(0.14) | MovistarNewColors.palette.grey600

    let loadingBar = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeMovistarBlue

    let loadingBarBackground = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.grey600

    let toggleAndroidInactive = MovistarNewColors.palette.grey200

    let toggleAndroidBackgroundActive = MovistarNewColors.palette.blue300

    let iosControlKnob = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let controlKnobInverse = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.grey200

    let divider = MovistarNewColors.palette.grey300 | MovistarNewColors.palette.movistarWhite.withAlphaComponent(0.1)

    let dividerInverse = MovistarNewColors.palette.white.withAlphaComponent(0.2) | MovistarNewColors.palette.movistarWhite.withAlphaComponent(0.1)

    let navigationBarDivider = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeBlack

    let badge = MovistarNewColors.palette.red

    let feedbackErrorBackground = MovistarNewColors.palette.red

    let feedbackInfoBackground = MovistarNewColors.palette.blueDark

    let brand = MovistarNewColors.palette.movistarBlue | MovistarNewColors.palette.darkModeMovistarBlue

    let brandHigh = MovistarNewColors.palette.blue800 | MovistarNewColors.palette.blueHigh

    let inverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let neutralHigh = MovistarNewColors.palette.movistarBlack | MovistarNewColors.palette.grey200

    let neutralMedium = MovistarNewColors.palette.grey600 | MovistarNewColors.palette.grey500

    let neutralMediumInverse = MovistarNewColors.palette.grey600 | MovistarNewColors.palette.grey500

    let neutralLow = MovistarNewColors.palette.grey100 | MovistarNewColors.palette.grey700

    let neutralLowAlternative = MovistarNewColors.palette.grey200 | MovistarNewColors.palette.grey700

    let textPrimary = MovistarNewColors.palette.movistarBlack | MovistarNewColors.palette.movistarWhite

    let textPrimaryInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.movistarWhite

    let textPrimaryMedia = MovistarNewColors.palette.white

    let textSecondary = MovistarNewColors.palette.grey600 | MovistarNewColors.palette.grey400

    let textSecondaryInverse = MovistarNewColors.palette.movistarWhite | MovistarNewColors.palette.grey400

    let textSecondaryMedia = MovistarNewColors.palette.movistarWhite | MovistarNewColors.palette.white

    let error = MovistarNewColors.palette.red | MovistarNewColors.palette.red350

    let textError = MovistarNewColors.palette.red | MovistarNewColors.palette.red350

    let textErrorInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.red350

    let success = MovistarNewColors.palette.emerald

    let warning = MovistarNewColors.palette.yellow600 | MovistarNewColors.palette.yellow

    let promo = MovistarNewColors.palette.redHigh

    let highlight = MovistarNewColors.palette.pink55 | MovistarNewColors.palette.pink45

    let successLow = MovistarNewColors.palette.green200 | MovistarNewColors.palette.grey700

    let warningLow = MovistarNewColors.palette.yellow200 | MovistarNewColors.palette.grey700

    let errorLow = MovistarNewColors.palette.salmon100 | MovistarNewColors.palette.grey700

    let promoLow = MovistarNewColors.palette.salmon100 | MovistarNewColors.palette.grey700

    let brandLow = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.blueDark

    let successHigh = MovistarNewColors.palette.green700 | MovistarNewColors.palette.emeraldHigh

    let warningHigh = MovistarNewColors.palette.yellowHigh | MovistarNewColors.palette.yellow400

    let errorHigh = MovistarNewColors.palette.redHigh

    let promoHigh = MovistarNewColors.palette.redHigh

    let successHighInverse = MovistarNewColors.palette.emeraldHigh | MovistarNewColors.palette.green700

    let warningHighInverse = MovistarNewColors.palette.yellowHigh

    let errorHighInverse = MovistarNewColors.palette.redHigh

    let promoHighInverse = MovistarNewColors.palette.redHigh

    let textNavigationBarPrimary = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let textNavigationBarSecondary = MovistarNewColors.palette.blue300 | MovistarNewColors.palette.grey400

    let textNavigationSearchBarHint = MovistarNewColors.palette.blue300 | MovistarNewColors.palette.grey400

    let textNavigationSearchBarText = MovistarNewColors.palette.white | MovistarNewColors.palette.grey200

    let textAppBar = MovistarNewColors.palette.grey600 | MovistarNewColors.palette.grey400

    let textAppBarSelected = MovistarNewColors.palette.blue800 | MovistarNewColors.palette.movistarBlue

    let customTabsBackground = MovistarNewColors.palette.white | MovistarNewColors.palette.darkModeBlack

    let tagTextPromo = MovistarNewColors.palette.white | MovistarNewColors.palette.movistarWhite

    let tagTextActive = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.blue300

    let tagTextInactive = MovistarNewColors.palette.grey600 | MovistarNewColors.palette.grey300

    let tagTextInfo = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.blue300

    let tagTextSuccess = MovistarNewColors.palette.emeraldHigh | MovistarNewColors.palette.green400

    let tagTextWarning = MovistarNewColors.palette.yellowHigh | MovistarNewColors.palette.yellow400

    let tagTextError = MovistarNewColors.palette.redHigh | MovistarNewColors.palette.red350

    let tagBackgroundPromo = MovistarNewColors.palette.redHigh

    let tagBackgroundActive = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.grey700

    let tagBackgroundInactive = MovistarNewColors.palette.grey200 | MovistarNewColors.palette.grey700

    let tagBackgroundInfo = MovistarNewColors.palette.blue100 | MovistarNewColors.palette.grey700

    let tagBackgroundSuccess = MovistarNewColors.palette.green200 | MovistarNewColors.palette.grey700

    let tagBackgroundWarning = MovistarNewColors.palette.yellowLight | MovistarNewColors.palette.grey700

    let tagBackgroundError = MovistarNewColors.palette.salmon200 | MovistarNewColors.palette.grey700

    let tagTextPromoInverse = MovistarNewColors.palette.redHigh | MovistarNewColors.palette.movistarWhite

    let tagTextActiveInverse = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.blue300

    let tagTextInactiveInverse = MovistarNewColors.palette.grey600 | MovistarNewColors.palette.grey300

    let tagTextInfoInverse = MovistarNewColors.palette.blueHigh | MovistarNewColors.palette.blue300

    let tagTextSuccessInverse = MovistarNewColors.palette.green700 | MovistarNewColors.palette.green400

    let tagTextWarningInverse = MovistarNewColors.palette.yellowHigh | MovistarNewColors.palette.yellow400

    let tagTextErrorInverse = MovistarNewColors.palette.redHigh | MovistarNewColors.palette.red350

    let tagBackgroundPromoInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.redHigh

    let tagBackgroundActiveInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey700

    let tagBackgroundInactiveInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey700

    let tagBackgroundInfoInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey700

    let tagBackgroundSuccessInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey700

    let tagBackgroundWarningInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey700

    let tagBackgroundErrorInverse = MovistarNewColors.palette.white | MovistarNewColors.palette.grey700

    let cardContentOverlay = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            MovistarNewColors.palette.black.withAlphaComponent(0),
            MovistarNewColors.palette.black.withAlphaComponent(0.4),
            MovistarNewColors.palette.black.withAlphaComponent(0.7)
        ],
        stops: [0, 0.3, 1],
        angle: 180
    ))

    let cardFooterOverlay = MovistarNewColors.palette.black.withAlphaComponent(0.7)
}

public struct MovistarNewColorPalette: Sendable {
    public init() {}
    public let movistarBlue = UIColor(hex: "#0066FF")!
    public let movistarWhite = UIColor(hex: "#FEFAF5")!
    public let movistarBlack = UIColor(hex: "#262423")!
    public let blue100 = UIColor(hex: "#E5F0FF")!
    public let blue300 = UIColor(hex: "#80B3FF")!
    public let blue500 = UIColor(hex: "#E8F4FA")!
    public let blue600 = UIColor(hex: "#4DBAF7")!
    public let blue800 = UIColor(hex: "#0149B3")!
    public let blueLight = UIColor(hex: "#D3EEFF")!
    public let blueHigh = UIColor(hex: "#005EEB")!
    public let blueDark = UIColor(hex: "#022D67")!
    public let red = UIColor(hex: "#C10000")!
    public let red350 = UIColor(hex: "#FF8A8A")!
    public let redHigh = UIColor(hex: "#AD0000")!
    public let salmon100 = UIColor(hex: "#FEEEE6")!
    public let salmon200 = UIColor(hex: "#FDE5D7")!
    public let salmonLight = UIColor(hex: "#FFC6A8")!
    public let salmonDark = UIColor(hex: "#62301A")!
    public let yellow = UIColor(hex: "#EDB800")!
    public let yellow200 = UIColor(hex: "#FFF3D1")!
    public let yellow400 = UIColor(hex: "#FFCB11")!
    public let yellow500 = UIColor(hex: "#C59A00")!
    public let yellow600 = UIColor(hex: "#BFA960")!
    public let yellowLight = UIColor(hex: "#FFE99C")!
    public let yellowHigh = UIColor(hex: "#5E4A09")!
    public let yellowDark = UIColor(hex: "#5E4A09")!
    public let emerald = UIColor(hex: "#048239")!
    public let emeraldHigh = UIColor(hex: "#036D30")!
    public let green200 = UIColor(hex: "#EBF9DF")!
    public let green400 = UIColor(hex: "#8DCC5B")!
    public let green700 = UIColor(hex: "#407F0F")!
    public let greenLight = UIColor(hex: "#CEF7BF")!
    public let greenHigh = UIColor(hex: "#CEF7BF")!
    public let greenDark = UIColor(hex: "#38552B")!
    public let pink45 = UIColor(hex: "#EB5F99")!
    public let pink55 = UIColor(hex: "#C42F6D")!
    public let grey100 = UIColor(hex: "#FAF7F5")!
    public let grey200 = UIColor(hex: "#F3EEEA")!
    public let grey300 = UIColor(hex: "#DFDBD6")!
    public let grey400 = UIColor(hex: "#9F9C99")!
    public let grey500 = UIColor(hex: "#807D7B")!
    public let grey600 = UIColor(hex: "#605E5C")!
    public let grey700 = UIColor(hex: "#403F3D")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let white100 = UIColor(hex: "#FFFAF5")!
    public let black = UIColor(hex: "#000000")!
    public let darkModeBlack = UIColor(hex: "#070706")!
    public let darkModeGrey = UIColor(hex: "#151414")!
    public let darkModeMovistarBlue = UIColor(hex: "#227AFF")!
}
