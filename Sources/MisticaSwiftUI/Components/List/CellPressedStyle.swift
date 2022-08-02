//
//  CellPressedStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

// Style to track the pressed state of the button\
@available(iOS 13.0, *)
struct CellPressedStyle: ButtonStyle {
    @Binding var isPressed: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .expand()
            .valueChanged(value: configuration.isPressed, onChange: { isPressed = $0 })
    }
}
