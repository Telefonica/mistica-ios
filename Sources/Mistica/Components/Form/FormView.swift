//
//  FormView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import UIKit

@MainActor
@objc public protocol FormViewDelegate: AnyObject {
    func formViewButtonShouldBeEnabled(_ formView: FormView) -> Bool
    func formViewDidTapButton(_ formView: FormView, isValid: Bool)
    // Needed for Objc interop in TMPhoneNumberInputViewController
    @objc optional func formViewDidChangeInputFieldText(_ formView: FormView, inputField: InputField)
}

/// `FormView` is a container view to render a scrollable set of `InputField` rows. It will automatically manage position, layout, and validation of every input.
public class FormView: UIView {
    private enum Constants {
        static let spacing: CGFloat = 16
        static let layoutMargings = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    private lazy var scrollStackView: IntrinsicScrollStackView = {
        let scrollStackView = IntrinsicScrollStackView(arrangedSubviews: [])
        scrollStackView.stackView.spacing = Constants.spacing
        scrollStackView.stackView.axis = .vertical
        return scrollStackView
    }()

    @objc public lazy var resignFirstResponderTapGestureRecognizer: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resignFirstResponder))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.cancelsTouchesInView = false
        return tapGesture
    }()

    @objc public private(set) lazy var button: Button = {
        let button = Button(style: .primary, title: "")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    public var automaticallyAdjustsScrollViewInsets = true

    private var headerView: UIView?
    private var detailView: UIView?
    private var footerView: UIView?

    private var validatableViews: [ValidatableView] = []
    private let keyboardNotificationCenter = KeyboardNotificationCenter()

    @objc public weak var delegate: FormViewDelegate?
    public weak var inputFieldDelegate: InputFieldDelegate?

    public init() {
        super.init(frame: .zero)
        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        startListeningKeyboardNotifications()
        scrollStackView.layoutMargins = .zero
        layoutMargins = Constants.layoutMargings
        addSubview(withDefaultConstraints: scrollStackView)
    }

    @discardableResult
    override public func resignFirstResponder() -> Bool {
        validatableViews.forEach { $0.resignFirstResponder() }
        return super.resignFirstResponder()
    }
}

public extension FormView {
    var isValid: Bool {
        validatableViews.reduce(true) { $0 && $1.isValid() }
    }

    func validate() {
        validatableViews.forEach { $0.validate() }
    }

    func addInputFields(_ inputFields: [InputField]) {
        inputFields.forEach(addInputField)
        arrangeViews()
    }

    func removeInputFields(_ inputFields: [InputField]) {
        inputFields.forEach(removeInputField)
    }

    func addValidatableViews(_ views: [ValidatableView]) {
        views.forEach(addValidatableView)
        arrangeViews()
    }

    func removeValidatableViews(_ views: [ValidatableView]) {
        views.forEach(removeValidatableView)
    }

    func addHeaderView(_ headerView: UIView) {
        self.headerView = headerView
        arrangeViews()
    }

    func removeHeaderView() {
        headerView?.removeFromSuperview()
        headerView = nil
    }

    func addFooterView(_ footerView: UIView) {
        self.footerView = footerView
        arrangeViews()
    }

    func removeFooterView() {
        footerView?.removeFromSuperview()
        footerView = nil
    }

    func addDetailView(_ detailView: UIView) {
        self.detailView = detailView
        arrangeViews()
    }

    func removeDetailView() {
        detailView?.removeFromSuperview()
        detailView = nil
    }

    func arrangeViews() {
        scrollStackView.stackView.removeArrangedSubviews()

        if let headerView = headerView {
            scrollStackView.stackView.addArrangedSubview(headerView)
        }

        for validatableView in validatableViews {
            scrollStackView.stackView.addArrangedSubview(validatableView)
        }

        if let detailView = detailView {
            scrollStackView.stackView.addArrangedSubview(detailView)
        }

        scrollStackView.stackView.addArrangedSubview(button)

        if let footerView = footerView {
            scrollStackView.stackView.addArrangedSubview(footerView)
        }

        updateButtonState()
    }

    func updateButtonState() {
        if delegate?.formViewButtonShouldBeEnabled(self) ?? true {
            button.isEnabled = true
        } else {
            button.isEnabled = false
        }
    }
}

private extension FormView {
    func addInputField(_ inputField: InputField) {
        // Use isEqual to compare instances of the UIView should be enough, since ValidatableView cannot conform to Equatable
        guard !validatableViews.contains(where: inputField.isEqual) else { return }
        validatableViews.append(inputField)
        inputField.delegate = self
    }

