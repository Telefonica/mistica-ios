//
//  LegacyTextField.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI
import UIKit

enum LegacyTextFieldInputStyle {
    case picker(options: [String], initialSelectionIndex: Int?)
    case date(format: String, initial: Date)
    case text
}

// Wrapper around UITextField to properly work with responders.

struct LegacyTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var isResponder: Bool
    var isSecured: Bool
    var keyboard: UIKeyboardType
    var inputStyle: LegacyTextFieldInputStyle

    func makeUIView(context: UIViewRepresentableContext<LegacyTextField>) -> UITextField {
        let textField = ActionsTextField(frame: .zero)
        updateUIView(textField, context: context)
        switch inputStyle {
        case .picker(_, let initialSelectionIndex):
            let pickerView = UIPickerView()
            pickerView.delegate = context.coordinator
            pickerView.dataSource = context.coordinator
            if let initialSelectionIndex = initialSelectionIndex {
                pickerView.selectRow(initialSelectionIndex, inComponent: 0, animated: false)
            }
            textField.inputView = pickerView
            textField.canPerformActions = false
            addToolbar(textField, context: context)

        case .date(_, let initial):
            let pickerView = UIDatePicker()
            pickerView.addTarget(context.coordinator, action: #selector(LegacyTextFieldCoordinator.datePickerValueChanged), for: .allEvents)
            pickerView.datePickerMode = .date
            pickerView.date = initial
            if #available(iOS 13.4, *) {
                pickerView.preferredDatePickerStyle = .wheels
            }
            textField.inputView = pickerView
            textField.canPerformActions = false
            addToolbar(textField, context: context)

        case .text:
            textField.inputView = nil
            textField.canPerformActions = true
        }
        return textField
    }

    func makeCoordinator() -> LegacyTextFieldCoordinator {
        .init(text: $text, isResponder: $isResponder, inputStyle: inputStyle)
    }

    func updateUIView(_ textField: UITextField, context: UIViewRepresentableContext<LegacyTextField>) {
        context.coordinator.textField = textField

        textField.text = text
        textField.isSecureTextEntry = isSecured
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = keyboard
        textField.delegate = context.coordinator
        textField.textColor = Color.textPrimary.uiColor

        if isResponder && !textField.isFirstResponder {
            textField.becomeFirstResponder()
        } else if !isResponder && textField.isFirstResponder {
            textField.resignFirstResponder()
        }
    }

    func addToolbar(_ textField: UITextField, context: UIViewRepresentableContext<LegacyTextField>) {
        let toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(LegacyTextFieldCoordinator.doneButtonTapped(sender:)))
        ]
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
    }
}

// MARK: Coordinator

class LegacyTextFieldCoordinator: NSObject {
    let formatter = DateFormatter()
    weak var textField: UITextField?

    @Binding var text: String
    @Binding var isResponder: Bool
    var inputStyle: LegacyTextFieldInputStyle

    init(
        text: Binding<String>,
        isResponder: Binding<Bool>,
        inputStyle: LegacyTextFieldInputStyle
    ) {
        _text = text
        _isResponder = isResponder
        self.inputStyle = inputStyle
    }
}

// MARK: UITextFieldDelegate

extension LegacyTextFieldCoordinator: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        text = textField.text ?? ""
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        isResponder = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        isResponder = false
    }
}

// MARK: UIPickerViewDelegate and UIPickerViewDataSource

extension LegacyTextFieldCoordinator: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard case .picker(let options, _) = inputStyle else { return 0 }
        return options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard case .picker(let options, _) = inputStyle else { return nil }
        return options[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard case .picker(let options, _) = inputStyle else { return }
        text = options[row]
    }
}

// MARK: Date picker

extension LegacyTextFieldCoordinator {
    @objc func doneButtonTapped(sender: UIBarButtonItem) {
        textField?.endEditing(true)
    }

    @objc func datePickerValueChanged(picker: UIDatePicker) {
        guard case .date(let format, _) = inputStyle else { return }
        formatter.dateFormat = format
        text = formatter.string(from: picker.date)
    }
}

// MARK: ActionsTextField

private class ActionsTextField: UITextField {
    var canPerformActions = true
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        guard canPerformActions else { return false }
        return super.canPerformAction(action, withSender: sender)
    }
}
