//
//  MovistarColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct MovistarColors: MisticaColors {
    static let palette = MovistarColorPalette()

    let background = MovistarColors.palette.white | MovistarColors.palette.darkModeBlack

    let backgroundAlternative = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeBlack

    let backgroundBrand = MisticaColor.solid(MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack)

    let backgroundBrandSecondary = MovistarColors.palette.movistarBlueDark | MovistarColors.palette.darkModeBlack

    let backgroundContainer = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey

    let backgroundContainerError = MovistarColors.palette.pepper10 | MovistarColors.palette.darkModeGrey

    let backgroundContainerHover = MovistarColors.palette.black.withAlphaComponent(0.03) | MovistarColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerPressed = MovistarColors.palette.black.withAlphaComponent(0.05) | MovistarColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrand = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeGrey

    let backgroundContainerBrandHover = MovistarColors.palette.black.withAlphaComponent(0.1) | MovistarColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = MovistarColors.palette.black.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey

    let backgroundContainerAlternative = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeGrey

    let backgroundOverlay = MovistarColors.palette.movistarBlueDark.withAlphaComponent(0.6) | MovistarColors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = MovistarColors.palette.grey2 | MovistarColors.palette.darkModeGrey6

    let backgroundSkeletonInverse = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey6

    let backgroundBrandTop = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack

    let backgroundBrandBottom = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack

    let appBarBackground = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey

    let navigationBarBackground = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack

    let skeletonWave = MovistarColors.palette.grey2 | MovistarColors.palette.darkModeGrey6

    let borderLow = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeBlack

    let border = MovistarColors.palette.grey3 | MovistarColors.palette.darkModeGrey

    let borderHigh = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey5

    let borderSelected = MovistarColors.palette.movistarBlue

    let coverBackgroundHover = MovistarColors.palette.black.withAlphaComponent(0.25) | MovistarColors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = MovistarColors.palette.black.withAlphaComponent(0.35) | MovistarColors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = MovistarColors.palette.pepper55

    let buttonDangerBackgroundSelected = MovistarColors.palette.pepper70

    let buttonDangerBackgroundHover = MovistarColors.palette.pepper65

    let buttonLinkDangerBackgroundSelected = MovistarColors.palette.pepper10 | MovistarColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkDangerBackgroundInverse = MovistarColors.palette.white | MovistarColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundInverseSelected = MovistarColors.palette.pepper10 | MovistarColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundSelected = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundInverseSelected = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.08)

    let buttonPrimaryBackground = MovistarColors.palette.movistarBlueHC

    let buttonPrimaryBackgroundInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlueHC

    let buttonPrimaryBackgroundSelected = MovistarColors.palette.movistarBlueHC65

    let buttonPrimaryBackgroundHover = MovistarColors.palette.movistarBlueHC55

    let buttonPrimaryBackgroundInverseSelected = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.movistarBlueHC65

    let buttonSecondaryBorder = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.white

    let buttonSecondaryBorderSelected = MovistarColors.palette.movistarBlueHC65 | MovistarColors.palette.white

    let buttonSecondaryBackgroundHover = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundSelected = MovistarColors.palette.movistarBlue15 | MovistarColors.palette.white.withAlphaComponent(0.25)

    let buttonSecondaryBorderInverse = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let buttonSecondaryBorderInverseSelected = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let buttonSecondaryBackgroundInverseHover = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInverseSelected = MovistarColors.palette.white.withAlphaComponent(0.3) | MovistarColors.palette.white.withAlphaComponent(0.25)

    let textButtonPrimary = MovistarColors.palette.white

    let textButtonPrimaryInverse = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.white

    let textButtonPrimaryInverseSelected = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.white

    let textButtonSecondary = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.darkModeGrey2

    let textButtonSecondarySelected = MovistarColors.palette.movistarBlueHC55 | MovistarColors.palette.darkModeGrey2

    let textButtonSecondaryInverse = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let textButtonSecondaryInverseSelected = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let textLink = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.movistarBlue

    let textLinkInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlue

    let textLinkDanger = MovistarColors.palette.pepper60 | MovistarColors.palette.pepper45

    let textLinkSnackbar = MovistarColors.palette.movistarBlue30 | MovistarColors.palette.movistarBlue

    let textActivated = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.movistarBlue

    let textBrand = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.movistarBlue

    let control = MovistarColors.palette.grey4 | MovistarColors.palette.darkModeGrey4

    let controlActivated = MovistarColors.palette.movistarBlue

    let controlInverse = MovistarColors.palette.movistarBlue20 | MovistarColors.palette.darkModeGrey4

    let controlActivatedInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlue

    let controlError = MovistarColors.palette.pepper55 | MovistarColors.palette.pepper45

    let barTrack = MovistarColors.palette.grey3 | MovistarColors.palette.darkModeGrey6

    let loadingBar = MovistarColors.palette.movistarBlue

    let loadingBarBackground = MovistarColors.palette.grey2 | MovistarColors.palette.darkModeGrey6

    let toggleAndroidInactive = MovistarColors.palette.grey2 | MovistarColors.palette.darkModeGrey2

    let toggleAndroidBackgroundActive = MovistarColors.palette.movistarBlue20

    let iosControlKnob = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let divider = MovistarColors.palette.grey3 | MovistarColors.palette.white.withAlphaComponent(0.1)

    let dividerInverse = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.1)

    let navigationBarDivider = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack

    let badge = MovistarColors.palette.pepper55

    let feedbackErrorBackground = MovistarColors.palette.pepper55

    let feedbackInfoBackground = MovistarColors.palette.movistarBlueDark

    let brand = MovistarColors.palette.movistarBlue

    let brandHigh = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.movistarBlue40

    let inverse = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let neutralHigh = MovistarColors.palette.movistarBlueDark | MovistarColors.palette.darkModeGrey2

    let neutralMedium = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey5

    let neutralMediumInverse = MovistarColors.palette.grey5

    let neutralLow = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeGrey6

    let neutralLowAlternative = MovistarColors.palette.grey2 | MovistarColors.palette.darkModeGrey6

    let textPrimary = MovistarColors.palette.movistarBlueDark | MovistarColors.palette.darkModeGrey2

    let textPrimaryInverse = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let textSecondary = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey4

    let textSecondaryInverse = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.darkModeGrey4

    let success = MovistarColors.palette.movistarGreen55 | MovistarColors.palette.movistarGreen

    let warning = MovistarColors.palette.egg55 | MovistarColors.palette.egg

    let error = MovistarColors.palette.pepper55 | MovistarColors.palette.pepper45

    let textError = MovistarColors.palette.pepper55 | MovistarColors.palette.pepper45

    let textErrorInverse = MovistarColors.palette.white | MovistarColors.palette.pepper45

    let promo = MovistarColors.palette.purple | MovistarColors.palette.purple40

    let highlight = MovistarColors.palette.pink55 | MovistarColors.palette.pink45

    let successLow = MovistarColors.palette.movistarGreen10 | MovistarColors.palette.darkModeGrey7

    let warningLow = MovistarColors.palette.egg10 | MovistarColors.palette.darkModeGrey7

    let errorLow = MovistarColors.palette.pepper10 | MovistarColors.palette.darkModeGrey7

    let promoLow = MovistarColors.palette.purple10 | MovistarColors.palette.darkModeGrey7

    let brandLow = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.darkModeGrey7

    let successHigh = MovistarColors.palette.movistarGreen70 | MovistarColors.palette.movistarGreen40

    let warningHigh = MovistarColors.palette.egg80 | MovistarColors.palette.egg40

    let errorHigh = MovistarColors.palette.pepper70 | MovistarColors.palette.pepper45

    let promoHigh = MovistarColors.palette.purple70 | MovistarColors.palette.purple35

    let successHighInverse = MovistarColors.palette.movistarGreen70

    let warningHighInverse = MovistarColors.palette.egg80

    let errorHighInverse = MovistarColors.palette.pepper70

    let promoHighInverse = MovistarColors.palette.purple70

    let textNavigationBarPrimary = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let textNavigationBarSecondary = MovistarColors.palette.movistarBlue20 | MovistarColors.palette.darkModeGrey4

    let textNavigationSearchBarHint = MovistarColors.palette.movistarBlue20 | MovistarColors.palette.darkModeGrey4

    let textNavigationSearchBarText = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2

    let textAppBar = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey4

    let textAppBarSelected = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.movistarBlue

    let customTabsBackground = MovistarColors.palette.white | MovistarColors.palette.darkModeBlack

    let tagTextPromo = MovistarColors.palette.purple70 | MovistarColors.palette.purple35

    let tagTextActive = MovistarColors.palette.movistarBlueHC | MovistarColors.palette.movistarBlue

    let tagTextInactive = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey3

    let tagTextSuccess = MovistarColors.palette.movistarGreen70 | MovistarColors.palette.movistarGreen40

    let tagTextWarning = MovistarColors.palette.egg80 | MovistarColors.palette.egg40

    let tagTextError = MovistarColors.palette.pepper70 | MovistarColors.palette.pepper45

    let tagBackgroundPromo = MovistarColors.palette.purple10 | MovistarColors.palette.darkModeGrey7

    let tagBackgroundActive = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.darkModeGrey7

    let tagBackgroundInactive = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeGrey7

    let tagBackgroundSuccess = MovistarColors.palette.movistarGreen10 | MovistarColors.palette.darkModeGrey7

    let tagBackgroundWarning = MovistarColors.palette.egg10 | MovistarColors.palette.darkModeGrey7

    let tagBackgroundError = MovistarColors.palette.pepper10 | MovistarColors.palette.darkModeGrey7
}

