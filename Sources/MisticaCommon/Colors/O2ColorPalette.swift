//
//  O2ColorPalette.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

struct O2Colors: MisticaColors {
    static let palette = O2ColorPalette()

    let background = O2Colors.palette.white | O2Colors.palette.darkModeBlack

    let backgroundAlternative = O2Colors.palette.grey1 | O2Colors.palette.darkModeBlack

    let backgroundBrand = MisticaColor.solid(O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeBlack)

    let backgroundBrandSecondary = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeBlack

    let backgroundContainer = O2Colors.palette.white | O2Colors.palette.darkModeGrey

    let backgroundContainerError = O2Colors.palette.pepper10 | O2Colors.palette.darkModeGrey

    let backgroundContainerHover = O2Colors.palette.darkModeBlack.withAlphaComponent(0.05) | O2Colors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerPressed = O2Colors.palette.darkModeBlack.withAlphaComponent(0.08) | O2Colors.palette.white.withAlphaComponent(0.08)

    let backgroundContainerBrand = MisticaColor.solid(O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeGrey)

    let backgroundContainerBrandHover = O2Colors.palette.darkModeBlack.withAlphaComponent(0.2) | O2Colors.palette.white.withAlphaComponent(0.03)

    let backgroundContainerBrandPressed = O2Colors.palette.darkModeBlack.withAlphaComponent(0.4) | O2Colors.palette.white.withAlphaComponent(0.05)

    let backgroundContainerBrandOverInverse = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.darkModeGrey

    let backgroundContainerAlternative = O2Colors.palette.grey1 | O2Colors.palette.darkModeGrey

    let backgroundOverlay = O2Colors.palette.grey6.withAlphaComponent(0.6) | O2Colors.palette.darkModeGrey.withAlphaComponent(0.8)

    let backgroundSkeleton = O2Colors.palette.grey2 | O2Colors.palette.darkModeGrey6

    let backgroundSkeletonInverse = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.darkModeGrey6

    let backgroundBrandTop = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeBlack

    let backgroundBrandBottom = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeBlack

    let appBarBackground = O2Colors.palette.white | O2Colors.palette.darkModeGrey

    let navigationBarBackground = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeBlack

    let skeletonWave = O2Colors.palette.grey2 | O2Colors.palette.grey5

    let borderLow = O2Colors.palette.grey1 | O2Colors.palette.darkModeBlack

    let border = O2Colors.palette.grey3 | O2Colors.palette.darkModeGrey

    let borderHigh = O2Colors.palette.grey5

    let borderSelected = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let completedStep = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeO2BluePrimary

    let completedStepInverse = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.darkModeO2BluePrimary

    let coverBackgroundHover = O2Colors.palette.darkModeBlack.withAlphaComponent(0.25)

    let coverBackgroundPressed = O2Colors.palette.darkModeBlack.withAlphaComponent(0.35)

    let buttonDangerBackground = O2Colors.palette.pepper

    let buttonDangerBackgroundPressed = O2Colors.palette.pepper60

    let buttonDangerBackgroundHover = O2Colors.palette.pepper60

    let buttonLinkDangerBackgroundPressed = O2Colors.palette.pepper10 | O2Colors.palette.white.withAlphaComponent(0.08)

    let buttonLinkDangerBackgroundInverse = O2Colors.palette.white | O2Colors.palette.white.withAlphaComponent(0)

    let buttonLinkDangerBackgroundInversePressed = O2Colors.palette.pepper10 | O2Colors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundPressed = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.white.withAlphaComponent(0.08)

    let buttonLinkBackgroundInversePressed = O2Colors.palette.white.withAlphaComponent(0.08)

    let buttonPrimaryBackground = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeO2BluePrimary

    let buttonPrimaryBackgroundInverse = O2Colors.palette.white | O2Colors.palette.darkModeO2BluePrimary

    let buttonPrimaryBackgroundPressed = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.darkModeO2BluePrimaryDark

    let buttonPrimaryBackgroundHover = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.darkModeO2BluePrimaryDark

