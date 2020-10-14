//
//  PhoneNumberInputFieldValidationStrategy.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation

public class PhoneNumberInputFieldValidationStrategy: InputFieldValidationStrategy {
    public var failureMessage: String

    private init() {
        fatalError("Init constructor is not allowed")
    }

    public init(failureMessage: String) {
        self.failureMessage = failureMessage
    }

    public func validate(text: String?) -> InputFieldValidationResult {
        let result: InputFieldValidationResult

        if text?.looksLikeAPhoneNumber == true {
            result = .success
        } else {
            result = .failure(message: failureMessage)
        }

        return result
    }
}
