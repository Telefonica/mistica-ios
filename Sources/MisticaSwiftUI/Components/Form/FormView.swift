//
//  FormView.swift
//  Mistica
//
//  Created by Alejandro Ruiz on 4/12/24.
//

import SwiftUI

public struct FormView: View {
    @State public var inputFields: [InputField]
    @State private var isButtonEnabled: Bool = true
    @State private var isValid: Bool = true

    var headerView: AnyView?
    var detailView: AnyView?
    var footerView: AnyView?
    var buttonTitle: String
    var onButtonTap: ((Bool) -> Void)?
    
    public init(
        inputFields: [InputField],
        headerView: AnyView? = nil,
        detailView: AnyView? = nil,
        footerView: AnyView? = nil,
        buttonTitle: String,
        onButtonTap: ((Bool) -> Void)? = nil)
    {
        self.inputFields = inputFields
        self.headerView = headerView
        self.detailView = detailView
        self.footerView = footerView
        self.buttonTitle = buttonTitle
        self.onButtonTap = onButtonTap
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let headerView = headerView {
                    headerView
                }

                ForEach(inputFields) { inputField in
                    inputField
                }

                if let detailView = detailView {
                    detailView
                }

                Button(action: validateAndSubmit) {
                    Text(buttonTitle)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.misticaPrimary())
                .disabled(!isButtonEnabled)

                if let footerView = footerView {
                    footerView
                }
            }
            .padding(16)
        }

    }


    private func validateAndSubmit() {
        onButtonTap?(isValid)
    }
}

struct FormView_Previews: PreviewProvider {
    @State static var text1 = ""
    @State static var text2 = ""
    @State static var text3 = ""
    @State static var text4 = ""
    
    @State static var assistiveText1 = "This field is required"

    static var previews: some View {
        FormView(
            inputFields: [
                InputField(placeholder: "Name", text: $text1)
                    .style(.text),
                InputField(placeholder: "Surname", text: $text2, assistiveText: $assistiveText1, state: .constant(.invalid))
                    .style(.text),
                InputField(placeholder: "Email", text: $text3)
                    .style(.email),
                InputField(placeholder: "Phone", text: $text4)
                    .style(.phone(code: "+34"))
                ],
            headerView: AnyView(Text("Header view")
                .font(.headline)),
            detailView: AnyView(Text("Detail view")
                .font(.subheadline)),
            footerView: AnyView(Text("Footer view")
                .font(.footnote)),
            buttonTitle: "Save",
            onButtonTap: { isValid in
                print("Form Submitted. Is valid: \(isValid)")
            }
        )
    }
}