    func removeInputField(_ inputField: InputField) {
        // Use isEqual to compare instances of the UIView should be enough, since ValidatableView cannot conform to Equatable
        guard let index = validatableViews.firstIndex(where: inputField.isEqual) else { return }
        validatableViews.remove(at: index)
        inputField.removeFromSuperview()
        inputField.delegate = nil
    }

    func addValidatableView(_ view: ValidatableView) {
        // Use isEqual to compare instances of the UIView should be enough, since ValidatableView cannot conform to Equatable
        guard !validatableViews.contains(where: view.isEqual) else { return }
        validatableViews.append(view)
    }

    func removeValidatableView(_ view: ValidatableView) {
        // Use isEqual to compare instances of the UIView should be enough, since ValidatableView cannot conform to Equatable
        guard let index = validatableViews.firstIndex(where: view.isEqual) else { return }
        validatableViews.remove(at: index)
        view.removeFromSuperview()
    }

    func startListeningKeyboardNotifications() {
        keyboardNotificationCenter.subscribe(.willShow) { [weak self] keyboardInfo in
            self?.handleWillShowKeyboardNotification(keyboardInfo: keyboardInfo)
        }

        keyboardNotificationCenter.subscribe(.willHide) { [weak self] keyboardInfo in
            self?.handleWillHideKeyboardNotification(keyboardInfo: keyboardInfo)
        }
    }

    func handleWillShowKeyboardNotification(keyboardInfo: KeyboardInfo) {
        guard automaticallyAdjustsScrollViewInsets else { return }
        scrollStackView.contentInset.bottom = keyboardInfo.frameEnd.height
    }

    func handleWillHideKeyboardNotification(keyboardInfo _: KeyboardInfo) {
        guard automaticallyAdjustsScrollViewInsets else { return }
        scrollStackView.contentInset.bottom = 0
    }
}

extension FormView: InputFieldDelegate {
    public func inputFieldTextDidChange(_ field: InputField) {
        updateButtonState()
        delegate?.formViewDidChangeInputFieldText?(self, inputField: field)
        inputFieldDelegate?.inputFieldTextDidChange(field)
    }

    public func inputFieldDidEndEditing(_ field: InputField) {
        inputFieldDelegate?.inputFieldDidEndEditing(field)
    }

    public func inputFieldShouldBeginEditing(_ field: InputField) -> Bool {
        inputFieldDelegate?.inputFieldShouldBeginEditing(field) ?? true
    }

    public func inputFieldShouldReturn(_ field: InputField) -> Bool {
        guard inputFieldDelegate?.inputFieldShouldReturn(field) ?? true else { return false }

        field.resignFirstResponder()
        if field == validatableViews.last {
            buttonTapped()
        } else if let nextView = validatableView(after: field, in: validatableViews) {
            nextView.becomeFirstResponder()
        }

        return true
    }

    public func inputFieldDidBeginEditing(_ field: InputField) {
        if let lastField = validatableViews.last as? InputField,
           field == lastField {
            field.returnKeyType = .go
        } else {
            field.returnKeyType = .next
        }

        updateButtonState()

        inputFieldDelegate?.inputFieldDidBeginEditing(field)
    }

    public func inputField(_ field: InputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        inputFieldDelegate?.inputField(field, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }

    public func inputField(_ field: InputField, didTapLeadingButton button: UIButton) {
        inputFieldDelegate?.inputField(field, didTapLeadingButton: button)
    }

    public func inputField(_ field: InputField, didTapTraillingButton button: UIButton) {
        inputFieldDelegate?.inputField(field, didTapTraillingButton: button)
    }

    public func inputFieldDidUpdateState(_ field: InputField) {
        inputFieldDelegate?.inputFieldDidUpdateState(field)
    }

    public func inputFieldShouldLayout(_ field: InputField) {
        superview?.layoutIfNeededAnimated(withDuration: UIView.defaultAnimationDuration, options: [])
        inputFieldDelegate?.inputFieldShouldLayout(field)
    }
}

// MARK: Actions

private extension FormView {
    @objc func buttonTapped() {
        validate()
        delegate?.formViewDidTapButton(self, isValid: isValid)
    }
}

class IntrinsicScrollStackView: ScrollStackView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

private extension FormView {
    func validatableView(after validatableView: ValidatableView, in array: [ValidatableView]) -> ValidatableView? {
        guard let idx = array.firstIndex(where: validatableView.isEqual) else { return nil }
        let nextIdx = array.index(after: idx)
        guard array.indices.contains(nextIdx) else { return nil }
        return array[nextIdx]
    }
}
