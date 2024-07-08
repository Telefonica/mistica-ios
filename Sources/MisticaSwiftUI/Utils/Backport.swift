//
//  Backport.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

struct MisticaBackport<Content> {
    let content: Content
}

extension View {
    var misticaBackport: MisticaBackport<Self> { MisticaBackport(content: self) }
}

extension MisticaBackport where Content: View {
    @ViewBuilder func accesibilityHidden(_ hidden: Bool) -> some View {
        content
            .accessibilityHidden(hidden)
    }

    @ViewBuilder func accessibilityIdentifier(_ text: String) -> some View {
        content
            .accessibilityIdentifier(text)
    }

    @ViewBuilder func accessibilityLabel(_ text: Text) -> some View {
        content
            .accessibilityLabel(text)
    }

    @ViewBuilder func navigationBarTitle(
        _ title: String
    ) -> some View {
        content
            .navigationTitle(title)
    }
}
