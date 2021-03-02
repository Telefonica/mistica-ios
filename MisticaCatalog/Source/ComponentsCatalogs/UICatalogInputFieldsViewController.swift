//
//  UICatalogInputFieldsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

class UICatalogInputFieldsViewController: UITableViewController {
    private enum Constants {
        static var styles: [Section: [Style]] {
            [
                .default: [
                    Style(inputFieldStyle: .default, placeholder: "Default"),
                    Style(inputFieldStyle: .default, placeholder: "Default", text: "This is a text"),
                    Style(inputFieldStyle: .default, placeholder: "Default", text: "This is a text", assistiveText: "Helper text"),
                    Style(inputFieldStyle: .default, placeholder: "Default", text: "This is a text", assistiveText: "Helper text", isEnabled: false),
                    Style(inputFieldStyle: .default, placeholder: "Default", text: "This", assistiveText: "Error text")
                ],
                .inverse: [
                    Style(inputFieldStyle: .inverse, placeholder: "Default", isInverse: true),
                    Style(inputFieldStyle: .inverse, placeholder: "Default", text: "This is a text", isInverse: true),
                    Style(inputFieldStyle: .inverse, placeholder: "Default", text: "This is a text", assistiveText: "Helper text", isInverse: true),
                    Style(inputFieldStyle: .inverse, placeholder: "Default", text: "This is a text", assistiveText: "Helper text", isEnabled: false, isInverse: true),
                    Style(inputFieldStyle: .inverse, placeholder: "Default", text: "This", assistiveText: "Error text", isInverse: true)
                ],
                .email: [
                    Style(inputFieldStyle: .email, placeholder: "Email"),
                    Style(inputFieldStyle: .email, placeholder: "Email", text: "email@tuenti.com"),
                    Style(inputFieldStyle: .email, placeholder: "Email", text: "email@tuenti.com", assistiveText: "Helper text"),
                    Style(inputFieldStyle: .email, placeholder: "Email", text: "email@tuenti.com", assistiveText: "Helper text", isEnabled: false),
                    Style(inputFieldStyle: .email, placeholder: "Email", text: "email", assistiveText: "Error text")
                ],
                .multiline: [
                    Style(inputFieldStyle: .multiline, placeholder: "Multiline", textInputLimit: .finite(characterCount: 200)),
                    Style(inputFieldStyle: .multiline, placeholder: "Multiline", text: "This is a text", textInputLimit: .finite(characterCount: 200)),
                    Style(inputFieldStyle: .multiline, placeholder: "Multiline", text: "This is a text", assistiveText: "Helper text", textInputLimit: .finite(characterCount: 200)),
                    Style(inputFieldStyle: .multiline, placeholder: "Multiline", text: "This is a text", assistiveText: "Helper text", textInputLimit: .finite(characterCount: 200), isEnabled: false),
                    Style(inputFieldStyle: .multiline, placeholder: "Multiline", text: "This", assistiveText: "Error text", textInputLimit: .finite(characterCount: 200))
                ],
                .password: [
                    Style(inputFieldStyle: .password, placeholder: "Password"),
                    Style(inputFieldStyle: .password, placeholder: "Password", text: "12345678"),
                    Style(inputFieldStyle: .password, placeholder: "Password", text: "12345678", assistiveText: "Helper text"),
                    Style(inputFieldStyle: .password, placeholder: "Password", text: "12345678", assistiveText: "Helper text", isEnabled: false),
                    Style(inputFieldStyle: .password, placeholder: "Password", text: "123", assistiveText: "Error text")
                ],
                .phoneNumber: [
                    Style(inputFieldStyle: .phoneNumber, placeholder: "Phone", prefixText: "+34"),
                    Style(inputFieldStyle: .phoneNumber, placeholder: "Phone", text: "679907528", prefixText: "+34"),
                    Style(inputFieldStyle: .phoneNumber, placeholder: "Phone", text: "679907528", prefixText: "+34", assistiveText: "Helper text"),
                    Style(inputFieldStyle: .phoneNumber, placeholder: "Phone", text: "679907528", prefixText: "+34", assistiveText: "Helper text", isEnabled: false),
                    Style(inputFieldStyle: .phoneNumber, placeholder: "Phone", text: "6799", prefixText: "+34", assistiveText: "Error text")
                ],
                .dropdown: [
                    Style(inputFieldStyle: .dropdown, placeholder: "Dropdown"),
                    Style(inputFieldStyle: .dropdown, placeholder: "Dropdown", assistiveText: "Helper text")
                ]
            ]
        }
    }

