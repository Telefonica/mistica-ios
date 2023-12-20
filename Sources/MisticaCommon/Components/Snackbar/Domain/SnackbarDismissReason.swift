//
//  SnackbarDismissReason.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

@objc public enum SnackbarDismissReason: Int, RawRepresentable {
    case dismiss
    case button
    case timeout

    public typealias RawValue = String

    public var rawValue: RawValue {
        switch self {
        case .dismiss:
            return "DISMISS"
        case .button:
            return "BUTTON"
        case .timeout:
            return "TIMEOUT"
        }
    }

    public init?(rawValue: RawValue) {
        switch rawValue {
        case "DISMISS":
            self = .dismiss
        case "BUTTON":
            self = .button
        case "TIMEOUT":
            self = .timeout
        default:
            return nil
        }
    }
}