public struct MovistarColorPalette {
    public init() {}
    public let movistarBlue = UIColor(hex: "#0B9CEA")!
    public let movistarBlue10 = UIColor(hex: "#E6F5FD")!
    public let movistarBlue15 = UIColor(hex: "#CEEBFB")!
    public let movistarBlue20 = UIColor(hex: "#B3E1FB")!
    public let movistarBlue30 = UIColor(hex: "#80CEF9")!
    public let movistarBlue40 = UIColor(hex: "#4DBAF7")!
    public let movistarBlue55 = UIColor(hex: "#008EDD")!
    public let movistarBlueHC = UIColor(hex: "#066FCB")!
    public let movistarBlueHC55 = UIColor(hex: "#055EAC")!
    public let movistarBlueHC65 = UIColor(hex: "#055398")!
    public let movistarGreen = UIColor(hex: "#5CB615")!
    public let movistarGreen10 = UIColor(hex: "#EFF8E8")!
    public let movistarGreen30 = UIColor(hex: "#ADDA8A")!
    public let movistarGreen40 = UIColor(hex: "#8DCC5B")!
    public let movistarGreen55 = UIColor(hex: "#52A413")!
    public let movistarGreen60 = UIColor(hex: "#499110")!
    public let movistarGreen70 = UIColor(hex: "#407F0F")!
    public let pepper = UIColor(hex: "#FF374A")!
    public let pepper10 = UIColor(hex: "#FFEBED")!
    public let pepper40 = UIColor(hex: "#FF7380")!
    public let pepper45 = UIColor(hex: "#FF5F6E")!
    public let pepper55 = UIColor(hex: "#D73241")!
    public let pepper60 = UIColor(hex: "#CC2C3B")!
    public let pepper65 = UIColor(hex: "#BF2937")!
    public let pepper70 = UIColor(hex: "#B22634")!
    public let egg = UIColor(hex: "#F28D15")!
    public let egg10 = UIColor(hex: "#FEF4E8")!
    public let egg40 = UIColor(hex: "#F6AF5B")!
    public let egg55 = UIColor(hex: "#D97D0D")!
    public let egg80 = UIColor(hex: "#6D3F09")!
    public let pink = UIColor(hex: "#E63780")!
    public let pink45 = UIColor(hex: "#EB5F99")!
    public let pink55 = UIColor(hex: "#C42F6D")!
    public let purple = UIColor(hex: "#A13EA1")!
    public let purple10 = UIColor(hex: "#F6ECF6")!
    public let purple35 = UIColor(hex: "#C78BC7")!
    public let purple40 = UIColor(hex: "#BD78BD")!
    public let purple70 = UIColor(hex: "#712B71")!
    public let grey1 = UIColor(hex: "#F6F6F6")!
    public let grey2 = UIColor(hex: "#EEEEEE")!
    public let grey3 = UIColor(hex: "#DDDDDD")!
    public let grey4 = UIColor(hex: "#949494")!
    public let grey5 = UIColor(hex: "#6B6C6F")!
    public let grey6 = UIColor(hex: "#313235")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let black = UIColor(hex: "#000000")!
    public let movistarBlueDark = UIColor(hex: "#0B2739")!
    public let darkModeBlack = UIColor(hex: "#061824")!
    public let darkModeGrey = UIColor(hex: "#081F2E")!
    public let darkModeGrey2 = UIColor(hex: "#EAEBEE")!
    public let darkModeGrey3 = UIColor(hex: "#CED4D7")!
    public let darkModeGrey4 = UIColor(hex: "#85939C")!
    public let darkModeGrey5 = UIColor(hex: "#6D7D88")!
    public let darkModeGrey6 = UIColor(hex: "#3C5261")!
    public let darkModeGrey7 = UIColor(hex: "#032F46")!
}
