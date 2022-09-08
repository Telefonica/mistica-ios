//
//  CatalogRow.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaCommon
import UIKit

enum CatalogRow: Int, CaseIterable, Identifiable {
    case badge
	case bottomSheet
    case buttons
    case cards
    case controls
    case crouton
    case chips
    case carousel
    case feedbacks
    case forms
    case header
    case inputFields
    case lists
    case scrollContentIndicator
    case title
    case filter
    case stepper
    case tabs
    case tag
    case tooltip
    case viewStates
    case callout
    case emptyState

    var id: Int {
        rawValue
    }
}

extension CatalogRow {
    var title: String {
        switch self {
        case .buttons:
            return "Buttons"
        case .feedbacks:
            return "Feedbacks"
        case .crouton:
            return "Crouton"
        case .filter:
            return "Scrollable Segmented Control"
        case .tooltip:
            return "Popover"
        case .viewStates:
            return "View States"
        case .badge:
            return "Badge"
        case .inputFields:
            return "InputFields"
        case .forms:
            return "Forms"
        case .scrollContentIndicator:
            return "Scroll Content Indicator"
        case .tag:
            return "Tags"
        case .lists:
            return "Lists"
        case .title:
            return "Title"
        case .header:
            return "Headers"
        case .controls:
            return "Controls"
        case .cards:
            return "Cards"
        case .stepper:
            return "Stepper"
        case .tabs:
            return "Tabs"
        case .callout:
            return "Callout"
        case .emptyState:
            return "Empty State"
        case .chips:
            return "Chips"
        case .carousel:
            return "Carousel"
		case .bottomSheet:
			return "Bottom sheet"
        }
    }

    var icon: UIImage {
        switch self {
        case .buttons:
            return .buttonsIcon
        case .feedbacks:
            return .feedbacksIcon
        case .crouton:
            return .croutonIcon
        case .filter:
            return .filterIcon
        case .tooltip:
            return .popoverIcon
        case .viewStates:
            return .viewStatesIcon
        case .badge:
            return .badgeIcon
        case .inputFields:
            return .inputFieldsIcon
        case .forms:
            return .inputFieldsIcon
        case .scrollContentIndicator:
            return .scrollContentIndicatorIcon
        case .tag:
            return .tagsIcon
        case .lists:
            return .listIcon
        case .title:
            return .sectionTitleIcon
        case .header:
            return .headerIcon
        case .controls:
            return .controlsIcon
        case .cards:
            return .cardIcon
        case .stepper:
            return .stepperIcon
        case .tabs:
            return .tabsIcon
        case .callout:
            return .calloutIcon
        case .emptyState:
            return .emptyStateIcon
        case .chips:
            return .tagsIcon
        case .carousel:
            return .listIcon
		case .bottomSheet:
			return .bottomSheet
        }
    }
}
