//
//  TuColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct TuColors: MisticaColors {
    static let palette = TuColorPalette()

    let appBarBackground = TuColors.palette.white | TuColors.palette.darkModeGrey

    let background = TuColors.palette.white | TuColors.palette.darkModeBlack

    let backgroundContainer = TuColors.palette.white | TuColors.palette.darkModeGrey

    let backgroundContainerError = TuColors.palette.red10 | TuColors.palette.darkModeGrey

    let backgroundContainerHover = TuColors.palette.grey9.withAlphaComponent(0.03) | TuColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerPressed = TuColors.palette.grey9.withAlphaComponent(0.05) | TuColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrand = TuColors.palette.primary | TuColors.palette.darkModeGrey

    let backgroundContainerBrandHover = TuColors.palette.grey9.withAlphaComponent(0.2) | TuColors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = TuColors.palette.grey9.withAlphaComponent(0.4) | TuColors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = TuColors.palette.primary80 | TuColors.palette.darkModeGrey

    let backgroundContainerAlternative = TuColors.palette.grey1 | TuColors.palette.darkModeGrey

    let backgroundBrand = TuColors.palette.primary | TuColors.palette.darkModeBlack

    let backgroundBrandSecondary = TuColors.palette.blue | TuColors.palette.darkModeBlack

    let backgroundOverlay = TuColors.palette.primary.withAlphaComponent(0.8) | TuColors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = TuColors.palette.grey2 | TuColors.palette.darkModeGrey6

    let backgroundSkeletonInverse = TuColors.palette.primary65 | TuColors.palette.darkModeGrey6

    let navigationBarBackground = TuColors.palette.primary | TuColors.palette.darkModeBlack

    let backgroundAlternative = TuColors.palette.grey1 | TuColors.palette.darkModeBlack

    let backgroundBrandTop = TuColors.palette.primary | TuColors.palette.darkModeBlack

    let backgroundBrandBottom = TuColors.palette.primary | TuColors.palette.darkModeBlack

    let skeletonWave = TuColors.palette.grey2 | TuColors.palette.grey5

    let borderLow = TuColors.palette.grey1 | TuColors.palette.darkModeBlack

    let border = TuColors.palette.grey2 | TuColors.palette.darkModeGrey

    let borderHigh = TuColors.palette.grey5

    let borderSelected = TuColors.palette.blue | TuColors.palette.blue30

    let coverBackgroundHover = TuColors.palette.grey9.withAlphaComponent(0.25) | TuColors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = TuColors.palette.grey9.withAlphaComponent(0.35) | TuColors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = TuColors.palette.red

    let buttonDangerBackgroundSelected = TuColors.palette.red55 | TuColors.palette.red80

    let buttonDangerBackgroundHover = TuColors.palette.red55 | TuColors.palette.red80

    let buttonLinkDangerBackgroundSelected = TuColors.palette.red10

    let buttonLinkDangerBackgroundInverse = TuColors.palette.white | TuColors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundInverseSelected = TuColors.palette.red10

    let buttonLinkBackgroundSelected = TuColors.palette.blue10 | TuColors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundInverseSelected = TuColors.palette.white.withAlphaComponent(0.08)

    let buttonPrimaryBackground = TuColors.palette.primary | TuColors.palette.grey2

    let buttonPrimaryBackgroundInverse = TuColors.palette.white | TuColors.palette.grey2

    let buttonPrimaryBackgroundSelected = TuColors.palette.primary45 | TuColors.palette.grey3

    let buttonPrimaryBackgroundHover = TuColors.palette.primary45 | TuColors.palette.grey3

    let buttonPrimaryBackgroundInverseSelected = TuColors.palette.white.withAlphaComponent(0.8) | TuColors.palette.grey3

    let buttonSecondaryBorder = TuColors.palette.blue | TuColors.palette.grey2

    let buttonSecondaryBorderSelected = TuColors.palette.blue70 | TuColors.palette.grey2

    let buttonSecondaryBackgroundHover = TuColors.palette.blue10 | TuColors.palette.grey2.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundSelected = TuColors.palette.blue10 | TuColors.palette.grey2.withAlphaComponent(0.15)

    let buttonSecondaryBorderInverse = TuColors.palette.white | TuColors.palette.grey2

    let buttonSecondaryBorderInverseSelected = TuColors.palette.white | TuColors.palette.grey2

    let buttonSecondaryBackgroundInverseHover = TuColors.palette.white.withAlphaComponent(0.1) | TuColors.palette.grey2.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInverseSelected = TuColors.palette.white.withAlphaComponent(0.1) | TuColors.palette.grey2.withAlphaComponent(0.15)

    let textButtonPrimary = TuColors.palette.white | TuColors.palette.primary

    let textButtonPrimaryInverse = TuColors.palette.primary

    let textButtonPrimaryInverseSelected = TuColors.palette.primary

    let textButtonSecondary = TuColors.palette.blue | TuColors.palette.grey2

    let textButtonSecondarySelected = TuColors.palette.blue70 | TuColors.palette.grey2

    let textButtonSecondaryInverse = TuColors.palette.white | TuColors.palette.grey2

    let textButtonSecondaryInverseSelected = TuColors.palette.white | TuColors.palette.grey2

    let textLink = TuColors.palette.blue | TuColors.palette.blue30

    let textLinkInverse = TuColors.palette.white | TuColors.palette.blue30

    let textLinkDanger = TuColors.palette.red

    let textLinkSnackbar = TuColors.palette.white | TuColors.palette.blue30

    let textActivated = TuColors.palette.primary | TuColors.palette.blue30

    let textBrand = TuColors.palette.blue | TuColors.palette.blue30

    let control = TuColors.palette.grey5 | TuColors.palette.darkModeGrey6

    let controlActivated = TuColors.palette.primary | TuColors.palette.blue30

    let controlInverse = TuColors.palette.white | TuColors.palette.darkModeGrey6

    let controlActivatedInverse = TuColors.palette.white | TuColors.palette.blue30

    let controlError = TuColors.palette.red

    let barTrack = TuColors.palette.grey2 | TuColors.palette.darkModeGrey6

    let loadingBar = TuColors.palette.green40

    let loadingBarBackground = TuColors.palette.green

    let toggleAndroidInactive = TuColors.palette.grey2 | TuColors.palette.grey4

    let toggleAndroidBackgroundActive = TuColors.palette.primary15 | TuColors.palette.blue20

    let iosControlKnob = TuColors.palette.white | TuColors.palette.grey2

    let divider = TuColors.palette.grey2 | TuColors.palette.white.withAlphaComponent(0.05)

    let dividerInverse = TuColors.palette.white.withAlphaComponent(0.2) | TuColors.palette.white.withAlphaComponent(0.05)

    let navigationBarDivider = TuColors.palette.primary | TuColors.palette.darkModeBlack

    let badge = TuColors.palette.blue | TuColors.palette.blue30

    let feedbackErrorBackground = TuColors.palette.red

    let feedbackInfoBackground = TuColors.palette.primary | TuColors.palette.darkModeGrey

    let brand = TuColors.palette.blue | TuColors.palette.blue30

    let brandHigh = TuColors.palette.blue70 | TuColors.palette.white.withAlphaComponent(0.05)

    let inverse = TuColors.palette.white | TuColors.palette.grey2

    let neutralHigh = TuColors.palette.grey9 | TuColors.palette.grey2

    let neutralMedium = TuColors.palette.grey5

    let neutralMediumInverse = TuColors.palette.grey5

    let neutralLow = TuColors.palette.grey1 | TuColors.palette.darkModeGrey6

    let neutralLowAlternative = TuColors.palette.grey2 | TuColors.palette.darkModeGrey6

    let textPrimary = TuColors.palette.grey9 | TuColors.palette.grey2

    let textPrimaryInverse = TuColors.palette.white | TuColors.palette.grey2

    let textSecondary = TuColors.palette.grey6 | TuColors.palette.grey4

    let textSecondaryInverse = TuColors.palette.grey3 | TuColors.palette.grey4

    let error = TuColors.palette.red

    let textError = TuColors.palette.red

    let textErrorInverse = TuColors.palette.white | TuColors.palette.red

    let success = TuColors.palette.green

    let warning = TuColors.palette.orange

    let promo = TuColors.palette.blue

    let highlight = TuColors.palette.red40

    let successLow = TuColors.palette.green10 | TuColors.palette.darkModeGrey6

    let warningLow = TuColors.palette.orange20 | TuColors.palette.darkModeGrey6

    let errorLow = TuColors.palette.red10 | TuColors.palette.darkModeGrey6

    let promoLow = TuColors.palette.blue10 | TuColors.palette.darkModeGrey6

    let brandLow = TuColors.palette.blue10 | TuColors.palette.darkModeGrey6

    let successHigh = TuColors.palette.green75 | TuColors.palette.green40

    let warningHigh = TuColors.palette.orange70 | TuColors.palette.orange55

    let errorHigh = TuColors.palette.red70 | TuColors.palette.red40

    let promoHigh = TuColors.palette.blue | TuColors.palette.blue30

    let successHighInverse = TuColors.palette.green75

    let warningHighInverse = TuColors.palette.orange70

    let errorHighInverse = TuColors.palette.red70

    let promoHighInverse = TuColors.palette.blue | TuColors.palette.blue70

    let textNavigationBarPrimary = TuColors.palette.white | TuColors.palette.grey2

    let textNavigationBarSecondary = TuColors.palette.grey1 | TuColors.palette.grey4

    let textNavigationSearchBarHint = TuColors.palette.grey1 | TuColors.palette.grey4

    let textNavigationSearchBarText = TuColors.palette.white | TuColors.palette.grey2

    let textAppBar = TuColors.palette.grey6 | TuColors.palette.grey5

    let textAppBarSelected = TuColors.palette.primary | TuColors.palette.grey2

    let customTabsBackground = TuColors.palette.white | TuColors.palette.darkModeBlack

    let tagTextPromo = TuColors.palette.blue | TuColors.palette.blue30

    let tagTextActive = TuColors.palette.blue | TuColors.palette.blue30

    let tagTextInactive = TuColors.palette.grey5

    let tagTextSuccess = TuColors.palette.green75 | TuColors.palette.green40

    let tagTextWarning = TuColors.palette.orange70 | TuColors.palette.orange55

    let tagTextError = TuColors.palette.red70 | TuColors.palette.red40

    let tagBackgroundPromo = TuColors.palette.blue10 | TuColors.palette.darkModeGrey6

    let tagBackgroundActive = TuColors.palette.blue10 | TuColors.palette.darkModeGrey6

    let tagBackgroundInactive = TuColors.palette.grey1 | TuColors.palette.darkModeGrey6

    let tagBackgroundSuccess = TuColors.palette.green10 | TuColors.palette.darkModeGrey6

    let tagBackgroundWarning = TuColors.palette.orange20 | TuColors.palette.darkModeGrey6

    let tagBackgroundError = TuColors.palette.red10 | TuColors.palette.darkModeGrey6
}

