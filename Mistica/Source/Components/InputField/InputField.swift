//
//  InputField.swift
//  Mistica
//
//  Created by jmpuerta on 06/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

public class InputField: UIView {
    private typealias TextInputView = UIView & TextInput

    enum Constants {
        static let animationDuration: TimeInterval = 0.3
        static let animationCurveControlPoint1 = CGPoint(x: 0.77, y: 0)
        static let animationCurveControlPoint2 = CGPoint(x: 0.175, y: 1)
        static let containerLayoutMargins = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        static let bottomViewLayoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

        static let intrinsicContentWidth: CGFloat = 300

        static let horizontalPlaceholderSpacing: CGFloat = 4
        static let verticalPlaceholderHeightThreshold: CGFloat = 4
    }

    @frozen
    public enum State {
        case normal
        case invalid
        case disabled
    }

    @frozen
    public enum SecureTextEntry {
        case disabled
        case enabled
    }

    @frozen
    public struct StateStyle {
        let placeholderTextColor: UIColor
        let assistiveTextColor: UIColor
        let textColor: UIColor
        let editingPlaceholderTextColor: UIColor
    }

    @frozen
    public enum TextInputStyle {
        case textField
        case textView
    }

    @frozen
    public enum TextInputLimit: Equatable {
        case infinite
        case finite(characterCount: Int)
    }

    @frozen
    public enum TextInputKeyboardStyle {
        case keyboard(type: UIKeyboardType, textAutocorrectionType: UITextAutocorrectionType, textAutocapitalizationType: UITextAutocapitalizationType)
        case picker
    }

    @frozen
    public enum SideItem {
        case image(UIImage)
        case secureEntry
        case picker
    }

    public struct Style {
        let stateStyleByState: [State: StateStyle]
        let secureTextEntry: SecureTextEntry
        let textInputStyle: TextInputStyle
        let textInputKeyboardStyle: TextInputKeyboardStyle
        let leadingSideItem: SideItem?
        let traillingSideItem: SideItem?
    }

    // MARK: Containers

