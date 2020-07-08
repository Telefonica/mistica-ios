//
//  InputFieldValidationStrategy.swift
//  Mistica
//
//  Created by jmpuerta on 13/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation

public enum InputFieldValidationResult: Equatable {
	case success
	case failure(message: String)
}

public protocol InputFieldValidationStrategy {
	func validate(text: String?) -> InputFieldValidationResult
}
