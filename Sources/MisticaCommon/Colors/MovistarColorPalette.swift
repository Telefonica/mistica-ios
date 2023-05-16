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
	let backgroundBrand = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack
	let backgroundBrandSecondary = MovistarColors.palette.movistarBlueDark | MovistarColors.palette.darkModeBlack
	let backgroundContainer = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey
	let backgroundContainerHover = MovistarColors.palette.grey0 | MovistarColors.palette.darkModeGrey7
	let backgroundContainerPressed = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeGrey8
	let backgroundContainerBrand = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeGrey
	let backgroundContainerBrandHover = MovistarColors.palette.movistarBlue50 | MovistarColors.palette.darkModeGrey7
	let backgroundContainerBrandPressed = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey8
	let backgroundContainerBrandOverInverse = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey
	let backgroundContainerBrandOverInverseHover = MovistarColors.palette.movistarBlue60 | MovistarColors.palette.darkModeGrey7
	let backgroundContainerBrandOverInversePressed = MovistarColors.palette.movistarBlue70 | MovistarColors.palette.darkModeGrey8
	let backgroundContainerAlternative = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeGrey
	let backgroundContainerAlternativeHover = MovistarColors.palette.grey5.withAlphaComponent(0.1) | MovistarColors.palette.darkModeGrey7
	let backgroundContainerAlternativePressed = MovistarColors.palette.grey5.withAlphaComponent(0.2) | MovistarColors.palette.darkModeGrey8
	let backgroundOverlay = MovistarColors.palette.movistarBlueDark.withAlphaComponent(0.6) | MovistarColors.palette.darkModeGrey.withAlphaComponent(0.8)
	let backgroundSkeleton = MovistarColors.palette.grey2 | MovistarColors.palette.movistarBlueDark
	let backgroundSkeletonInverse = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.movistarBlueDark
	let backgroundFeedbackBottom = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack
	let appBarBackground = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey
	let navigationBarBackground = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack
	let skeletonWave = MovistarColors.palette.grey2 | MovistarColors.palette.darkModeGrey6
	let borderLow = MovistarColors.palette.grey1 | MovistarColors.palette.darkModeBlack
	let border = MovistarColors.palette.grey3 | MovistarColors.palette.darkModeGrey
	let borderHigh = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey4
	let borderSelected = MovistarColors.palette.movistarBlue
	let buttonDangerBackground = MovistarColors.palette.pepper
	let buttonDangerBackgroundSelected = MovistarColors.palette.pepper55
	let buttonDangerBackgroundHover = MovistarColors.palette.pepper55
	let buttonLinkBackgroundSelected = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.white.withAlphaComponent(0.08)
	let buttonLinkBackgroundInverseSelected = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.08)
	let buttonPrimaryBackground = MovistarColors.palette.movistarBlue
	let buttonPrimaryBackgroundInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlue
	let buttonPrimaryBackgroundSelected = MovistarColors.palette.movistarBlue55
	let buttonPrimaryBackgroundHover = MovistarColors.palette.movistarBlue55
	let buttonPrimaryBackgroundInverseSelected = MovistarColors.palette.movistarBlue30 | MovistarColors.palette.movistarBlue55
	let buttonSecondaryBorder = MovistarColors.palette.movistarBlue | MovistarColors.palette.white
	let buttonSecondaryBorderSelected = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.white
	let buttonSecondaryBackgroundHover = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.white.withAlphaComponent(0.15)
	let buttonSecondaryBackgroundSelected = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.white.withAlphaComponent(0.15)
	let buttonSecondaryBorderInverse = MovistarColors.palette.white
	let buttonSecondaryBorderInverseSelected = MovistarColors.palette.white
	let buttonSecondaryBackgroundInverseHover = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.15)
	let buttonSecondaryBackgroundInverseSelected = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.15)
	let textButtonPrimary = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2
	let textButtonPrimaryInverse = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeGrey2
	let textButtonPrimaryInverseSelected = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeGrey2
	let textButtonSecondary = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeGrey2
	let textButtonSecondarySelected = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey4
	let textButtonSecondaryInverse = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2
	let textButtonSecondaryInverseSelected = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey4
	let textLink = MovistarColors.palette.movistarBlue
	let textLinkInverse = MovistarColors.palette.white | MovistarColors.palette.movistarBlue
	let textLinkDanger = MovistarColors.palette.pepper
	let textLinkSnackbar = MovistarColors.palette.movistarBlue30
	let control = MovistarColors.palette.grey3 | MovistarColors.palette.darkModeGrey6
	let controlActivated = MovistarColors.palette.movistarBlue
	let controlError = MovistarColors.palette.pepper
	let loadingBar = MovistarColors.palette.movistarBlue30 | MovistarColors.palette.movistarBlue
	let loadingBarBackground = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey6
	let toggleAndroidInactive = MovistarColors.palette.grey2 | MovistarColors.palette.darkModeGrey4
	let toggleAndroidBackgroundActive = MovistarColors.palette.movistarBlue20
	let iosControlKnob = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2
	let divider = MovistarColors.palette.grey2 | MovistarColors.palette.white.withAlphaComponent(0.05)
	let dividerInverse = MovistarColors.palette.white.withAlphaComponent(0.2) | MovistarColors.palette.white.withAlphaComponent(0.05)
	let navigationBarDivider = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack
	let badge = MovistarColors.palette.pepper55
	let feedbackErrorBackground = MovistarColors.palette.pepper
	let feedbackInfoBackground = MovistarColors.palette.movistarBlueDark
	let brand = MovistarColors.palette.movistarBlue
	let brandHigh = MovistarColors.palette.movistarBlue55 | MovistarColors.palette.darkModeGrey
	let inverse = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2
	let neutralHigh = MovistarColors.palette.movistarBlueDark | MovistarColors.palette.darkModeGrey2
	let neutralMedium = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey5
	let neutralMediumInverse = MovistarColors.palette.grey5
	let neutralLow = MovistarColors.palette.grey1 | MovistarColors.palette.movistarBlueDark
	let neutralLowAlternative = MovistarColors.palette.grey2 | MovistarColors.palette.movistarBlueDark
	let textPrimary = MovistarColors.palette.movistarBlueDark | MovistarColors.palette.darkModeGrey2
	let textPrimaryInverse = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2
	let textSecondary = MovistarColors.palette.grey5 | MovistarColors.palette.darkModeGrey4
	let textSecondaryInverse = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.darkModeGrey4
	let success = MovistarColors.palette.movistarGreen
	let warning = MovistarColors.palette.egg
	let error = MovistarColors.palette.pepper
	let promo = MovistarColors.palette.purple
	let highlight = MovistarColors.palette.pink
	let successLow = MovistarColors.palette.movistarGreen10 | MovistarColors.palette.movistarBlueDark
	let warningLow = MovistarColors.palette.egg10 | MovistarColors.palette.movistarBlueDark
	let errorLow = MovistarColors.palette.pepper10 | MovistarColors.palette.movistarBlueDark
	let promoLow = MovistarColors.palette.purple10 | MovistarColors.palette.movistarBlueDark
	let brandLow = MovistarColors.palette.movistarBlue10 | MovistarColors.palette.movistarBlueDark
	let successHigh = MovistarColors.palette.movistarGreen70 | MovistarColors.palette.movistarGreen40
	let warningHigh = MovistarColors.palette.egg80 | MovistarColors.palette.egg40
	let errorHigh = MovistarColors.palette.pepper70 | MovistarColors.palette.pepper40
	let promoHigh = MovistarColors.palette.purple70 | MovistarColors.palette.purple40
	let successHighInverse = MovistarColors.palette.movistarGreen70
	let warningHighInverse = MovistarColors.palette.egg80
	let errorHighInverse = MovistarColors.palette.pepper70
	let promoHighInverse = MovistarColors.palette.purple70
	let textNavigationBarPrimary = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2
	let textNavigationBarSecondary = MovistarColors.palette.movistarBlue20 | MovistarColors.palette.darkModeGrey4
	let textNavigationSearchBarHint = MovistarColors.palette.movistarBlue20 | MovistarColors.palette.darkModeGrey4
	let textNavigationSearchBarText = MovistarColors.palette.white | MovistarColors.palette.darkModeGrey2
	let textAppBar = MovistarColors.palette.grey4 | MovistarColors.palette.darkModeGrey5
	let textAppBarSelected = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeGrey2
	let customTabsBackground = MovistarColors.palette.movistarBlue | MovistarColors.palette.darkModeBlack
}

