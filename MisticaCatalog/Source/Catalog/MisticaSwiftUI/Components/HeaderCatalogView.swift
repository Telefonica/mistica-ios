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
    @State var pretitle: String = "The pretitle"
    @State var hasTitle = true
    @State var title: String = "The title"
    @State var hasDescription = true
    @State var description: String = "The description"
    @State var isNormalStyle = true

    var body: some View {
        List {
            section("Pretitle") { createSection("has pretitle", hasValue: $hasPretitle, value: $pretitle) }
            section("Title") { createSection("has title", hasValue: $hasTitle, value: $title) }
            section("Description") { createSection("has description", hasValue: $hasDescription, value: $description) }
            section("Style") { Toggle("is normal style", isOn: $isNormalStyle)}

            NavigationLink("Show Header") {
                Header(
                    pretitle: hasPretitle ? pretitle : nil,
                    title: hasTitle ? title : nil,
                    description: hasDescription ? description : nil,
                    style: isNormalStyle ? .normal : .inverse
                )
                .navigationBarTitle("Header")
            }
        }
    }

    @ViewBuilder
    func createSection(_ title: String, hasValue: Binding<Bool>, value: Binding<String>) -> some View {
        Toggle(title, isOn: hasValue)
        if hasValue.wrappedValue {
            TextField("", text: value)
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
