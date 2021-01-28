//
//  FormsTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
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

        isRecording = false
    }
    
    // MARK: - Simple view
    
    func testHeaderAndButtonEnabledAndFooter() {
        let formViewDelegate = FormViewDelegateMock { _ in
            return true
        } formViewDidTapButtonMock: { _, _ in
            // to do nothing
        }
                
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: FormTestsViewController(
                formView: makeFormView(
                    withHeader: makeLabel(withText: Constants.headerTitle),
                    buttonTitle: Constants.buttonTitle,
                    footer: makeLabel(withText: Constants.footerTitle),
                    delegate: formViewDelegate
                ))
        )
    }
    
    func testHeaderAndButtonDisabledAndFooter() {
        let formViewDelegate = FormViewDelegateMock { _ in
            return false
        } formViewDidTapButtonMock: { _, _ in
            // to do nothing
        }

        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: FormTestsViewController(
                formView: makeFormView(
                    withHeader: makeLabel(withText: Constants.headerTitle),
                    buttonTitle: Constants.buttonTitle,
                    footer: makeLabel(withText: Constants.footerTitle),
                    delegate: formViewDelegate
                )
            )
        )
    }
    
    // MARK: - Layout
    
    func testOnlyOneInputField() {
        MisticaConfig.brandStyle = .movistar

        let formView = makeFormView(
            inputFields: [
                makeInputField()
            ],
            buttonTitle: Constants.buttonTitle
        )

        let formTestsViewController = FormTestsViewController(formView: formView)
        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe)
        )
    }
    
    // MARK: - Behaviour
    
    func testAddInputField() {
        MisticaConfig.brandStyle = .o2
        
        let formView = makeFormView(
            inputFields: [
                makeInputField()
            ],
            buttonTitle: Constants.buttonTitle
        )
        let formTestsViewController = FormTestsViewController(formView: formView)
        
        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "assertInitialState"
        )

        formView.addInputFields([makeInputFieldWithEmailStyle()])

        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "finalState"
        )
    }
    
    func testRemoveInputField() {
        MisticaConfig.brandStyle = .o2

        let firstInputField = makeInputField()
        let secondInputField = makeInputFieldWithPasswordStyle()
        let formView = makeFormView(
            inputFields: [
                firstInputField,
                secondInputField
            ],
            buttonTitle: Constants.buttonTitle
        )
        let formTestsViewController = FormTestsViewController(formView: formView)
        
        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "assertInitialState"
        )

        formView.removeInputFields([firstInputField])

        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "finalState"
        )
    }
    
    // MARK: - Validation
    
    func testInputFieldMandatoryValidationShowWarning() {
        MisticaConfig.brandStyle = .o2
        
        let formView = makeFormView(
            inputFields: [
                makeInputField(),
                makeInputFieldWithPasswordStyle(),
                makeInputFieldWithEmailStyle(),
                makeInputFieldWithDropdownStyle(),
                makeInputFieldWithPhoneNumberStyle(),
                makeInputFieldWithMultilineStyle()
            ],
            buttonTitle: Constants.buttonTitle
        )
        let formTestsViewController = FormTestsViewController(formView: formView)
        
        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "assertInitialState"
        )

        formView.validate()

        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "finalState"
        )
    }

    func testInputFieldIsOptionalValidationDoesNotShowWarning() {
        MisticaConfig.brandStyle = .o2
        
        let formView = makeFormView(
            inputFields: [
                makeInputField(isOptional: true),
                makeInputFieldWithPasswordStyle(isOptional: true),
                makeInputFieldWithEmailStyle(isOptional: true),
                makeInputFieldWithDropdownStyle(isOptional: true),
                makeInputFieldWithPhoneNumberStyle(isOptional: true),
                makeInputFieldWithMultilineStyle(isOptional: true)

            ],
            buttonTitle: Constants.buttonTitle
        )
        let formTestsViewController = FormTestsViewController(formView: formView)
        
        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "assertInitialState"
        )

        formView.validate()

        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "finalState"
        )
    }
    
    func testInputFieldMandatoryAndFillInValidationDoesNotShowWarning() {
        MisticaConfig.brandStyle = .o2
        
        let formView = makeFormView(
            inputFields: [
                makeInputField(text: "user name"),
                makeInputFieldWithPasswordStyle(text: "Awes0me p4ssw0rd"),
                makeInputFieldWithEmailStyle(text: "user@server.es"),
                makeInputFieldWithDropdownStyle(text: "value"),
                makeInputFieldWithPhoneNumberStyle(text: "555123123"),
                makeInputFieldWithMultilineStyle(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
            ],
            buttonTitle: Constants.buttonTitle
        )
        let formTestsViewController = FormTestsViewController(formView: formView)
        
        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "assertInitialState"
        )

        formView.validate()

        assertSnapshot(
            matching: formTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "finalState"
        )
    }

    // MARK: XIB integration
    
    func testXIBIntegration() {
        MisticaConfig.brandStyle = .o2
        
        let view = FormXIBIntegration.viewFromNib()
        guard let formView = view.formView else { fatalError("The view IBOutlet was not setup")}
        
        formView.addHeaderView(makeLabel(withText: Constants.headerTitle))
        formView.addInputFields([
            makeInputField(),
            makeInputFieldWithEmailStyle(),
            makeInputFieldWithPasswordStyle(),
            makeInputFieldWithPhoneNumberStyle(),
            makeInputFieldWithDropdownStyle(),
            makeInputFieldWithMultilineStyle()
        ])
        formView.button.title = Constants.buttonTitle
        formView.addFooterView(makeLabel(withText: Constants.footerTitle))
        
        assertSnapshot(matching: view.asRootOfViewController(), as: .image(on: .iPhoneSe))
    }
}

