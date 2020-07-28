//
//  PasswordInputFieldValidationStrategy.swift
//  Mistica
//
//  Created by jmpuerta on 13/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public class PasswordInputFieldValidationStrategy: InputFieldValidationStrategy {
    enum Constants {
        static let minPasswordLength = 8
    }

    public init() {}

    public func validate(text: String?) -> InputFieldValidationResult {
        let passwordLength = text?.count ?? 0

        let result: InputFieldValidationResult

        if passwordLength < Constants.minPasswordLength {
            result = .failure(message: Translations.passwordTooShortError)
        } else {
            result = .success
        }

        return result
    }
}
