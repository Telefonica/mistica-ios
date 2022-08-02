//
//  TextInput.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

protocol TextInput: UITextInput {
    var content: String? { get set }
    var font: UIFont? { get set }
    var textAlignment: NSTextAlignment { get set }
    var textColor: UIColor? { get set }
    var autocorrectionType: UITextAutocorrectionType { get set }
    var keyboardType: UIKeyboardType { get set }
    var isSecureTextEntry: Bool { get set }
    var inputView: UIView? { get set }
    var inputAccessoryView: UIView? { get set }
    var isEnabled: Bool { get set }
    var returnKeyType: UIReturnKeyType { get set }
    var autocapitalizationType: UITextAutocapitalizationType { get set }
}

extension UITextField: TextInput {
    var content: String? {
        get { text }
        set { text = newValue }
    }
}

extension UITextView: TextInput {
    var isEnabled: Bool {
        get { isUserInteractionEnabled }
        set { isUserInteractionEnabled = newValue }
    }

    var content: String? {
        get { text }
        set { text = newValue }
    }
}
