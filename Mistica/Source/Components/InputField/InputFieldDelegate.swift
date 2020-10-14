//
//  InputFieldDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

public protocol InputFieldDelegate: AnyObject {
    func inputFieldTextDidChange(_ field: InputField)
    func inputFieldShouldBeginEditing(_ field: InputField) -> Bool
    func inputFieldShouldReturn(_ field: InputField) -> Bool
    func inputFieldDidBeginEditing(_ field: InputField)
    func inputFieldDidEndEditing(_ field: InputField)
    func inputField(_ field: InputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

    func inputField(_ field: InputField, didTapLeadingButton button: UIButton)
    func inputField(_ field: InputField, didTapTraillingButton button: UIButton)

    func inputFieldDidUpdateState(_ field: InputField)
    func inputFieldShouldLayout(_ field: InputField)
}

@objc public protocol InputFieldDataSource: AnyObject {
    func inputFieldPickerElements(_ inputField: InputField) -> [String]
    func inputField(_ inputField: InputField, didSelectPickerElementAt index: Int)
}

public extension InputFieldDelegate {
    func inputFieldTextDidChange(_: InputField) {
        // Do nothing by default
    }

    func inputFieldShouldBeginEditing(_: InputField) -> Bool {
        true
    }

    func inputFieldShouldReturn(_: InputField) -> Bool {
        true
    }

    func inputFieldDidBeginEditing(_: InputField) {
        // Do nothing by default
    }

    func inputFieldDidEndEditing(_: InputField) {
        // Do nothing by default
    }

    func inputField(_: InputField, shouldChangeCharactersIn _: NSRange, replacementString _: String) -> Bool {
        true
    }

    func inputField(_: InputField, didTapLeadingButton _: UIButton) {
        // Do nothing by default
    }

    func inputField(_: InputField, didTapTraillingButton _: UIButton) {
        // Do nothing by default
    }

    func inputFieldDidUpdateState(_: InputField) {
        // Do nothing by default
    }

    func inputFieldShouldLayout(_: InputField) {
        // Do nothing by default
    }
}
