//
//  EmailInputFieldValidationStrategy.swift
//  Mistica
//
//  Created by jmpuerta on 13/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public class EmailInputFieldValidationStrategy: InputFieldValidationStrategy {
	public init() {}

	public func validate(text: String?) -> InputFieldValidationResult {
		let result: InputFieldValidationResult

		if text?.looksLikeAnEmail == true {
			result = .success
		} else {
			result = .failure(message: PersonalDataTranslations.changeEmailMalformedMailError)
		}

		return result
	}
}
