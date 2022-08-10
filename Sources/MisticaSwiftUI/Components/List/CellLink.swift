//
//  CellLink.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

/// View to be used as an overlay of the cell that acts as a NavigationLink but providers the caller with highlighting effects.
@available(iOS 13.0, *)
public struct CellLink<Destination: View>: View {
    @State var navigationLinkIsActive = false
    @Binding var isPressed: Bool

    private let destination: Destination?

    public init(
        isPressed: Binding<Bool>,
        destination: () -> Destination?
    ) {
        _isPressed = isPressed
        self.destination = destination()
    }

    public var body: some View {
        Button(action: {
            // Only activate the link if destination exists
            navigationLinkIsActive = destination != nil
        }, label: {
            // Using no foregroundColor of .clear Color as foreground makes
            // the button to replace the label for an empty view.
            Rectangle().foregroundColor(Color.backgroundContainer.opacity(0.001))
        })
            .background(NavigationLink(isActive: $navigationLinkIsActive, destination: { destination }, label: {}).opacity(0))
            .buttonStyle(CellPressedStyle(isPressed: $isPressed))
    }
}
