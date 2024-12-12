//
//  FormViewCatalog.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

public struct FormViewCatalog: View {
    struct FormFieldState: Identifiable {
        let id = UUID()
        let placeholder: String
        var text: String = ""
        var assistiveText: String = ""
        var state: InputField.ValidationState = .normal
        let style: InputField.Style

        func createInputField(binding: Binding<FormFieldState>) -> InputField {
            InputField(
                placeholder: placeholder,
                text: binding.text,
                assistiveText: binding.assistiveText,
                state: binding.state,
                nonOptionalFieldFailureMessage: "This field is required"
            )
            .style(style)
        }
    }

    @State private var fields: [FormFieldState] = [
        FormFieldState(placeholder: "Name", style: .text),
        FormFieldState(placeholder: "Surname (Optional)", style: .text),
        FormFieldState(placeholder: "Email", style: .email),
        FormFieldState(placeholder: "Password", style: .secure),
        FormFieldState(placeholder: "Phone", style: .phone(code: "+34"))
    ]

    public var body: some View {
        FormView(
            inputFields: fields.indices.map { index in
                fields[index].createInputField(binding: $fields[index])
            },
            headerView: AnyView(
                Text("Header View")
                    .font(.headline)
            ),
            detailView: AnyView(
                Text("Detail View")
                    .font(.subheadline)
            ),
            footerView: AnyView(
                Text("Footer View")
                    .font(.footnote)
            ),
            buttonTitle: "Save",
            onButtonTap: { _ in
                validateForm()
            }
        )
    }

    private func validateForm() {
        for index in fields.indices {
            fields[index].createInputField(binding: $fields[index]).validate()
        }
    }
}

struct CatalogFormView_Previews: PreviewProvider {
    static var previews: some View {
        FormViewCatalog()
    }
}
