//
//  PhoneNumberInputFieldValidationStrategy.swift
//  Mistica
//
//  Created by jmpuerta on 20/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public class PhoneNumberInputFieldValidationStrategy: InputFieldValidationStrategy {
	public init() {}

	public func validate(text: String?) -> InputFieldValidationResult {
		let result: InputFieldValidationResult

		if text?.looksLikeAPhoneNumber == true {
			result = .success
		} else {
			result = .failure(message: MisticaTranslations.malformedPhoneErrorMessage)
		}

		return result
	}
}

@objc public extension InputField {
	func objc_setPhoneNumberInputFieldValidationStrategy() {
		validationStrategy = PhoneNumberInputFieldValidationStrategy()
	}
}