public struct MovistarColorPalette {
	public init() {}
	public let movistarBlue = UIColor(hex:"#019DF4")!
	public let movistarBlue10 = UIColor(hex:"#E6F5FD")!
	public let movistarBlue20 = UIColor(hex:"#B3E1FB")!
	public let movistarBlue30 = UIColor(hex:"#80CEF9")!
	public let movistarBlue40 = UIColor(hex:"#4DBAF7")!
	public let movistarBlue50 = UIColor(hex:"#0195E4")!
	public let movistarBlue55 = UIColor(hex:"#008EDD")!
	public let movistarBlue60 = UIColor(hex:"#0085CC")!
	public let movistarBlue70 = UIColor(hex:"#0074B3")!
	public let movistarGreen = UIColor(hex:"#5CB615")!
	public let movistarGreen10 = UIColor(hex:"#EFF8E8")!
	public let movistarGreen40 = UIColor(hex:"#8DCC5B")!
	public let movistarGreen70 = UIColor(hex:"#407F0F")!
	public let pepper = UIColor(hex:"#FF374A")!
	public let pepper10 = UIColor(hex:"#FFEBED")!
	public let pepper40 = UIColor(hex:"#FF7380")!
	public let pepper55 = UIColor(hex:"#D73241")!
	public let pepper70 = UIColor(hex:"#B22634")!
	public let egg = UIColor(hex:"#F28D15")!
	public let egg10 = UIColor(hex:"#FEF4E8")!
	public let egg40 = UIColor(hex:"#F6AF5B")!
	public let egg80 = UIColor(hex:"#6D3F09")!
	public let pink = UIColor(hex:"#E63780")!
	public let purple = UIColor(hex:"#A13EA1")!
	public let purple10 = UIColor(hex:"#F6ECF6")!
	public let purple40 = UIColor(hex:"#BD78BD")!
	public let purple70 = UIColor(hex:"#712B71")!
	public let grey0 = UIColor(hex:"#fafafa")!
	public let grey1 = UIColor(hex:"#F6F6F6")!
	public let grey2 = UIColor(hex:"#EEEEEE")!
	public let grey3 = UIColor(hex:"#DDDDDD")!
	public let grey4 = UIColor(hex:"#999999")!
	public let grey5 = UIColor(hex:"#86888C")!
	public let grey6 = UIColor(hex:"#313235")!
	public let white = UIColor(hex:"#FFFFFF")!
	public let movistarBlueDark = UIColor(hex:"#0B2739")!
	public let darkModeBlack = UIColor(hex:"#061824")!
	public let darkModeGrey = UIColor(hex:"#081F2E")!
	public let darkModeGrey2 = UIColor(hex:"#EAEBEE")!
	public let darkModeGrey3 = UIColor(hex:"#CED4D7")!
	public let darkModeGrey4 = UIColor(hex:"#85939C")!
	public let darkModeGrey5 = UIColor(hex:"#6D7D88")!
	public let darkModeGrey6 = UIColor(hex:"#3C5261")!
	public let darkModeGrey7 = UIColor(hex:"#112E41")!
	public let darkModeGrey8 = UIColor(hex:"#1C3B4F")!
}