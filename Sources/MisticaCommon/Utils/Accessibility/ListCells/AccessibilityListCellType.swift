//
//  AccessibilityListCellType.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum AccessibilityListCellType {
    case interactive(AccessibilityListCellInteractiveData)
    case doubleInteraction(AccessibilityListCellInteractiveData)
    case informative
    case customInformative(String)

    public static var `default`: AccessibilityListCellType = .interactive(.default)
}
