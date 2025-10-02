
// Generated using Make
// DO NOT EDIT

import UIKit

struct O2NewColors: MisticaColors {
    static let palette = O2NewColorPalette()

     let background = O2NewColors.palette.white | O2NewColors.palette.darkModeBlack

     let backgroundAlternative = O2NewColors.palette.grey20 | O2NewColors.palette.darkModeBlack

     let backgroundBrand = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            O2NewColors.palette.darkBlue | O2NewColors.palette.darkModeBlack,
            O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeBlack,
            O2NewColors.palette.beyondBlue45 | O2NewColors.palette.darkModeBlack
        ],
        stops: [0,0.64,1],
        angle: 180
    ))

     let backgroundBrandSecondary = O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeBlack

     let backgroundContainer = O2NewColors.palette.white | O2NewColors.palette.darkModeGrey

     let backgroundContainerError = O2NewColors.palette.o2Red10 | O2NewColors.palette.darkModeGrey

     let backgroundContainerHover = O2NewColors.palette.darkModeBlack.withAlphaComponent(0.05) | O2NewColors.palette.white.withAlphaComponent(0.05)

     let backgroundContainerPressed = O2NewColors.palette.darkModeBlack.withAlphaComponent(0.08) | O2NewColors.palette.white.withAlphaComponent(0.08)

     let backgroundContainerBrand = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            O2NewColors.palette.darkBlue | O2NewColors.palette.darkModeGrey,
            O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeGrey,
            O2NewColors.palette.beyondBlue45 | O2NewColors.palette.darkModeGrey
        ],
        stops: [0,0.64,1],
        angle: 180
    ))

     let backgroundContainerBrandHover = O2NewColors.palette.darkModeBlack.withAlphaComponent(0.2) | O2NewColors.palette.white.withAlphaComponent(0.03)

     let backgroundContainerBrandPressed = O2NewColors.palette.darkModeBlack.withAlphaComponent(0.4) | O2NewColors.palette.white.withAlphaComponent(0.05)

     let backgroundContainerBrandOverInverse = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.darkModeGrey

     let backgroundContainerAlternative = O2NewColors.palette.grey20 | O2NewColors.palette.darkModeGrey

     let backgroundOverlay = O2NewColors.palette.black.withAlphaComponent(0.6) | O2NewColors.palette.darkModeGrey.withAlphaComponent(0.8)

     let backgroundSkeleton = O2NewColors.palette.grey30 | O2NewColors.palette.darkModeGrey6

     let backgroundSkeletonInverse = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.darkModeGrey6

     let backgroundBrandTop = O2NewColors.palette.darkBlue | O2NewColors.palette.darkModeBlack

     let backgroundBrandBottom = O2NewColors.palette.beyondBlue45 | O2NewColors.palette.darkModeBlack

     let appBarBackground = O2NewColors.palette.white | O2NewColors.palette.darkModeGrey

     let navigationBarBackground = O2NewColors.palette.darkBlue | O2NewColors.palette.darkModeBlack

     let skeletonWave = O2NewColors.palette.grey30 | O2NewColors.palette.grey80

     let borderLow = O2NewColors.palette.grey20 | O2NewColors.palette.darkModeBlack

     let border = O2NewColors.palette.grey30 | O2NewColors.palette.darkModeGrey

     let borderHigh = O2NewColors.palette.grey80 | O2NewColors.palette.grey45

     let borderSelected = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let completedStep = O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeBeyondBlue

     let completedStepInverse = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.darkModeBeyondBlue

     let coverBackgroundHover = O2NewColors.palette.darkModeBlack.withAlphaComponent(0.25)

     let coverBackgroundPressed = O2NewColors.palette.darkModeBlack.withAlphaComponent(0.35)

     let buttonDangerBackground = O2NewColors.palette.o2Red60

     let buttonDangerBackgroundPressed = O2NewColors.palette.o2Red65

     let buttonDangerBackgroundHover = O2NewColors.palette.o2Red65

     let buttonLinkDangerBackgroundInverse = O2NewColors.palette.white | O2NewColors.palette.white.withAlphaComponent(0)

     let buttonLinkDangerBackgroundMedia = O2NewColors.palette.white

     let buttonLinkDangerBackgroundPressed = O2NewColors.palette.o2Red10 | O2NewColors.palette.white.withAlphaComponent(0.08)

     let buttonLinkDangerBackgroundInversePressed = O2NewColors.palette.o2Red10 | O2NewColors.palette.white.withAlphaComponent(0.08)

     let buttonLinkDangerBackgroundMediaPressed = O2NewColors.palette.o2Red10

     let buttonLinkBackgroundPressed = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.white.withAlphaComponent(0.08)

     let buttonLinkBackgroundInversePressed = O2NewColors.palette.white.withAlphaComponent(0.08)

     let buttonLinkBackgroundMediaPressed = O2NewColors.palette.white.withAlphaComponent(0.08)

     let buttonPrimaryBackground = O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeBeyondBlue

     let buttonPrimaryBackgroundInverse = O2NewColors.palette.white | O2NewColors.palette.darkModeBeyondBlue

     let buttonPrimaryBackgroundMedia = O2NewColors.palette.white

     let buttonPrimaryBackgroundHover = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.beyondBlue55

     let buttonPrimaryBackgroundInverseHover = O2NewColors.palette.beyondBlue30 | O2NewColors.palette.beyondBlue55

     let buttonPrimaryBackgroundMediaHover = O2NewColors.palette.beyondBlue30

     let buttonPrimaryBackgroundPressed = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.beyondBlue55

     let buttonPrimaryBackgroundInversePressed = O2NewColors.palette.beyondBlue30 | O2NewColors.palette.beyondBlue55

     let buttonPrimaryBackgroundMediaPressed = O2NewColors.palette.beyondBlue30

     let buttonSecondaryBorder = O2NewColors.palette.beyondBlue | O2NewColors.palette.white

     let buttonSecondaryBorderInverse = O2NewColors.palette.white

     let buttonSecondaryBorderMedia = O2NewColors.palette.white

     let buttonSecondaryBorderPressed = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.white

     let buttonSecondaryBorderInversePressed = O2NewColors.palette.beyondBlue30 | O2NewColors.palette.white

     let buttonSecondaryBorderMediaPressed = O2NewColors.palette.beyondBlue30

     let buttonSecondaryBackgroundHover = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.white.withAlphaComponent(0.15)

     let buttonSecondaryBackgroundInverseHover = O2NewColors.palette.white.withAlphaComponent(0.15)

     let buttonSecondaryBackgroundMediaHover = O2NewColors.palette.white.withAlphaComponent(0.15)

     let buttonSecondaryBackgroundPressed = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.white.withAlphaComponent(0.15)

     let buttonSecondaryBackgroundInversePressed = O2NewColors.palette.white.withAlphaComponent(0.15)

     let buttonSecondaryBackgroundMediaPressed = O2NewColors.palette.white.withAlphaComponent(0.15)

     let textButtonPrimary = O2NewColors.palette.white

     let textButtonPrimaryInverse = O2NewColors.palette.beyondBlue | O2NewColors.palette.white

     let textButtonPrimaryMedia = O2NewColors.palette.white

     let textButtonPrimaryInversePressed = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.white

     let textButtonPrimaryMediaPressed = O2NewColors.palette.beyondBlue70

     let textButtonSecondary = O2NewColors.palette.beyondBlue | O2NewColors.palette.grey30

     let textButtonSecondaryInverse = O2NewColors.palette.white | O2NewColors.palette.grey30

     let textButtonSecondaryMedia = O2NewColors.palette.white

     let textButtonSecondaryPressed = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.grey30

     let textButtonSecondaryInversePressed = O2NewColors.palette.white | O2NewColors.palette.grey30

     let textButtonSecondaryMediaPressed = O2NewColors.palette.white

     let textLink = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue40

     let textLinkInverse = O2NewColors.palette.white | O2NewColors.palette.beyondBlue40

     let textLinkMedia = O2NewColors.palette.white

     let textLinkDanger = O2NewColors.palette.o2Red65 | O2NewColors.palette.o2Red45

     let textLinkDangerMedia = O2NewColors.palette.o2Red65

     let textLinkSnackbar = O2NewColors.palette.beyondBlue30

     let textActivated = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let textBrand = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let inputBorder = O2NewColors.palette.grey45

     let inputBorderInverse = O2NewColors.palette.white | O2NewColors.palette.grey45

     let control = O2NewColors.palette.grey45

     let controlActivated = O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeBeyondBlue

     let controlInverse = O2NewColors.palette.white | O2NewColors.palette.grey45

     let controlActivatedInverse = O2NewColors.palette.white | O2NewColors.palette.darkModeBeyondBlue

     let controlError = O2NewColors.palette.o2Red60 | O2NewColors.palette.o2Red45

     let barTrack = O2NewColors.palette.grey30 | O2NewColors.palette.darkModeGrey6

     let barTrackInverse = O2NewColors.palette.white.withAlphaComponent(0.3) | O2NewColors.palette.darkModeGrey6

     let loadingBar = O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeBeyondBlue

     let loadingBarBackground = O2NewColors.palette.grey20 | O2NewColors.palette.darkModeGrey6

     let toggleAndroidInactive = O2NewColors.palette.grey30 | O2NewColors.palette.grey20

     let toggleAndroidBackgroundActive = O2NewColors.palette.beyondBlue15

     let iosControlKnob = O2NewColors.palette.white | O2NewColors.palette.grey30

     let controlKnobInverse = O2NewColors.palette.beyondBlue | O2NewColors.palette.grey30

     let divider = O2NewColors.palette.grey30 | O2NewColors.palette.white.withAlphaComponent(0.1)

     let dividerInverse = O2NewColors.palette.white.withAlphaComponent(0.2) | O2NewColors.palette.white.withAlphaComponent(0.1)

     let navigationBarDivider = O2NewColors.palette.darkBlue | O2NewColors.palette.darkModeBlack

     let badge = O2NewColors.palette.o2Red65

     let feedbackErrorBackground = O2NewColors.palette.o2Red60

     let feedbackInfoBackground = O2NewColors.palette.black | O2NewColors.palette.darkModeGrey6

     let brand = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let brandHigh = O2NewColors.palette.beyondBlue70 | O2NewColors.palette.white.withAlphaComponent(0.05)

     let inverse = O2NewColors.palette.white | O2NewColors.palette.grey30

     let neutralHigh = O2NewColors.palette.black | O2NewColors.palette.grey30

     let neutralMedium = O2NewColors.palette.grey60

     let neutralMediumInverse = O2NewColors.palette.grey60

     let neutralLow = O2NewColors.palette.grey20 | O2NewColors.palette.darkModeGrey6

     let neutralLowAlternative = O2NewColors.palette.grey30 | O2NewColors.palette.darkModeGrey6

     let textPrimary = O2NewColors.palette.black | O2NewColors.palette.grey30

     let textPrimaryInverse = O2NewColors.palette.white | O2NewColors.palette.grey30

     let textPrimaryMedia = O2NewColors.palette.white

     let textSecondary = O2NewColors.palette.grey60 | O2NewColors.palette.grey45

     let textSecondaryInverse = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.grey45

     let textSecondaryMedia = O2NewColors.palette.white

     let error = O2NewColors.palette.o2Red65 | O2NewColors.palette.o2Red45

     let textError = O2NewColors.palette.o2Red65 | O2NewColors.palette.o2Red45

     let textErrorInverse = O2NewColors.palette.white | O2NewColors.palette.o2Red45

     let success = O2NewColors.palette.o2Green

     let warning = O2NewColors.palette.o2Orange60 | O2NewColors.palette.o2Orange

     let promo = O2NewColors.palette.o2Pink

     let highlight = O2NewColors.palette.o2Pink80 | O2NewColors.palette.o2Pink

     let successLow = O2NewColors.palette.o2Green10 | O2NewColors.palette.darkModeGrey6

     let warningLow = O2NewColors.palette.o2Orange10 | O2NewColors.palette.darkModeGrey6

     let errorLow = O2NewColors.palette.o2Red10 | O2NewColors.palette.darkModeGrey6

     let promoLow = O2NewColors.palette.o2Pink15 | O2NewColors.palette.darkModeGrey6

     let brandLow = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.darkModeGrey6

     let successHigh = O2NewColors.palette.o2Green80 | O2NewColors.palette.o2Green40

     let warningHigh = O2NewColors.palette.o2Orange75 | O2NewColors.palette.o2Orange40

     let errorHigh = O2NewColors.palette.o2Red65 | O2NewColors.palette.o2Red40

     let promoHigh = O2NewColors.palette.o2Pink80 | O2NewColors.palette.o2Pink30

     let successHighInverse = O2NewColors.palette.o2Green80

     let warningHighInverse = O2NewColors.palette.o2Orange75

     let errorHighInverse = O2NewColors.palette.o2Red65

     let promoHighInverse = O2NewColors.palette.o2Pink80 | O2NewColors.palette.o2Pink

     let textNavigationBarPrimary = O2NewColors.palette.white | O2NewColors.palette.grey30

     let textNavigationBarSecondary = O2NewColors.palette.beyondBlue30 | O2NewColors.palette.grey45

     let textNavigationSearchBarHint = O2NewColors.palette.beyondBlue30 | O2NewColors.palette.grey45

     let textNavigationSearchBarText = O2NewColors.palette.white | O2NewColors.palette.grey30

     let textAppBar = O2NewColors.palette.grey60 | O2NewColors.palette.grey45

     let textAppBarSelected = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue40

     let customTabsBackground = O2NewColors.palette.beyondBlue | O2NewColors.palette.darkModeBlack

     let tagTextPromo = O2NewColors.palette.o2Pink80 | O2NewColors.palette.o2Pink

     let tagTextActive = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let tagTextInactive = O2NewColors.palette.grey60 | O2NewColors.palette.grey40

     let tagTextInfo = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let tagTextSuccess = O2NewColors.palette.o2Green80 | O2NewColors.palette.o2Green

     let tagTextWarning = O2NewColors.palette.o2Orange75 | O2NewColors.palette.o2Orange

     let tagTextError = O2NewColors.palette.o2Red65 | O2NewColors.palette.o2Red45

     let tagBackgroundPromo = O2NewColors.palette.o2Pink15 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundActive = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundInactive = O2NewColors.palette.grey20 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundInfo = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundSuccess = O2NewColors.palette.o2Green10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundWarning = O2NewColors.palette.o2Orange10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundError = O2NewColors.palette.o2Red10 | O2NewColors.palette.darkModeGrey6

     let tagTextPromoInverse = O2NewColors.palette.o2Pink80 | O2NewColors.palette.o2Pink

     let tagTextActiveInverse = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let tagTextInactiveInverse = O2NewColors.palette.grey60 | O2NewColors.palette.grey40

     let tagTextInfoInverse = O2NewColors.palette.beyondBlue | O2NewColors.palette.beyondBlue30

     let tagTextSuccessInverse = O2NewColors.palette.o2Green80 | O2NewColors.palette.o2Green

     let tagTextWarningInverse = O2NewColors.palette.o2Orange75 | O2NewColors.palette.o2Orange

     let tagTextErrorInverse = O2NewColors.palette.o2Red65 | O2NewColors.palette.o2Red45

     let tagBackgroundPromoInverse = O2NewColors.palette.o2Pink15 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundActiveInverse = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundInactiveInverse = O2NewColors.palette.grey20 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundInfoInverse = O2NewColors.palette.beyondBlue10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundSuccessInverse = O2NewColors.palette.o2Green10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundWarningInverse = O2NewColors.palette.o2Orange10 | O2NewColors.palette.darkModeGrey6

     let tagBackgroundErrorInverse = O2NewColors.palette.o2Red10 | O2NewColors.palette.darkModeGrey6

     let cardContentOverlay = MisticaColor.gradient(MisticaGradient(
        colors:
        [
            O2NewColors.palette.black.withAlphaComponent(0),
            O2NewColors.palette.black.withAlphaComponent(0.4),
            O2NewColors.palette.black.withAlphaComponent(0.7)
        ],
        stops: [0,0.3,1],
        angle: 180
    ))

     let cardFooterOverlay = O2NewColors.palette.black.withAlphaComponent(0.7)
}

