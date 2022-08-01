//
//  PasswordInputFieldValidationStrategy.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

public class PasswordInputFieldValidationStrategy: InputFieldValidationStrategy {
    enum Constants {
        static let minPasswordLength = 8
    }

    public var failureMessage: String

    private init() {
        fatalError("Init constructor is not allowed")
    }

    public init(failureMessage: String) {
        self.failureMessage = failureMessage
    }

    public func validate(text: String?) -> InputFieldValidationResult {
        let passwordLength = text?.count ?? 0

        let result: InputFieldValidationResult

        if passwordLength < Constants.minPasswordLength {
            result = .failure(message: failureMessage)
        } else {
            result = .success
        }

        return result
    }
}
