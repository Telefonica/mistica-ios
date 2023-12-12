//
//  SnackbarDismissReason.swift
//
//
//  Created by Jose Manuel Rodriguez Moreno on 5/12/23.
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
