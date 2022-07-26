//
//  InputField.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import SwiftUI

private enum Constants {
    static let horizontalPadding: CGFloat = 8
    static let verticalPadding: CGFloat = 8
    static let cornerRadius: CGFloat = 4
    static let animationDuration: CGFloat = 0.2
    static let placeholderReducedScale: CGFloat = 0.777
    static let textfieldHeight: CGFloat = 24
}

@available(iOS 13.0, *)
public struct InputField: View {
    public enum ValidationState: Int, Identifiable, Equatable {
        case normal
        case invalid

        public var id: Int { rawValue }
    }

    public enum Style: Equatable {
        case text
        case email
        case secure
        case phone(code: String)
        case dropdown(options: [String], initialSelectionIndex: Int? = nil)
        case date(format: String = "dd/MM/yyyy", initial: Date = Date())
        case search
    }

    @Binding var text: String
    @Binding private var assistiveText: String
    @Binding private var state: ValidationState

    @State private var editing = false
    @State private var secureActivated = true

    var style: Style = .text
    var placeholder: String

    public init(
        placeholder: String = "",
        text: Binding<String>,
        assistiveText: Binding<String> = .constant(""),
        state: Binding<ValidationState> = .constant(.normal)
    ) {
        self.placeholder = placeholder
        _text = text
        _assistiveText = assistiveText
        _state = state
    }

    public var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: Constants.horizontalPadding) {
                leadingImage
                    .foregroundColor(.neutralHigh)
                    .frame(width: Constants.textfieldHeight, height: Constants.textfieldHeight)

                ZStack(alignment: .leading) {
                    // Texts
                    VStack(alignment: .leading, spacing: 4) {
                        Text(placeholder)
                            .font(.textPreset1(weight: .regular))
                            .opacity(0)

                        HStack {
                            leadingText
                                .opacity(leadingTextOpacity)
                                .animation(.misticaTimingCurve, value: shouldApplyEffects)
                                .onTapGesture { editing = true }

                            textField
                                .font(.textPreset3(weight: .regular))
                                .foregroundColor(.textPrimary)
                                .frame(height: Constants.textfieldHeight, alignment: .leading)
                        }
                    }
                    .padding(.vertical, Constants.verticalPadding)

                    Text(placeholder)
                        .font(.textPreset3(weight: .regular))
                        .foregroundColor(placeholderTextColor)
                        .scaleEffect(x: placeholderScaleEffect, y: placeholderScaleEffect, anchor: .topLeading)
                        .offset(x: 0, y: placeholderOffset)
                        .animation(.misticaTimingCurve, value: placeholderTextColor)
                        .allowsHitTesting(false)
                }

                trailingImage
                    .foregroundColor(.neutralHigh)
                    .frame(width: Constants.textfieldHeight, height: Constants.textfieldHeight)
            }
            .padding(.horizontal, Constants.horizontalPadding)
            .background(Color.backgroundContainer)
            .border(cornerRadius: Constants.cornerRadius)

            if !assistiveText.isEmpty {
                Text(assistiveText)
                    .font(.textPreset1(weight: .regular))
                    .foregroundColor(assistiveTextColor)
                    .expandHorizontally(alignment: .leading)
                    .padding(.horizontal, Constants.horizontalPadding)
            }
        }
        .animation(.misticaTimingCurve, value: assistiveText.isEmpty)
    }
}

// MARK: Private

@available(iOS 13.0, *)
private extension InputField {
    @ViewBuilder
    var leadingImage: some View {
        if case .search = style {
            Image.search
                .resizable()
                .scaledToFit()
        }
    }

    @ViewBuilder
    var trailingImage: some View {
        if case .secure = style {
            let image = secure ? Image.eyeEnabled : Image.eyeDisabled
            image
                .resizable()
                .scaledToFit()
                .onTapGesture { secureActivated.toggle() }
        }

        if case .date = style {
            Image.calendar
                .resizable()
                .scaledToFit()
        }

        if case .search = style {
            Image.checkmarkIcon
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.neutralHigh)
                .onTapGesture { text = "" }
        }

        if case .dropdown = style {
            Image.arrowDown
                .resizable()
                .scaledToFit()
        }
    }

    @ViewBuilder
    var leadingText: some View {
        if case .phone(let code) = style {
            Text("\(code)")
                .font(.textPreset3(weight: .regular))
                .animation(.misticaTimingCurve, value: state)
                .foregroundColor(.textSecondary)
        }
    }

    @ViewBuilder
    var textField: some View {
        LegacyTextField(
            text: $text,
            isResponder: $editing,
            isSecured: secure,
            keyboard: keyboard,
            inputStyle: inputStyle
        )
    }

    var secure: Bool {
        switch style {
        case .secure:
            return secureActivated
        case .phone,
             .text,
             .email,
             .dropdown,
             .date,
             .search:
            return false
        }
    }

    var inputStyle: LegacyTextFieldInputStyle {
        switch style {
        case .date(let format, let initial):
            return .date(format: format, initial: initial)
        case .dropdown(let options, let initialSelectionIndex):
            return .picker(options: options, initialSelectionIndex: initialSelectionIndex)
        case .phone,
             .secure,
             .text,
             .email,
             .search:
            return .text
        }
    }

    var keyboard: UIKeyboardType {
        switch style {
        case .secure,
             .text,
             .dropdown,
             .date,
             .search:
            return .default
        case .phone:
            return .phonePad
        case .email:
            return .emailAddress
        }
    }

    var leadingTextOpacity: CGFloat {
        shouldApplyEffects ? 1.0 : 0.0
    }

    var assistiveTextColor: Color {
        state == .normal ? .textSecondary : .error
    }

    var placeholderTextColor: Color {
        switch state {
        case .normal:
            return editing ? .brand : .textSecondary
        case .invalid:
            return .error
        }
    }

    var shouldApplyEffects: Bool {
        editing || !text.isEmpty
    }

    var placeholderScaleEffect: CGFloat {
        shouldApplyEffects ? Constants.placeholderReducedScale : 1
    }

    var placeholderOffset: CGFloat {
        shouldApplyEffects ? -10 : 0
    }
}

// MARK: Modifiers

@available(iOS 13.0, *)
public extension InputField {
    func style(_ style: Style) -> InputField {
        var view = self
        view.style = style
        return view
    }
}

// MARK: Previews

@available(iOS 13.0, *)
struct InputField_Previews: PreviewProvider {
    @State static var text1 = ""
    @State static var text2 = "Text"
    @State static var assistiveText = "Assistive Text"

    static var previews: some View {
        VStack(alignment: .trailing) {
            InputField(placeholder: "Email", text: $text1)
                .style(.email)
                .padding()

            InputField(placeholder: "Normal", text: $text1, assistiveText: $assistiveText)
                .style(.email)
                .padding()

            InputField(placeholder: "Failed", text: $text2, assistiveText: $assistiveText, state: .constant(.invalid))
                .style(.email)
                .padding()

            InputField(placeholder: "Username", text: $text2)
                .style(.text)
                .padding()

            InputField(placeholder: "Password", text: $text2)
                .style(.secure)
                .padding()

            InputField(placeholder: "Phone", text: $text2)
                .style(.phone(code: "+34"))
                .padding()

            InputField(placeholder: "Dropdown", text: $text2)
                .style(.dropdown(options: ["1, 2, 3"]))
                .padding()
        }
    }
}