public struct TuColorPalette {
    public init() {}
    public let primary = UIColor(hex: "#2B3447")!
    public let primary10 = UIColor(hex: "#EAEBED")!
    public let primary15 = UIColor(hex: "#D5D6DA")!
    public let primary45 = UIColor(hex: "#555D6C")!
    public let primary65 = UIColor(hex: "#202735")!
    public let primary80 = UIColor(hex: "#161A24")!
    public let blue = UIColor(hex: "#4343FF")!
    public let blue10 = UIColor(hex: "#ECECFF")!
    public let blue20 = UIColor(hex: "#C7C7FF")!
    public let blue30 = UIColor(hex: "#A1A1FF")!
    public let blue70 = UIColor(hex: "#3232B9")!
    public let orange = UIColor(hex: "#EFE384")!
    public let orange20 = UIColor(hex: "#FAF7DA")!
    public let orange55 = UIColor(hex: "#D5C77D")!
    public let orange65 = UIColor(hex: "#BBAF6F")!
    public let orange70 = UIColor(hex: "#958946")!
    public let red = UIColor(hex: "#CB4D3A")!
    public let red10 = UIColor(hex: "#FAEDEB")!
    public let red40 = UIColor(hex: "#DB8275")!
    public let red55 = UIColor(hex: "#BB4736")!
    public let red70 = UIColor(hex: "#8E3629")!
    public let red80 = UIColor(hex: "#5B231A")!
    public let green = UIColor(hex: "#00D19D")!
    public let green10 = UIColor(hex: "#E5FAF5")!
    public let green40 = UIColor(hex: "#A1DFCF")!
    public let green75 = UIColor(hex: "#007D5E")!
    public let grey1 = UIColor(hex: "#F2F4FF")!
    public let grey2 = UIColor(hex: "#D1D5E4")!
    public let grey3 = UIColor(hex: "#B0B6CA")!
    public let grey4 = UIColor(hex: "#8F97AF")!
    public let grey5 = UIColor(hex: "#6E7894")!
    public let grey6 = UIColor(hex: "#58617A")!
    public let grey7 = UIColor(hex: "#414B61")!
    public let grey8 = UIColor(hex: "#2B3447")!
    public let grey9 = UIColor(hex: "#031A34")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let black = UIColor(hex: "#000000")!
    public let darkModeBlack = UIColor(hex: "#161A24")!
    public let darkModeGrey = UIColor(hex: "#202735")!
    public let darkModeGrey6 = UIColor(hex: "#2B3447")!
}
