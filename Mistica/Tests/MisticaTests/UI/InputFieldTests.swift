//
//  InputFieldTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class InputFieldTests: XCTestCase {
    private enum Constants {
        static let defaultTextValue = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    }
    
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)
        
        isRecording = false
    }
    
    // MARK: - Styles
    
    func testInputFieldWithDefaultStyleAndAllStates() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeInputFieldWithAllStates(
                withStyle: .default,
                placeholderText: "Default"
            )
        )
    }
    
    func testInputFieldWithEmailStyleAndAllStates() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeInputFieldWithEmailStyleAndAllStates()
        )
    }
    
    func testInputFieldWithPasswordStyleAndAllStates() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeInputFieldWithPasswordStyleAndAllStates()
        )
    }
    
    func testInputFieldWithPhoneNumberStyleAndAllStates() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeInputFieldWithPhoneNumberStyleAndAllStates()
        )
    }
    
    func testInputFieldWithDropdownStyleAndAllStates() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeInputFieldWithDropdownStyleAndAllStates()
        )
    }
    
    func testInputFieldWithMultilineStyleAndAllStates() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeInputFieldWithMultilineStyleAndAllStates()
        )
    }
    
    func testInputFieldWithInverseStyleAndAllStates() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeInputFieldWithInverseStyleAndAllStates()
        )
    }
}

// MARK: - Helpers

private extension InputFieldTests {
    func makeInputFieldWithEmailStyleAndAllStates() -> UIStackView {
        let emailStrategy = EmailInputFieldValidationStrategy(failureMessage: "Hmm, looks like the email is written incorrectly")
        return makeInputFieldWithAllStates(withStyle: .email,
                                           placeholderText: "Email",
                                           validationStrategy: emailStrategy)
    }
    
    func makeInputFieldWithPasswordStyleAndAllStates() -> UIStackView {
        let passwordStrategy = PasswordInputFieldValidationStrategy(failureMessage: "Oops! That's too short. It has to have at lest 8 characters")
        return makeInputFieldWithAllStates(withStyle: .password,
                                           placeholderText: "Password",
                                           validationStrategy: passwordStrategy)
    }
    
    func makeInputFieldWithPhoneNumberStyleAndAllStates() -> UIStackView {
        let phoneNumberStrategy = PhoneNumberInputFieldValidationStrategy(failureMessage: "Hmm, looks like the phone is written incorrectly.")
        return makeInputFieldWithAllStates(withStyle: .phoneNumber,
                                           placeholderText: "Phone",
                                           text: "555123123",
                                           validationStrategy: phoneNumberStrategy)
    }
    
    func makeInputFieldWithDropdownStyleAndAllStates() -> UIStackView {
        return makeInputFieldWithAllStates(withStyle: .dropdown,
                                           placeholderText: "Dropdown")
    }
    
    func makeInputFieldWithMultilineStyleAndAllStates() -> UIStackView {
        return makeInputFieldWithAllStates(withStyle: .multiline,
                                           placeholderText: "Multiline")
    }
    
    func makeInputFieldWithInverseStyleAndAllStates() -> UIStackView {
        return makeInputFieldWithAllStates(withStyle: .inverse,
                                           placeholderText: "Inverse")
    }
    
    func makeInputFieldWithAllStates(withStyle style: InputField.Style,
                                     placeholderText: String,
                                     text: String = Constants.defaultTextValue,
                                     validationStrategy: InputFieldValidationStrategy? = nil) -> UIStackView {
        let inputFieldNormalState = makeInputField(withStyle: style,
                                                   state: .normal,
                                                   placeholderText: "\(placeholderText) - normal state",
                                                   text: text,
                                                   validationStrategy: validationStrategy)
        let inputFieldNormalStateWithFocus = makeInputField(withStyle: style,
                                                   state: .normal,
                                                   placeholderText: "\(placeholderText) - normal state with focus",
                                                   text: text,
                                                   validationStrategy: validationStrategy)
        inputFieldNormalStateWithFocus.becomeFirstResponder()
        let inputFieldDisabledState = makeInputField(withStyle: style,
                                                     state: .disabled,
                                                     placeholderText: "\(placeholderText) - disabled state",
                                                     text: text,
                                                     validationStrategy: validationStrategy)
        let inputFieldInvalidState = makeInputField(withStyle: style,
                                                    state: .invalid,
                                                    placeholderText: "\(placeholderText) - invalid state",
                                                    text: text,
                                                    validationStrategy: validationStrategy)
        
        let vStack = makeStackView(arrangedSubviews: [
            inputFieldNormalState,
            inputFieldNormalStateWithFocus,
            inputFieldDisabledState,
            inputFieldInvalidState
        ])
        
        return vStack
    }
    
    func makeInputField(withStyle style: InputField.Style = .default,
                        state: InputField.State = .normal,
                        placeholderText: String? = nil,
                        text: String = Constants.defaultTextValue,
                        validationStrategy: InputFieldValidationStrategy? = nil) -> InputField {
        let inputField = InputField(style: style, nonOptionalFieldFailureMessage: "This field is required")
        inputField.set(state: state, animated: false)
        inputField.placeholderText = placeholderText
        inputField.text = text
        inputField.validationStrategy = validationStrategy
        
        let size = inputField.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        inputField.frame = CGRect(origin: .zero, size: size)
        
        return inputField
    }
    
    func makeStackView(arrangedSubviews views: [UIView]) -> UIStackView {
        let vStack = UIStackView(arrangedSubviews: views)
        
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = 0
        let size = vStack.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        vStack.frame = CGRect(origin: .zero, size: size)
        
        return vStack
    }
}
