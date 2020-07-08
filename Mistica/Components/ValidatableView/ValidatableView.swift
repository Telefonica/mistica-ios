//
//  ValidatableView.swift
//  Mistica
//
//  Created by cestebanez on 23/03/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public protocol Validatable: AnyObject {
	func isValid() -> Bool
	func validate()
}

typealias ValidatableView = UIView & Validatable
typealias ValidatableInputField = InputField & Validatable
