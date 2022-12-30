//
//  Preview.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

struct Preview<Content: View>: View {
    let content: Content

    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        Group {
            self.content
                .environment(\.colorScheme, .light)
                .preferredColorScheme(.light)

            self.content
                .environment(\.colorScheme, .dark)
                .preferredColorScheme(.dark)
        }
    }
}
