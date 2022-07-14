//
//  View+Catalog.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func section<T: View>(_ text: String, @ViewBuilder _ view: () -> T) -> some View {
        Section { view() } header: { Text(text) }
    }

    @ViewBuilder
    func picker<Selection: CustomStringConvertible>(_ selection: Binding<Int>, options: [Selection]) -> some View {
        Picker("", selection: selection) {
            ForEach(0 ..< options.count) { index in
                Text(options[index].description)
                    .expand(alignment: .leading)
                    .tag(index)
            }
        }
    }
}
