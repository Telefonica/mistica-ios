//
//  Backport.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct MisticaBackport<Content> {
    let content: Content
}

@available(iOS 13.0, *)
extension View {
    var misticaBackport: MisticaBackport<Self> { MisticaBackport(content: self) }
}

@available(iOS 13.0, *)
extension MisticaBackport where Content: View {
    @ViewBuilder func accesibilityHidden(_ hidden: Bool) -> some View {
        if #available(iOS 14.0, *) {
            content
                .accessibilityHidden(hidden)
        } else {
            content
                .accessibility(hidden: hidden)
        }
    }

    @ViewBuilder func accessibilityIdentifier(_ text: String) -> some View {
        if #available(iOS 14.0, *) {
            content
                .accessibilityIdentifier(text)
        } else {
            content
                .accessibility(identifier: text)
        }
    }
    
    @ViewBuilder func accessibilityLabel(_ text: Text) -> some View {
        if #available(iOS 14.0, *) {
            content
                .accessibilityLabel(text)
        } else {
            content
                .accessibility(label: text)
        }
    }

    @ViewBuilder func navigationBarTitle(
        _ title: String
    ) -> some View {
        if #available(iOS 14, *) {
            content
                .navigationTitle(title)
        } else {
            content
                .navigationBarTitle(Text(title))
        }
    }
}