    let buttonPrimaryBackgroundInversePressed = O2Colors.palette.o2BluePrimary30 | O2Colors.palette.darkModeO2BluePrimaryDark

    let buttonSecondaryBorder = O2Colors.palette.o2BluePrimary | O2Colors.palette.white

    let buttonSecondaryBorderPressed = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.white

    let buttonSecondaryBorderInverse = O2Colors.palette.white

    let buttonSecondaryBackgroundHover = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundPressed = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBorderInversePressed = O2Colors.palette.o2BluePrimary30 | O2Colors.palette.white

    let buttonSecondaryBackgroundInverseHover = O2Colors.palette.white.withAlphaComponent(0.15)

    let buttonSecondaryBackgroundInversePressed = O2Colors.palette.white.withAlphaComponent(0.15)

    let textButtonPrimary = O2Colors.palette.white | O2Colors.palette.grey2

    let textButtonPrimaryInverse = O2Colors.palette.o2BluePrimary | O2Colors.palette.grey2

    let textButtonPrimaryInversePressed = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.grey2

    let textButtonSecondary = O2Colors.palette.o2BluePrimary | O2Colors.palette.grey2

    let textButtonSecondaryPressed = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.grey2

    let textButtonSecondaryInverse = O2Colors.palette.white | O2Colors.palette.grey2

    let textButtonSecondaryInversePressed = O2Colors.palette.white | O2Colors.palette.grey2

    let textLink = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let textLinkInverse = O2Colors.palette.white | O2Colors.palette.o2BluePrimary30

    let textLinkDanger = O2Colors.palette.pepper

    let textLinkSnackbar = O2Colors.palette.o2BluePrimary30

    let textActivated = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let textBrand = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let inputBorder = O2Colors.palette.grey3 | O2Colors.palette.darkModeGrey6

    let control = O2Colors.palette.grey3 | O2Colors.palette.darkModeGrey6

    let controlActivated = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let controlInverse = O2Colors.palette.o2BluePrimary30 | O2Colors.palette.darkModeGrey6

    let controlActivatedInverse = O2Colors.palette.white | O2Colors.palette.o2BluePrimary30

    let controlError = O2Colors.palette.pepper

    let barTrack = O2Colors.palette.grey3 | O2Colors.palette.darkModeGrey6

    let barTrackInverse = O2Colors.palette.white.withAlphaComponent(0.3) | O2Colors.palette.darkModeGrey6

    let loadingBar = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeO2BluePrimary

    let loadingBarBackground = O2Colors.palette.grey1 | O2Colors.palette.darkModeGrey6

    let toggleAndroidInactive = O2Colors.palette.grey2 | O2Colors.palette.grey4

    let toggleAndroidBackgroundActive = O2Colors.palette.o2BluePrimary15 | O2Colors.palette.o2BlueLight30

    let iosControlKnob = O2Colors.palette.white | O2Colors.palette.grey2

    let controlKnobInverse = O2Colors.palette.o2BluePrimary | O2Colors.palette.grey2

    let divider = O2Colors.palette.grey2 | O2Colors.palette.white.withAlphaComponent(0.05)

    let dividerInverse = O2Colors.palette.white.withAlphaComponent(0.2) | O2Colors.palette.white.withAlphaComponent(0.05)

    let navigationBarDivider = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeBlack

    let badge = O2Colors.palette.pepper60

    let feedbackErrorBackground = O2Colors.palette.pepper

    let feedbackInfoBackground = O2Colors.palette.grey6 | O2Colors.palette.darkModeGrey6

    let brand = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let brandHigh = O2Colors.palette.o2BluePrimary70 | O2Colors.palette.white.withAlphaComponent(0.05)

    let inverse = O2Colors.palette.white | O2Colors.palette.grey2

    let neutralHigh = O2Colors.palette.grey6 | O2Colors.palette.grey2

    let neutralMedium = O2Colors.palette.grey5

    let neutralMediumInverse = O2Colors.palette.grey5

    let neutralLow = O2Colors.palette.grey1 | O2Colors.palette.darkModeGrey6

