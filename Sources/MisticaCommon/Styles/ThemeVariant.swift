//
//  ThemeVariant.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

@frozen
public enum ThemeVariant: String, CaseIterable {
    case standard
    case prominent
}

public extension Notification.Name {
    static let themeVariantDidChange = Notification.Name("mistica.themeVariantDidChange")
}