// MARK: - Helpers

class FormViewDelegateMock: FormViewDelegate {
    var formViewButtonShouldBeEnabledMock: (FormView) -> Bool
    var formViewDidTapButtonMock: (FormView, Bool) -> Void
    
    init(formViewButtonShouldBeEnabledMock: @escaping(FormView) -> Bool, formViewDidTapButtonMock: @escaping (FormView, Bool) -> Void) {
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
    func makeFormView(withHeader header: UIView? = nil, inputFields: [InputField] = [], buttonTitle: String, footer: UIView? = nil, delegate: FormViewDelegate? = nil) -> FormView {
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
        
        return formView
    }
    
    func makeLabel(withText text: String) -> UIView {
        let label = UILabel()
        label.text = text
        return label
    }
        
    func makeInputField(withStyle style: InputField.Style = .default,
                        placeholderText: String? = "Text",
                        text: String = "",
                        isOptional: Bool = false,
                        validationStrategy: InputFieldValidationStrategy? = nil) -> InputField {
        let inputField = InputField(style: style, nonOptionalFieldFailureMessage: "This field is required")
        inputField.placeholderText = placeholderText
        inputField.text = text
        inputField.isOptional = isOptional
        inputField.validationStrategy = validationStrategy
        return inputField
    }
    
    func makeInputFieldWithEmailStyle(text: String = "", isOptional: Bool = false) -> InputField {
        makeInputField(withStyle: .email,
                       placeholderText: "Email",
                       text: text,
                       isOptional: true,
                       validationStrategy: isOptional ? nil : EmailInputFieldValidationStrategy(failureMessage: "Hmm, looks like the email is written incorrectly"))
    }

    func makeInputFieldWithPasswordStyle(text: String = "", isOptional: Bool = false) -> InputField {
        makeInputField(withStyle: .password,
                       placeholderText: "Password",
                       text: text,
                       isOptional: isOptional,
                       validationStrategy: isOptional ? nil : PasswordInputFieldValidationStrategy(failureMessage: "Oops! That's too short. It has to have at lest 8 characters"))
    }

    func makeInputFieldWithPhoneNumberStyle(text: String = "", isOptional: Bool = false) -> InputField {
        makeInputField(withStyle: .phoneNumber,
                       placeholderText: "Phone",
                       text: text,
                       isOptional: isOptional,
                       validationStrategy: isOptional ? nil : PhoneNumberInputFieldValidationStrategy(failureMessage: "Hmm, looks like the phone is written incorrectly."))
    }
    
    func makeInputFieldWithDropdownStyle(text: String = "", isOptional: Bool = false) -> InputField {
        makeInputField(withStyle: .dropdown,
                       placeholderText: "dropdown",
                       text: text,
                       isOptional: isOptional)
    }

    func makeInputFieldWithMultilineStyle(text: String = "", isOptional: Bool = false) -> InputField {
        makeInputField(withStyle: .multiline,
                       placeholderText: "multiline",
                       text: text,
                       isOptional: isOptional)
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