public struct O2NewColorPalette: Sendable {
    public init() {}
    public let beyondBlue = UIColor(hex: "#0050FF")!
    public let beyondBlue10 = UIColor(hex: "#E5EDFF")!
    public let beyondBlue15 = UIColor(hex: "#CCDCFF")!
    public let beyondBlue30 = UIColor(hex: "#80A7FF")!
    public let beyondBlue40 = UIColor(hex: "#4D84FF")!
    public let beyondBlue45 = UIColor(hex: "#0A73EB")!
    public let beyondBlue55 = UIColor(hex: "#0044D9")!
    public let beyondBlue70 = UIColor(hex: "#0038B2")!
    public let beyondBlue90 = UIColor(hex: "#001033")!
    public let darkBlue = UIColor(hex: "#00008C")!
    public let o2BlueLight = UIColor(hex: "#82DCFA")!
    public let o2BlueLight30 = UIColor(hex: "#C0EEFD")!
    public let o2BlueLight35 = UIColor(hex: "#B4EAFC")!
    public let o2Green = UIColor(hex: "#00DC7D")!
    public let o2Green10 = UIColor(hex: "#E5FBF2")!
    public let o2Green40 = UIColor(hex: "#4CE7A4")!
    public let o2Green80 = UIColor(hex: "#006338")!
    public let o2Yellow = UIColor(hex: "#FADC00")!
    public let o2Orange = UIColor(hex: "#FFA55A")!
    public let o2Orange10 = UIColor(hex: "#FFF6EE")!
    public let o2Orange40 = UIColor(hex: "#FFC08B")!
    public let o2Orange60 = UIColor(hex: "#F06C00")!
    public let o2Orange75 = UIColor(hex: "#996336")!
    public let o2Pink = UIColor(hex: "#FA96FF")!
    public let o2Pink15 = UIColor(hex: "#FEEAFF")!
    public let o2Pink30 = UIColor(hex: "#FDCAFF")!
    public let o2Pink80 = UIColor(hex: "#704373")!
    public let o2Red = UIColor(hex: "#FF5A5A")!
    public let o2Red10 = UIColor(hex: "#FFEEEE")!
    public let o2Red20 = UIColor(hex: "#FFCDCD")!
    public let o2Red40 = UIColor(hex: "#FF8B8B")!
    public let o2Red45 = UIColor(hex: "#FF7B7B")!
    public let o2Red60 = UIColor(hex: "#CC4848")!
    public let o2Red65 = UIColor(hex: "#BF4444")!
    public let grey20 = UIColor(hex: "#F3F3F5")!
    public let grey30 = UIColor(hex: "#D9D9DD")!
    public let grey40 = UIColor(hex: "#B4B4BE")!
    public let grey45 = UIColor(hex: "#8A8A98")!
    public let grey60 = UIColor(hex: "#6E6E77")!
    public let grey80 = UIColor(hex: "#3C3C46")!
    public let black = UIColor(hex: "#00001E")!
    public let white = UIColor(hex: "#FFFFFF")!
    public let darkModeBlack = UIColor(hex: "#00001C")!
    public let darkModeGrey = UIColor(hex: "#08132B")!
    public let darkModeGrey6 = UIColor(hex: "#14213D")!
    public let darkModeBeyondBlue = UIColor(hex: "#1A62FF")!
}