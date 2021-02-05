//
//  UICatalogFormViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

class UICatalogFormViewController: UIViewController {
    private lazy var formView: FormView = {
        let formView = FormView()
        formView.delegate = self
        formView.addHeaderView(headerView)
        formView.addInputFields(inputFields)
        formView.addDetailView(detailView)
        formView.addFooterView(footerView)
        formView.button.title = "Save"
        view.addGestureRecognizer(formView.resignFirstResponderTapGestureRecognizer)
        return formView
    }()

    private lazy var headerView: DefaultTableHeaderView = {
        let headerView = DefaultTableHeaderView()
        headerView.title = "Header view"
        return headerView
    }()

    private lazy var detailView: DefaultTableHeaderView = {
        let detailView = DefaultTableHeaderView()
        detailView.title = "Detail view"
        return detailView
    }()

    private lazy var footerView: DefaultTableHeaderView = {
        let footerView = DefaultTableHeaderView()
        footerView.title = "Footer view"
        return footerView
    }()

    private lazy var nameInputField: InputField = {
        let inputField = InputField(style: .default, nonOptionalFieldFailureMessage: "This field is required")
        inputField.placeholderText = "Name"
        return inputField
    }()

    private lazy var surnameInputField: InputField = {
        let inputField = InputField(style: .default, nonOptionalFieldFailureMessage: "This field is required")
        inputField.placeholderText = "Surname (Optional)"
        inputField.isOptional = true
        return inputField
    }()

    private lazy var emailInputField: InputField = {
        let inputField = InputField(style: .email, nonOptionalFieldFailureMessage: "This field is required")
        inputField.placeholderText = "Email"
        inputField.validationStrategy = EmailInputFieldValidationStrategy(failureMessage: "Hmm, looks like the email is written incorrectly")
        return inputField
    }()

    private lazy var passwordInputField: InputField = {
        let inputField = InputField(style: .password, nonOptionalFieldFailureMessage: "This field is required")
        inputField.placeholderText = "Password"
        inputField.validationStrategy = PasswordInputFieldValidationStrategy(failureMessage: "Oops! That's too short. It has to have at lest 8 characters")
        return inputField
    }()

    private lazy var phoneNumberInputField: InputField = {
        let inputField = InputField(style: .phoneNumber, nonOptionalFieldFailureMessage: "This field is required")
        inputField.placeholderText = "Phone"
        inputField.validationStrategy = PhoneNumberInputFieldValidationStrategy(failureMessage: "Hmm, looks like the phone is written incorrectly.")
        return inputField
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Form"
        view.backgroundColor = .background
        view.addSubview(constrainedToLayoutMarginsGuideOf: formView)
    }
}

extension UICatalogFormViewController: FormViewDelegate {
    func formViewButtonShouldBeEnabled(_: FormView) -> Bool {
        true
    }

    func formViewDidTapButton(_: FormView, isValid: Bool) {
        guard isValid else { return }
        disableInputs()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: enableInputs)
    }
}

private extension UICatalogFormViewController {
    var inputFields: [InputField] {
        [nameInputField, surnameInputField, passwordInputField, emailInputField, phoneNumberInputField]
    }

    func disableInputs() {
        inputFields.forEach { $0.set(state: .disabled, animated: true) }
        formView.button.state = .disabled
    }

    func enableInputs() {
        inputFields.forEach { $0.set(state: .normal, animated: true) }
        formView.button.state = .normal
    }
}

protocol UICatalogFormViewControllerProvider: AnyObject {
    func catalogFormViewController() -> UICatalogFormViewController
}