    let neutralLowAlternative = O2Colors.palette.grey2 | O2Colors.palette.darkModeGrey6

    let textPrimary = O2Colors.palette.grey6 | O2Colors.palette.grey2

    let textPrimaryInverse = O2Colors.palette.white | O2Colors.palette.grey2

    let textSecondary = O2Colors.palette.grey5 | O2Colors.palette.grey4

    let textSecondaryInverse = O2Colors.palette.o2BluePrimary15 | O2Colors.palette.grey4

    let error = O2Colors.palette.pepper

    let textError = O2Colors.palette.pepper

    let textErrorInverse = O2Colors.palette.white | O2Colors.palette.pepper

    let success = O2Colors.palette.o2Green

    let warning = O2Colors.palette.o2Orange

    let promo = O2Colors.palette.o2Purple

    let highlight = O2Colors.palette.o2Pink

    let successLow = O2Colors.palette.o2Green10 | O2Colors.palette.darkModeGrey6

    let warningLow = O2Colors.palette.o2Orange10 | O2Colors.palette.darkModeGrey6

    let errorLow = O2Colors.palette.pepper10 | O2Colors.palette.darkModeGrey6

    let promoLow = O2Colors.palette.o2Purple10 | O2Colors.palette.darkModeGrey6

    let brandLow = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.darkModeGrey6

    let successHigh = O2Colors.palette.o2Green80 | O2Colors.palette.o2Green40

    let warningHigh = O2Colors.palette.o2Orange75 | O2Colors.palette.o2Orange40

    let errorHigh = O2Colors.palette.pepper60 | O2Colors.palette.pepper40

    let promoHigh = O2Colors.palette.o2Purple | O2Colors.palette.o2Purple30

    let successHighInverse = O2Colors.palette.o2Green80

    let warningHighInverse = O2Colors.palette.o2Orange75

    let errorHighInverse = O2Colors.palette.pepper60

    let promoHighInverse = O2Colors.palette.o2Purple

    let textNavigationBarPrimary = O2Colors.palette.white | O2Colors.palette.grey2

    let textNavigationBarSecondary = O2Colors.palette.o2BluePrimary30 | O2Colors.palette.grey4

    let textNavigationSearchBarHint = O2Colors.palette.o2BluePrimary30 | O2Colors.palette.grey4

    let textNavigationSearchBarText = O2Colors.palette.white | O2Colors.palette.grey2

    let textAppBar = O2Colors.palette.grey4 | O2Colors.palette.grey5

    let textAppBarSelected = O2Colors.palette.o2BluePrimary | O2Colors.palette.grey2

    let customTabsBackground = O2Colors.palette.o2BluePrimary | O2Colors.palette.darkModeBlack

    let tagTextPromo = O2Colors.palette.o2Purple | O2Colors.palette.o2Purple30

    let tagTextActive = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let tagTextInactive = O2Colors.palette.grey5

    let tagTextInfo = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let tagTextSuccess = O2Colors.palette.o2Green80 | O2Colors.palette.o2Green40

    let tagTextWarning = O2Colors.palette.o2Orange75 | O2Colors.palette.o2Orange40

    let tagTextError = O2Colors.palette.pepper60 | O2Colors.palette.pepper40

    let tagBackgroundPromo = O2Colors.palette.o2Purple10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundActive = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundInactive = O2Colors.palette.grey1 | O2Colors.palette.darkModeGrey6

    let tagBackgroundInfo = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundSuccess = O2Colors.palette.o2Green10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundWarning = O2Colors.palette.o2Orange10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundError = O2Colors.palette.pepper10 | O2Colors.palette.darkModeGrey6

    let tagTextPromoInverse = O2Colors.palette.o2Purple | O2Colors.palette.o2Purple30

    let tagTextActiveInverse = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let tagTextInactiveInverse = O2Colors.palette.grey5

    let tagTextInfoInverse = O2Colors.palette.o2BluePrimary | O2Colors.palette.o2BluePrimary30

    let tagTextSuccessInverse = O2Colors.palette.o2Green80 | O2Colors.palette.o2Green40

