//
//  HeaderCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct HeaderCatalogView: View {
    @State var hasPretitle = true
    @State var pretitle = "The pretitle"
    @State var hasTitle = true
    @State var title = "The title"
    @State var hasDescription = true
    @State var description = "The description"
    @State var styleSelection: Style = .normal
    @State var pretitleLineLimit = 0
    @State var titleLineLimit = 0
    @State var descriptionLineLimit = 0
    
    enum Style: Int {
        case normal
        case inverse
        case normalSmall
        case invereSmall
    }

    var body: some View {
        List {
            section("Pretitle") {
                createSection(
                    "has pretitle",
                    hasValue: $hasPretitle,
                    value: $pretitle,
                    lineLimit: $pretitleLineLimit
                )
            }
            section("Title") {
                createSection(
                    "has title",
                    hasValue: $hasTitle,
                    value: $title,
                    lineLimit: $titleLineLimit
                )
            }
            section("Description") {
                createSection(
                    "has description",
                    hasValue: $hasDescription,
                    value: $description,
                    lineLimit: $descriptionLineLimit
                )
            }
            section("Style") {
                Picker("Select the style type", selection: $styleSelection) {
                    Text("normal").tag(Style.normal)
                    Text("inverse").tag(Style.inverse)
                    Text("normal small").tag(Style.normalSmall)
                    Text("inverse small").tag(Style.invereSmall)
                }
            }

            NavigationLink("Show Header") {
                Header(
                    pretitle: hasPretitle ? HeaderText(text: pretitle, lineLimit: pretitleLineLimit) : nil,
                    title: hasTitle ? HeaderText(text: title, lineLimit: titleLineLimit) : nil,
                    description: hasDescription ? HeaderText(text: description, lineLimit: descriptionLineLimit) : nil,
                    style: createHeaderViewStyle(from: styleSelection)
                )
                .navigationBarTitle("Header")
            }
        }
    }

    @ViewBuilder
    func createSection(
        _ title: String,
        hasValue: Binding<Bool>,
        value: Binding<String>,
        lineLimit: Binding<Int>
    ) -> some View {
        Toggle(title, isOn: hasValue)
        if hasValue.wrappedValue {
            TextField("", text: value)
            HStack {
                Text("Line limit")
                Stepper(
                    "\(lineLimit.wrappedValue)",
                    value: lineLimit,
                    in: 0 ... 10
                )
            }
        }
    }
}

private extension HeaderCatalogView {
    func createHeaderViewStyle(from styleSelection: Style) -> HeaderViewStyle {
        switch styleSelection {
        case .normal:
            .normal
        case .inverse:
            .inverse
        case .normalSmall:
            .normalSmall
        case .invereSmall:
            .inverseSmall
        }
    }
}

#if DEBUG
    struct HeaderCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                HeaderCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
