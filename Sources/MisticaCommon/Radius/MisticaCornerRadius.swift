//
//  MisticaCornerRadius.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public enum MisticaRadiusConstants {
    static let roundedRadius: CGFloat = 999.0
}

public protocol MisticaCornerRadius: Sendable {
    var avatar: CGFloat { get }
    var bar: CGFloat { get }
    var button: CGFloat { get }
    var checkbox: CGFloat { get }
    var container: CGFloat { get }
    var indicator: CGFloat { get }
    var input: CGFloat { get }
    var legacyDisplay: CGFloat { get }
    var popup: CGFloat { get }
    var sheet: CGFloat { get }
    var mediaSmall: CGFloat { get }
}