    let tagTextWarningInverse = O2Colors.palette.o2Orange75 | O2Colors.palette.o2Orange40

    let tagTextErrorInverse = O2Colors.palette.pepper60 | O2Colors.palette.pepper40

    let tagBackgroundPromoInverse = O2Colors.palette.o2Purple10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundActiveInverse = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundInactiveInverse = O2Colors.palette.grey1 | O2Colors.palette.darkModeGrey6

    let tagBackgroundInfoInverse = O2Colors.palette.o2BluePrimary10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundSuccessInverse = O2Colors.palette.o2Green10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundWarningInverse = O2Colors.palette.o2Orange10 | O2Colors.palette.darkModeGrey6

    let tagBackgroundErrorInverse = O2Colors.palette.pepper10 | O2Colors.palette.darkModeGrey6

    let cardContentOverlay = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            O2Colors.palette.black.withAlphaComponent(0),
            O2Colors.palette.black.withAlphaComponent(0.4),
            O2Colors.palette.black.withAlphaComponent(0.7)
        ],
        stops: [0, 0.3, 1],
        angle: 180
    ))
}

public struct O2ColorPalette: Sendable {
    public init() {}
    public let o2BluePrimary = UIColor(hex: "#0019A5")!
    public let o2BluePrimary70 = UIColor(hex: "#000066")!
    public let o2BluePrimary90 = UIColor(hex: "#000033")!
    public let o2BluePrimary30 = UIColor(hex: "#808CD2")!
    public let o2BluePrimary15 = UIColor(hex: "#CCD1ED")!
    public let o2BluePrimary10 = UIColor(hex: "#E5E8F6")!
    public let o2BlueMid = UIColor(hex: "#0090D0")!
    public let o2BlueLight = UIColor(hex: "#41B6E6")!
    public let o2BlueLight30 = UIColor(hex: "#C6E9F7")!
    public let o2BlueLight35 = UIColor(hex: "#8DD3F0")!
    public let o2Teal = UIColor(hex: "#01B7B4")!
    public let o2Green = UIColor(hex: "#91C90E")!
    public let o2Green10 = UIColor(hex: "#F4FAE7")!
    public let o2Green40 = UIColor(hex: "#B2D956")!
    public let o2Green80 = UIColor(hex: "#415A06")!
    public let o2Yellow = UIColor(hex: "#FEDB00")!
    public let o2Orange = UIColor(hex: "#FF7F41")!
    public let o2Orange10 = UIColor(hex: "#FFF2EC")!
    public let o2Orange40 = UIColor(hex: "#FFA57A")!
    public let o2Orange75 = UIColor(hex: "#A6522A")!
    public let o2Pink = UIColor(hex: "#E45DBF")!
    public let o2Purple = UIColor(hex: "#952D98")!
    public let o2Purple10 = UIColor(hex: "#F4EAF5")!
    public let o2Purple30 = UIColor(hex: "#CA9ACB")!
    public let pepper = UIColor(hex: "#F4364C")!
    public let pepper10 = UIColor(hex: "#FEEBED")!
    public let pepper20 = UIColor(hex: "#FCC3C9")!
    public let pepper40 = UIColor(hex: "#FF7380")!
    public let pepper60 = UIColor(hex: "#C32B3D")!
    public let grey1 = UIColor(hex: "#F6F6F6")!
    public let grey2 = UIColor(hex: "#EEEEEE")!
    public let grey3 = UIColor(hex: "#DDDDDD")!
    public let grey4 = UIColor(hex: "#999999")!
    public let grey5 = UIColor(hex: "#707070")!
    public let grey6 = UIColor(hex: "#000033")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let black = UIColor(hex: "#000000")!
    public let darkModeBlack = UIColor(hex: "#191919")!
    public let darkModeGrey = UIColor(hex: "#242424")!
    public let darkModeGrey6 = UIColor(hex: "#313235")!
    public let darkModeO2BluePrimary = UIColor(hex: "#0020D6")!
    public let darkModeO2BluePrimaryDark = UIColor(hex: "#000099")!
}
