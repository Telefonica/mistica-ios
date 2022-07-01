//
//  InputFieldStyle+Toolkit.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Shared

public extension InputField.Style {
    private static var primaryStateStyleByState: [InputField.State: InputField.StateStyle] {
        [
            .normal: InputField.StateStyle(placeholderTextColor: .textSecondary, assistiveTextColor: .textSecondary, textColor: .textPrimary, editingPlaceholderTextColor: .controlActivated),
            .invalid: InputField.StateStyle(placeholderTextColor: .error, assistiveTextColor: .error, textColor: .textPrimary, editingPlaceholderTextColor: .error),
            .disabled: InputField.StateStyle(placeholderTextColor: .textSecondary, assistiveTextColor: .textSecondary, textColor: .textDisabled, editingPlaceholderTextColor: .textSecondary)
        ]
    }

    private static var inverseStateStyleByState: [InputField.State: InputField.StateStyle] {
        [
            .normal: InputField.StateStyle(placeholderTextColor: .textSecondary, assistiveTextColor: .textPrimaryInverse, textColor: .textPrimary, editingPlaceholderTextColor: .controlActivated),
            .invalid: InputField.StateStyle(placeholderTextColor: .error, assistiveTextColor: .textPrimaryInverse, textColor: .textPrimary, editingPlaceholderTextColor: .error),
            .disabled: InputField.StateStyle(placeholderTextColor: .textSecondary, assistiveTextColor: .textPrimaryInverse, textColor: .textDisabled, editingPlaceholderTextColor: .textSecondary)
        ]
    }

    static var `default`: InputField.Style {
        InputField.Style(
            stateStyleByState: primaryStateStyleByState,
            secureTextEntry: .disabled,
            textInputStyle: .textField,
            textInputKeyboardStyle: .keyboard(type: .default, textAutocorrectionType: .yes, textAutocapitalizationType: .none),
            leadingSideItem: .none,
            traillingSideItem: .none
        )
    }

    static var inverse: InputField.Style {
        InputField.Style(
            stateStyleByState: inverseStateStyleByState,
            secureTextEntry: .disabled,
            textInputStyle: .textField,
            textInputKeyboardStyle: .keyboard(type: .default, textAutocorrectionType: .yes, textAutocapitalizationType: .none),
            leadingSideItem: .none,
            traillingSideItem: .none
        )
    }

    static var multiline: InputField.Style {
        InputField.Style(
            stateStyleByState: primaryStateStyleByState,
            secureTextEntry: .disabled,
            textInputStyle: .textView,
            textInputKeyboardStyle: .keyboard(type: .default, textAutocorrectionType: .yes, textAutocapitalizationType: .none),
            leadingSideItem: .none,
            traillingSideItem: .none
        )
    }

    static var email: InputField.Style {
        InputField.Style(
            stateStyleByState: primaryStateStyleByState,
            secureTextEntry: .disabled,
            textInputStyle: .textField,
            textInputKeyboardStyle: .keyboard(type: .emailAddress, textAutocorrectionType: .yes, textAutocapitalizationType: .none),
            leadingSideItem: .none,
            traillingSideItem: .none
        )
    }

    static var password: InputField.Style {
        InputField.Style(
            stateStyleByState: primaryStateStyleByState,
            secureTextEntry: .enabled,
            textInputStyle: .textField,
            textInputKeyboardStyle: .keyboard(type: .default, textAutocorrectionType: .no, textAutocapitalizationType: .none),
            leadingSideItem: .none,
            traillingSideItem: .secureEntry
        )
    }

    static var phoneNumber: InputField.Style {
        InputField.Style(
            stateStyleByState: primaryStateStyleByState,
            secureTextEntry: .disabled,
            textInputStyle: .textField,
            textInputKeyboardStyle: .keyboard(type: .phonePad, textAutocorrectionType: .no, textAutocapitalizationType: .none),
            leadingSideItem: .none,
            traillingSideItem: .none
        )
    }

    static var dropdown: InputField.Style {
        InputField.Style(
            stateStyleByState: primaryStateStyleByState,
            secureTextEntry: .disabled,
            textInputStyle: .textField,
            textInputKeyboardStyle: .picker,
            leadingSideItem: .none,
            traillingSideItem: .picker
        )
    }
}
