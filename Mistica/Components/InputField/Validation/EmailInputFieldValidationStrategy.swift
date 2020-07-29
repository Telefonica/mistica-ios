//
//  EmailInputFieldValidationStrategy.swift
//  Mistica
//
//  Created by jmpuerta on 13/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public class EmailInputFieldValidationStrategy: InputFieldValidationStrategy {
    public var failureMessage: String

    private init() {
        fatalError("Init constructor is not allowed")
    }

    public init(failureMessage: String) {
        self.failureMessage = failureMessage
    }

    public func validate(text: String?) -> InputFieldValidationResult {
        let result: InputFieldValidationResult

        if text?.looksLikeAnEmail == true {
            result = .success
        } else {
            result = .failure(message: failureMessage)
        }

        return result
    }
}
