//
//  InputFieldValidationStrategy.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

@frozen
public enum InputFieldValidationResult: Equatable {
    case success
    case failure(message: String)
}

public protocol InputFieldValidationStrategy {
    func validate(text: String?) -> InputFieldValidationResult
}