    private lazy var container: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [borderedView, bottomView])
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var verticalTextInputStackView = UIStackView(arrangedSubviews: [backingPlaceholderLabel, horizontalTextInputStackView])
    private lazy var horizontalTextInputStackView = UIStackView()
    private lazy var borderedView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.border.cgColor
        view.layer.cornerRadius = 4
        view.backgroundColor = .background

        horizontalTextInputStackView.alignment = .fill
        horizontalTextInputStackView.distribution = .fill
        horizontalTextInputStackView.axis = .horizontal
        horizontalTextInputStackView.spacing = 12

        verticalTextInputStackView.alignment = .fill
        verticalTextInputStackView.distribution = .fill
        verticalTextInputStackView.axis = .vertical
        verticalTextInputStackView.spacing = Constants.horizontalPlaceholderSpacing

        let horizontalStackView = UIStackView(arrangedSubviews: [leadingButton, verticalTextInputStackView, traillingButton])
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .fill
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10

        horizontalStackView.isLayoutMarginsRelativeArrangement = true
        horizontalStackView.layoutMargins = Constants.containerLayoutMargins

        view.addSubview(withDefaultConstraints: horizontalStackView)

        return view
    }()

    private lazy var horizontalAssistiveStackView = UIStackView(arrangedSubviews: [assistiveLabel, characterCountLabel])
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.layoutMargins = Constants.bottomViewLayoutMargins
        horizontalAssistiveStackView.alignment = .top
        horizontalAssistiveStackView.distribution = .fill
        view.addSubview(constrainedToLayoutMarginsGuideOf: horizontalAssistiveStackView)
        return view
    }()

    // MARK: Text

    /// Dummy label (non visible). Used to adapt the space of the parent stackview to fit the `placeholderLayer`.
    private lazy var backingPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .textPreset8(weight: .regular)
        label.numberOfLines = 1
        label.alpha = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        label.isUserInteractionEnabled = false
        return label
    }()

    private lazy var placeholderLayer: CATextLayer = {
        let textLayer = CATextLayer()
        textLayer.font = UIFont.textPreset6(weight: .regular)
        textLayer.fontSize = UIFont.textPreset6(weight: .regular).pointSize
        textLayer.contentsScale = UIScreen.main.scale
        return textLayer
    }()

    private var textInputView: TextInputView!
    private func textInputView(with style: TextInputStyle) -> TextInputView {
        var textInputView: TextInputView

        switch style {
        case .textField:
            textInputView = textField()
        case .textView:
            textInputView = textView()
        }

        textInputView.textAlignment = .left
        textInputView.font = .textPreset6(weight: .regular)
        textInputView.translatesAutoresizingMaskIntoConstraints = false
        textInputView.setContentCompressionResistancePriority(.required, for: .vertical)
        textInputView.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        textInputView.setContentCompressionResistancePriority(.init(rawValue: 1), for: .horizontal)
        textInputView.setContentHuggingPriority(.init(rawValue: 1), for: .horizontal)

        return textInputView
    }

    private func textView() -> UITextView {
        let textView = IntrinsicHeightTextView()
        textView.delegate = self
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        return textView
    }

    private func textField() -> UITextField {
        let textField = UITextField()
        textField.delegate = self
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return textField
    }

    private lazy var prefixLabel: UILabel = {
        let label = UILabel()
        label.font = .textPreset6(weight: .regular)
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.textColor = .textSecondary
        return label
    }()

    lazy var characterCountLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.topInset = 4
        label.textAlignment = .right
        label.font = .textPreset8(weight: .regular)
        label.numberOfLines = 2
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()

    private lazy var assistiveLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.topInset = 4
        label.textAlignment = .left
        label.font = .textPreset8(weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    // MARK: Side items

    private lazy var traillingButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.addTarget(self, action: #selector(traillingButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var leadingButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.addTarget(self, action: #selector(leadingButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: Properties

    private var overridenAccessibilityLabel: String?
    private var overridenAccessibilityValue: String?
    private var overridenAccessibilityHint: String?
    private var overridenAccessibilityTraits: UIAccessibilityTraits?

    private lazy var animator = UIViewPropertyAnimator(duration: Constants.animationDuration,
                                                       controlPoint1: Constants.animationCurveControlPoint1,
                                                       controlPoint2: Constants.animationCurveControlPoint2)

    @objc public var placeholderText: String? {
        didSet {
            backingPlaceholderLabel.text = placeholderText
            placeholderLayer.string = placeholderText
        }
    }

    @objc public var text: String? {
        get { textInputView?.content }
        set {
            guard textInputView?.content != newValue else { return }
            textInputView?.content = newValue
            textDidChange()
        }
    }

    @objc public var assistiveText: String? {
        get { assistiveLabel.text }
        set {
            assistiveLabel.text = newValue
            updateAssistiveLabelAlpha()
            updateAssistiveLabelTextColor()
        }
    }

    @objc public var prefixText: String? {
        get { prefixLabel.text }
        set {
            prefixLabel.text = newValue
            updatePrefixLabelAlpha()
        }
    }

    public var textInputLimit: TextInputLimit = .infinite {
        didSet {
            updateCharacterCountLabel()
        }
    }

    @objc public var borderColor: CGColor? {
        get { borderedView.layer.borderColor }
        set { borderedView.layer.borderColor = newValue }
    }

    @objc public var borderWidth: CGFloat {
        get { borderedView.layer.borderWidth }
        set { borderedView.layer.borderWidth = newValue }
    }

    @objc public var returnKeyType: UIReturnKeyType {
        get { textInputView?.returnKeyType ?? .default }
        set { textInputView?.returnKeyType = newValue }
    }

    public private(set) var state: State = .normal {
        didSet {
            guard state != oldValue else { return }
            didUpdateState(previousState: oldValue)
        }
    }

    public var style: Style {
        didSet { updateStyle() }
    }

    public private(set) var isEditing = false
    public var isOptional = false
    public var automaticallyRemoveAssistiveTextOnTyping = true
    public var validationStrategy: InputFieldValidationStrategy?
    public var nonOptionalFieldFailureMessage: String?

    public weak var delegate: InputFieldDelegate?
    public weak var dataSource: InputFieldDataSource?

    public init() {
        style = .default
        super.init(frame: .zero)

        commonInit()
    }

    override public init(frame: CGRect) {
        style = .default
        super.init(frame: frame)

        commonInit()
    }

    public required init?(coder: NSCoder) {
        style = .default
        super.init(coder: coder)

        commonInit()
    }

    public init(style: Style = .default,
                text: String? = nil,
                placeholderText: String? = nil,
                assistiveText: String? = nil,
                nonOptionalFieldFailureMessage: String? = nil) {
        self.style = style
        super.init(frame: .zero)
        self.text = text
        self.placeholderText = placeholderText
        self.assistiveText = assistiveText
        self.nonOptionalFieldFailureMessage = nonOptionalFieldFailureMessage

        commonInit()
    }

    private func commonInit() {
        setUpView()
        addBecomeFirstResponderTapGesture()

        updatePrefixLabelAlpha()
        updateCharacterCountLabel()
        updatePlaceholderLayerPosition()
        updatePlaceholderLayerTextColor()
        updateAssistiveLabelTextColor()
        updateAssistiveLabelAlpha()
        updateStyle()

        subscribeToPlaceholdeLabelBoundsChanges()
    }

    deinit {
        unsubscribeToPlaceholdeLabelBoundsChanges()
    }

    override public func observeValue(forKeyPath _: String?, of _: Any?, change _: [NSKeyValueChangeKey: Any]?, context _: UnsafeMutableRawPointer?) {
        updatePlaceholderLayerPosition()
        updatePlaceholderLayerSize()
    }

    override public var intrinsicContentSize: CGSize {
        let width = max(Constants.intrinsicContentWidth, container.intrinsicContentSize.width)
        let height = container.intrinsicContentSize.height
        return CGSize(width: width, height: height)
    }
}

// MARK: Validation

extension InputField: Validatable {
    @objc public func validate() {
        switch validationResult() {
        case .success:
            state = .normal
        case .failure(let message):
            show(errorText: message, animated: true)
        }
    }

    @objc public func isValid() -> Bool {
        validationResult() == .success
    }
}

// MARK: Text input

public extension InputField {
    override func endEditing(_ force: Bool) -> Bool {
        textInputView?.endEditing(force) ?? super.endEditing(force)
    }

    @discardableResult
    override func resignFirstResponder() -> Bool {
        textInputView?.resignFirstResponder() ?? super.resignFirstResponder()
    }

    @discardableResult
    override func becomeFirstResponder() -> Bool {
        guard state != .disabled else { return false }
        return textInputView?.becomeFirstResponder() ?? super.becomeFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        state != .disabled
    }

    override var isFirstResponder: Bool {
        textInputView?.isFirstResponder ?? super.isFirstResponder
    }

    var beginningOfDocument: UITextPosition {
        textInputView.beginningOfDocument
    }

    var endOfDocument: UITextPosition {
        textInputView.endOfDocument
    }

    var isSecureTextEntry: Bool {
        get { textInputView.isSecureTextEntry }
        set { textInputView.isSecureTextEntry = newValue }
    }

    var selectedTextRange: UITextRange? {
        get { textInputView.selectedTextRange }
        set { textInputView.selectedTextRange = newValue }
    }

    func offset(from: UITextPosition, to toPosition: UITextPosition) -> Int {
        textInputView.offset(from: from, to: toPosition)
    }

    func textRange(from: UITextPosition, to toPosition: UITextPosition) -> UITextRange? {
        textInputView.textRange(from: from, to: toPosition)
    }

    func position(from position: UITextPosition, offset: Int) -> UITextPosition? {
        textInputView.position(from: position, offset: offset)
    }
}

// MARK: State

public extension InputField {
    func set(state newState: State, animated: Bool) {
        state = newState
        startAnimations(animated: animated)
    }

    func show(assistiveText text: String?, animated: Bool) {
        state = .normal
        assistiveText = text
        startAnimations(animated: animated)
    }

    func hideAssistiveText(animated: Bool) {
        state = .normal
        assistiveText = nil
        startAnimations(animated: animated)
    }

    func show(errorText: String?, animated: Bool) {
        state = .invalid
        assistiveText = errorText
        startAnimations(animated: animated)
    }

    func hideErrorText(animated: Bool) {
        state = .normal
        assistiveText = nil
        startAnimations(animated: animated)
    }
}

// MARK: Editing

private extension InputField {
    func didBeginEditing() {
        isEditing = true

        addEditingAnimations()

        startAnimations(animated: true)

        delegate?.inputFieldDidBeginEditing(self)
    }

    func didEndEditing() {
        isEditing = false

        addEditingAnimations()

        startAnimations(animated: true)

        delegate?.inputFieldDidEndEditing(self)
    }

    @objc func textDidChange() {
        updateCharacterCountLabel()

        updatePrefixLabelAlpha()

        updatePlaceholderLayerPosition()

        if automaticallyRemoveAssistiveTextOnTyping && state == .invalid {
            assistiveText = nil
            state = .normal
            startAnimations(animated: true)
        }

        delegate?.inputFieldTextDidChange(self)
    }

    func shouldBeginEditing() -> Bool {
        delegate?.inputFieldShouldBeginEditing(self) ?? true
    }

    func shouldChangeCharactersIn(range: NSRange, replacementString string: String) -> Bool {
        switch textInputLimit {
        case .finite(let characterCount):
            let text = self.text ?? ""
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            return newString.count <= characterCount
        case .infinite:
            return delegate?.inputField(self, shouldChangeCharactersIn: range, replacementString: string) ?? true
        }
    }

    func shouldReturn() -> Bool {
        delegate?.inputFieldShouldReturn(self) ?? true
    }
}

// MARK: UITextViewDelegate

extension InputField: UITextViewDelegate {
    public func textViewDidBeginEditing(_: UITextView) {
        didBeginEditing()
    }

    public func textViewDidEndEditing(_: UITextView) {
        didEndEditing()
    }

    public func textViewDidChange(_: UITextView) {
        textDidChange()
    }

    public func textViewShouldBeginEditing(_: UITextView) -> Bool {
        shouldBeginEditing()
    }

    public func textView(_: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        shouldChangeCharactersIn(range: range, replacementString: text)
    }
}

// MARK: UITextFieldDelegate

extension InputField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_: UITextField) {
        didBeginEditing()
    }

    public func textFieldDidEndEditing(_: UITextField) {
        didEndEditing()
    }

    public func textFieldShouldBeginEditing(_: UITextField) -> Bool {
        shouldBeginEditing()
    }

    public func textField(_: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        shouldChangeCharactersIn(range: range, replacementString: string)
    }

    public func textFieldShouldReturn(_: UITextField) -> Bool {
        shouldReturn()
    }
}

