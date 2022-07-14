import Foundation
import MisticaSwiftUI
import SwiftUI

struct InputFieldCatalogView: View {
    @State var text = ""
    @State var date = ""
    @State var number = ""
    @State var dropdown = ""

    var body: some View {
        List {
            inputGroup(
                style: .text,
                placeholder: "Text",
                text: $text
            )

            inputGroup(
                style: .email,
                placeholder: "Email",
                text: $text
            )

            inputGroup(
                style: .phone(code: "+34"),
                placeholder: "Phone",
                text: $number,
                disabledText: "111 111 111"
            )

            inputGroup(
                style: .secure,
                placeholder: "Secure",
                text: $text
            )

            inputGroup(
                style: .dropdown(options: ["1", "2", "3"]),
                placeholder: "Dropdown",
                text: $dropdown
            )

            inputGroup(
                style: .date(),
                placeholder: "Date",
                text: $date
            )

            inputGroup(
                style: .search,
                placeholder: "Search",
                text: $text
            )
        }
        .listStyle(.insetGrouped)
    }

    @ViewBuilder
    func inputGroup(
        style: InputField.Style,
        placeholder: String,
        text: Binding<String>,
        disabledText: String? = nil
    ) -> some View {
        section(placeholder) {
            InputField(placeholder: placeholder, text: text)
                .style(style)
                .padding()

            InputField(placeholder: placeholder, text: .constant(""), assistiveText: .constant("AssistiveText"))
                .style(style)
                .padding()

            InputField(placeholder: placeholder, text: .constant(disabledText ?? placeholder), assistiveText: .constant("AssistiveText"))
                .style(style)
                .padding()

            InputField(placeholder: placeholder, text: .constant(disabledText ?? placeholder), assistiveText: .constant("AssistiveText"), state: .constant(.invalid))
                .style(style)
                .padding()
        }
    }
}

#if DEBUG
    struct InputFieldCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                InputFieldCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
