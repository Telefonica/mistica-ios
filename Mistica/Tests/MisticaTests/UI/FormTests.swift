//
//  FormTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class FormsTests: XCTestCase {
    private enum Constants {
        static let headerTitle = "Header view"
        static let buttonTitle = "Save"
        static let footerTitle = "Footer view"
    }

    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    // MARK: - Simple view

    func testHeaderAndButtonEnabledAndFooter() {
        let formViewDelegate = FormViewDelegateMock { _ in
            true
        } formViewDidTapButtonMock: { _, _ in
            // to do nothing
        }

        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                withHeader: makeLabel(withText: Constants.headerTitle),
                buttonTitle: Constants.buttonTitle,
                footer: makeLabel(withText: Constants.footerTitle),
                delegate: formViewDelegate
            )
        )
    }

    func testFormViewWithButtonDisabled() {
        let formViewDelegate = FormViewDelegateMock { _ in
            false
        } formViewDidTapButtonMock: { _, _ in
            // to do nothing
        }

        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [],
                buttonTitle: Constants.buttonTitle,
                delegate: formViewDelegate
            )
        )
    }

    // MARK: - InputField Styles

    func testInputFieldWithStyleForDefault() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [
                    makeInputField()
                ],
                buttonTitle: Constants.buttonTitle
            )
        )
    }

    func testFieldWithEmailStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [
                    makeInputFieldWithEmailStyle()
                ],
                buttonTitle: Constants.buttonTitle
            )
        )
    }

    func testFieldWithPasswordStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [
                    makeInputFieldWithPasswordStyle()
                ],
                buttonTitle: Constants.buttonTitle
            )
        )
    }

    func testFieldWithPhoneNumberStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [
                    makeInputFieldWithPhoneNumberStyle()
                ],
                buttonTitle: Constants.buttonTitle
            )
        )
    }

    func testFieldWithDropdownStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [
                    makeInputFieldWithDropdownStyle()
                ],
                buttonTitle: Constants.buttonTitle
            )
        )
    }

    func testFieldWithMultilineStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [
                    makeInputFieldWithMultilineStyle()
                ],
                buttonTitle: Constants.buttonTitle
            )
        )
    }

    func testFieldWithInverseStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: formView(
                inputFields: [
                    makeInputFieldWithInverseStyle()
                ],
                buttonTitle: Constants.buttonTitle
            )
        )
    }

    // MARK: Behaviour

    func testSetValueToPasswordInputField() {
        MisticaConfig.brandStyle = .o2

        let passwordInputField = makeInputFieldWithPasswordStyle()
        let formViewWithPassword = formView(
            inputFields: [
                passwordInputField
            ],
            buttonTitle: Constants.buttonTitle
        )
        assertSnapshot(
            matching: formViewWithPassword,
            as: .image,
            named: "assertInitialState"
        )

        passwordInputField.text = "password"

        assertSnapshot(
            matching: formViewWithPassword,
            as: .image,
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .o2

        let view = FormXIBIntegration.viewFromNib()
        guard let formView = view.formView else { fatalError("The view IBOutlet was not setup") }

        formView.addHeaderView(makeLabel(withText: Constants.headerTitle))
        formView.addInputFields([
            makeInputField(),
            makeInputFieldWithEmailStyle(),
            makeInputFieldWithPasswordStyle(),
            makeInputFieldWithPhoneNumberStyle(),
            makeInputFieldWithDropdownStyle(),
            makeInputFieldWithMultilineStyle(),
            makeInputFieldWithInverseStyle()
        ])
        formView.button.title = Constants.buttonTitle
        formView.addFooterView(makeLabel(withText: Constants.footerTitle))

        assertSnapshot(matching: view, as: .image)
    }
}

// MARK: - Helpers

class FormViewDelegateMock: FormViewDelegate {
    var formViewButtonShouldBeEnabledMock: (FormView) -> Bool
    var formViewDidTapButtonMock: (FormView, Bool) -> Void

    init(formViewButtonShouldBeEnabledMock: @escaping (FormView) -> Bool, formViewDidTapButtonMock: @escaping (FormView, Bool) -> Void) {
        self.formViewButtonShouldBeEnabledMock = formViewButtonShouldBeEnabledMock
        self.formViewDidTapButtonMock = formViewDidTapButtonMock
    }

    func formViewButtonShouldBeEnabled(_ formView: FormView) -> Bool {
        formViewButtonShouldBeEnabledMock(formView)
    }

    func formViewDidTapButton(_ formView: FormView, isValid: Bool) {
        formViewDidTapButtonMock(formView, isValid)
    }
}

private extension FormsTests {
    func formView(withHeader header: UIView? = nil, inputFields: [InputField] = [], buttonTitle: String, footer: UIView? = nil, delegate: FormViewDelegate? = nil) -> UIViewController {
        let formView = FormView()
        formView.delegate = delegate
        if let header = header {
            formView.addHeaderView(header)
        }
        formView.addInputFields(inputFields)
        formView.button.title = buttonTitle
        if let footer = footer {
            formView.addFooterView(footer)
        }
        let viewController = FormTestsViewController(formView: formView)
        return viewController
    }

    func makeLabel(withText text: String) -> UIView {
        let label = UILabel()
        label.text = text
        return label
    }

    func makeInputField(withStyle style: InputField.Style = .default, placeholderText: String? = "Text", validationStrategy: InputFieldValidationStrategy? = nil) -> InputField {
        let inputField = InputField(style: style, nonOptionalFieldFailureMessage: "This field is required")
        inputField.placeholderText = placeholderText
        inputField.validationStrategy = validationStrategy
        return inputField
    }

    func makeInputFieldWithEmailStyle() -> InputField {
        makeInputField(
            withStyle: .email,
            placeholderText: "Email",
            validationStrategy: EmailInputFieldValidationStrategy(failureMessage: "Hmm, looks like the email is written incorrectly")
        )
    }

    func makeInputFieldWithPasswordStyle() -> InputField {
        makeInputField(
            withStyle: .password,
            placeholderText: "Password",
            validationStrategy: PasswordInputFieldValidationStrategy(failureMessage: "Oops! That's too short. It has to have at lest 8 characters")
        )
    }

    func makeInputFieldWithPhoneNumberStyle() -> InputField {
        makeInputField(
            withStyle: .phoneNumber,
            placeholderText: "Phone",
            validationStrategy: PhoneNumberInputFieldValidationStrategy(failureMessage: "Hmm, looks like the phone is written incorrectly.")
        )
    }

    func makeInputFieldWithDropdownStyle() -> InputField {
        makeInputField(
            withStyle: .dropdown,
            placeholderText: "dropdown"
        )
    }

    func makeInputFieldWithMultilineStyle() -> InputField {
        makeInputField(
            withStyle: .multiline,
            placeholderText: "multiline\nmultiline\nmultiline\nmultiline"
        )
    }

    func makeInputFieldWithInverseStyle() -> InputField {
        makeInputField(
            withStyle: .inverse,
            placeholderText: "inverse"
        )
    }
}

private class FormTestsViewController: UIViewController {
    private let formView: FormView

    init(formView: FormView) {
        self.formView = formView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(formView)
        view.applyDefaultConstraints(toSubview: formView)
    }
}

extension UIView {
    func applyDefaultConstraints(toSubview subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false

        let views: [String: Any] = ["subview": subview]

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]|", metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]|", metrics: nil, views: views))
    }
}