// MARK: UIPickerViewDataSource

extension InputField: UIPickerViewDataSource {
    public func numberOfComponents(in _: UIPickerView) -> Int {
        1
    }

    public func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        dataSource?.inputFieldPickerElements(self).count ?? 0
    }
}

// MARK: UIPickerViewDataSource

extension InputField: UIPickerViewDelegate {
    public func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        guard let elements = dataSource?.inputFieldPickerElements(self) else { return nil }
        guard elements.indices.contains(row) else { return nil }
        return elements[row]
    }

    public func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent _: Int) {
        guard let elements = dataSource?.inputFieldPickerElements(self) else { return }
        guard elements.indices.contains(row) else { return }
        text = elements[row]
        dataSource?.inputField(self, didSelectPickerElementAt: row)
    }
}

// MARK: Picker

extension InputField {
    func pickerView() -> UIPickerView {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .background
        return pickerView
    }

    func pickerToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.isTranslucent = true
        toolBar.barStyle = .default
        toolBar.backgroundColor = .background
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(resignFirstResponder))
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexibleButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }
}

// MARK: Set up

private extension InputField {
    func setUpView() {
        isAccessibilityElement = true
        layoutMargins = Constants.containerLayoutMargins

        addSubview(container, constraints: [
            leadingAnchor.constraint(equalTo: container.leadingAnchor),
            trailingAnchor.constraint(equalTo: container.trailingAnchor),
            topAnchor.constraint(equalTo: container.topAnchor),
            bottomAnchor.constraint(greaterThanOrEqualTo: container.bottomAnchor)
        ])

        verticalTextInputStackView.layer.addSublayer(placeholderLayer)
    }