    private enum Section: Int {
        case `default`
        case inverse
        case multiline
        case email
        case password
        case phoneNumber
        case dropdown

        var title: String {
            switch self {
            case .default:
                return "Default"
            case .inverse:
                return "Inverse"
            case .multiline:
                return "Multiline"
            case .email:
                return "Email"
            case .password:
                return "Password"
            case .phoneNumber:
                return "PhoneNumber"
            case .dropdown:
                return "Dropdown"
            }
        }
    }

    private struct Style {
        let inputFieldStyle: InputField.Style
        let placeholder: String
        let text: String?
        let prefixText: String?
        let assistiveText: String?
        let textInputLimit: InputField.TextInputLimit
        let isEnabled: Bool
        let isInverse: Bool

        init(inputFieldStyle: InputField.Style,
             placeholder: String,
             text: String? = nil,
             prefixText: String? = nil,
             assistiveText: String? = nil,
             textInputLimit: InputField.TextInputLimit = .infinite,
             isEnabled: Bool = true,
             isInverse: Bool = false) {
            self.inputFieldStyle = inputFieldStyle
            self.placeholder = placeholder
            self.text = text
            self.prefixText = prefixText
            self.assistiveText = assistiveText
            self.textInputLimit = textInputLimit
            self.isEnabled = isEnabled
            self.isInverse = isInverse
        }
    }

    private var inputFieldByIndex: [IndexPath: InputField] = [:]

    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "InputFields"

        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard(_: UITapGestureRecognizer) {
        inputFieldByIndex.forEach { _, inputField in
            _ = inputField.resignFirstResponder()
        }
    }

    override func numberOfSections(in _: UITableView) -> Int {
        Constants.styles.keys.count
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        styles(at: section).count
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let style = self.style(at: indexPath)

        let inputField = InputField(style: style.inputFieldStyle, nonOptionalFieldFailureMessage: "This field is required")
        inputField.text = style.text
        inputField.prefixText = style.prefixText
        inputField.placeholderText = style.placeholder
        inputField.assistiveText = style.assistiveText
        inputField.textInputLimit = style.textInputLimit
        inputField.dataSource = self
        inputField.assistiveText = style.assistiveText
        inputField.automaticallyRemoveAssistiveTextOnTyping = false

        if !style.isEnabled {
            inputField.set(state: .disabled, animated: false)
        } else if let text = inputField.text, text.count < 7 && text.count > 0 {
            inputField.set(state: .invalid, animated: false)
        } else {
            inputField.set(state: .normal, animated: false)
        }

        inputFieldByIndex[indexPath] = inputField

        let cell = UITableViewCell()
        cell.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cell.addSubview(constrainedToLayoutMarginsGuideOf: inputField)

        if style.isInverse {
            cell.backgroundColor = .brand
        }

        return cell
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        self.section(at: section).title
    }
}

extension UICatalogInputFieldsViewController: InputFieldDataSource {
    func inputFieldPickerElements(_: InputField) -> [String] {
        ["T1", "T2"]
    }

    func inputField(_: InputField, didSelectPickerElementAt _: Int) {
        // Do nothing
    }
}

extension UICatalogInputFieldsViewController {
    private func section(at section: Int) -> Section {
        Section(rawValue: section)!
    }

    private func styles(at section: Int) -> [Style] {
        Constants.styles[self.section(at: section)]!
    }

    private func style(at indexPath: IndexPath) -> Style {
        styles(at: indexPath.section)[indexPath.row]
    }
}
