//
//  ValidatableView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public protocol Validatable: AnyObject {
    func isValid() -> Bool
    func validate()
}

public typealias ValidatableView = UIView & Validatable