    func addBecomeFirstResponderTapGesture() {
        // Add a tap gesture to becomeFirstResponder whenever the user taps at any point of the container to improve user experience.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(becomeFirstResponder))
        tapGesture.numberOfTapsRequired = 1
        borderedView.addGestureRecognizer(tapGesture)
    }

    func validationResult() -> InputFieldValidationResult {
        if !isOptional && text.isEmpty {
            return InputFieldValidationResult.failure(message: nonOptionalFieldFailureMessage ?? "")
        } else {
            return validationStrategy?.validate(text: text) ?? .success
        }
    }

    func subscribeToPlaceholdeLabelBoundsChanges() {
        backingPlaceholderLabel.addObserver(self, forKeyPath: #keyPath(UIView.bounds), options: .new, context: nil)
    }

    func unsubscribeToPlaceholdeLabelBoundsChanges() {
        backingPlaceholderLabel.removeObserver(self, forKeyPath: #keyPath(UIView.bounds))
    }
}

// MARK: Animations

private extension InputField {
    var isPlaceholderFloating: Bool {
        isEditing || !text.isEmpty
    }

    func addStateAnimations() {
        animator.addAnimations {
            self.updatePlaceholderLayerTextColor()
            self.updateAssistiveLabelTextColor()
        }
    }

    func addEditingAnimations() {
        animator.addAnimations {
            self.updatePlaceholderLayerPosition()
            self.updatePlaceholderLayerTextColor()
            self.updatePrefixLabelAlpha()
        }
    }

    func updatePlaceholderLayerPosition() {
        if isPlaceholderFloating {
            placeholderLayer.frame.origin = .zero
            placeholderLayer.fontSize = UIFont.textPreset8(weight: .regular).pointSize
        } else {
            let y = (backingPlaceholderLabel.bounds.height + Constants.horizontalPlaceholderSpacing) / 2
            placeholderLayer.frame.origin = CGPoint(x: 0, y: y)
            placeholderLayer.fontSize = UIFont.textPreset6(weight: .regular).pointSize
        }
    }

    func updatePlaceholderLayerSize() {
        let height = placeholderLayer.preferredFrameSize().height + Constants.verticalPlaceholderHeightThreshold
        let width = backingPlaceholderLabel.bounds.width
        placeholderLayer.frame.size = CGSize(width: width, height: height)
    }

    func updatePlaceholderLayerTextColor() {
        if isEditing {
            placeholderLayer.foregroundColor = stateStyle.editingPlaceholderTextColor.cgColor
        } else {
            placeholderLayer.foregroundColor = stateStyle.placeholderTextColor.cgColor
        }
    }

    func updatePrefixLabelAlpha() {
        prefixLabel.isHidden = prefixText.isEmpty

        if isPlaceholderFloating {
            prefixLabel.alpha = 1
        } else {
            prefixLabel.alpha = 0
        }
    }

    func updateAssistiveLabelAlpha() {
        let isHidden = assistiveText.isEmpty

        assistiveLabel.isHidden = isHidden

        if assistiveLabel.isHidden {
            assistiveLabel.alpha = 0
        } else {
            assistiveLabel.alpha = 1
        }

        updateBottomViewVisibility()

        delegate?.inputFieldShouldLayout(self)
    }

    func updateAssistiveLabelTextColor() {
        assistiveLabel.textColor = stateStyle.assistiveTextColor
        characterCountLabel.textColor = stateStyle.assistiveTextColor
    }

    func updateCharacterCountLabel() {
        switch textInputLimit {
        case .finite(let characterCount):
            characterCountLabel.text = "\(text?.count ?? 0) / \(characterCount)"
            characterCountLabel.isHidden = false
            horizontalAssistiveStackView.axis = .horizontal
        case .infinite:
            characterCountLabel.text = ""
            characterCountLabel.isHidden = true
            horizontalAssistiveStackView.axis = .vertical
        }

        updateBottomViewVisibility()
    }

    func updateBottomViewVisibility() {
        bottomView.isHidden = assistiveLabel.isHidden && characterCountLabel.isHidden
    }

    /// Starts animations from the animator. You may call this method every time the state is changed.
    func startAnimations(animated: Bool) {
        if animated {
            animator.startAnimation()
        } else {
            UIView.performWithoutAnimation(animator.startAnimation)
        }
    }
}

// MARK: State

private extension InputField {
    func didUpdateState(previousState _: State) {
        addStateAnimations()

        textInputView?.isEnabled = state != .disabled

        textInputView?.textColor = stateStyle.textColor

        delegate?.inputFieldDidUpdateState(self)
    }
}

// MARK: Side items

private extension InputField {
    @objc func traillingButtonTapped(_ button: UIButton) {
        switch style.traillingSideItem {
        case .secureEntry:
            textInputView?.isSecureTextEntry.toggle()
            traillingButton.isSelected.toggle()
        case .picker:
            becomeFirstResponder()
        case .image,
             .none:
            // Do nothing specific
            break
        }

        delegate?.inputField(self, didTapTraillingButton: button)
    }

    @objc func leadingButtonTapped(_ button: UIButton) {
        switch style.leadingSideItem {
        case .secureEntry:
            textInputView?.isSecureTextEntry.toggle()
            traillingButton.isSelected.toggle()
        case .picker:
            becomeFirstResponder()
        case .image,
             .none:
            // Do nothing specific
            break
        }

        delegate?.inputField(self, didTapLeadingButton: button)
    }
}

// MARK: Style

private extension InputField {
    var stateStyle: StateStyle {
        guard let stateStyle = style.stateStyleByState[state] else {
            preconditionFailure("Style \(style) does not have stateStyle for state \(state). Check that the current style is defined properly.")
        }

        return stateStyle
    }

    func updateStyle() {
        updateTextColorStyle()
        updateSideItemsStyle()
        updateTextInputStyle()
    }

    func updateTextInputStyle() {
        let textInputView = self.textInputView(with: style.textInputStyle)
        self.textInputView = textInputView

        horizontalTextInputStackView.removeArrangedSubviews()
        horizontalTextInputStackView.addArrangedSubview(prefixLabel)
        horizontalTextInputStackView.addArrangedSubview(textInputView)

        textInputView.isSecureTextEntry = style.secureTextEntry == .enabled

        switch style.textInputKeyboardStyle {
        case .picker:
            textInputView.inputView = pickerView()
            textInputView.inputAccessoryView = pickerToolbar()
            textInputView.autocorrectionType = .no
            textInputView.keyboardType = .default
            textInputView.tintColor = .clear
        case .keyboard(let keyboardType, let autocorrectionType, let autocapitalizationType):
            textInputView.inputView = nil
            textInputView.inputAccessoryView = nil
            textInputView.autocorrectionType = autocorrectionType
            textInputView.keyboardType = keyboardType
            textInputView.autocapitalizationType = autocapitalizationType
            textInputView.tintColor = .controlActivated
        }
    }

    func updateTextColorStyle() {
        if isEditing {
            placeholderLayer.foregroundColor = stateStyle.editingPlaceholderTextColor.cgColor
        } else {
            placeholderLayer.foregroundColor = stateStyle.placeholderTextColor.cgColor
        }

        textInputView?.textColor = stateStyle.textColor
        assistiveLabel.textColor = stateStyle.assistiveTextColor
        characterCountLabel.textColor = stateStyle.assistiveTextColor
    }

    func updateSideItemsStyle() {
        updateLeadingSideItemStyle()
        updateTraillingSideItemStyle()
    }

    func updateTraillingSideItemStyle() {
        updateSideItemStyle(with: traillingButton, sideItem: style.traillingSideItem)
    }

    func updateLeadingSideItemStyle() {
        updateSideItemStyle(with: leadingButton, sideItem: style.leadingSideItem)
    }

    func updateSideItemStyle(with button: UIButton, sideItem: SideItem?) {
        switch sideItem {
        case .secureEntry:
            button.isHidden = false
            button.setImage(.eyeEnabled, for: .selected)
            button.setImage(.eyeDisabled, for: .normal)
        case .picker:
            button.isHidden = false
            button.setImageForAllStates(.arrowDown)
        case .image(let image):
            button.isHidden = false
            button.setImageForAllStates(image)
        case .none:
            button.isHidden = true
        }
    }
}

// MARK: Accessibility

extension InputField {
    override public var accessibilityLabel: String? {
        get { overridenAccessibilityLabel ?? placeholderText }
        set { overridenAccessibilityLabel = newValue }
    }

    override public var accessibilityValue: String? {
        get { overridenAccessibilityValue ?? text }
        set { overridenAccessibilityLabel = newValue }
    }

    override public var accessibilityTraits: UIAccessibilityTraits {
        get { overridenAccessibilityTraits ?? (state == .disabled ? .notEnabled : .none) }
        set { overridenAccessibilityTraits = newValue }
    }

    override public var accessibilityHint: String? {
        get { overridenAccessibilityHint ?? assistiveText }
        set { overridenAccessibilityHint = newValue }
    }

    public var assistiveAccessibilityIdentifier: String? {
        get { assistiveLabel.accessibilityIdentifier }
        set { assistiveLabel.accessibilityIdentifier = newValue }
    }
}

// MARK: Objc API

@objc public extension InputField {
    func objc_setNormalState() {
        state = .normal
    }

    func objc_setDisabledState() {
        state = .disabled
    }

    func objc_setPhoneNumberStyle() {
        style = .phoneNumber
    }

    func objc_setDropdownStyle() {
        style = .dropdown
    }
}
