//
//  SizeViewModifier.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static let defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }

    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

public extension View {
    func onSizeChange(_ callback: @Sendable @escaping (CGSize) -> Void) -> some View {
        modifier(SizeModifier())
            .onPreferenceChange(SizePreferenceKey.self, perform: callback)
    }

    func onWidthChange(_ callback: @Sendable @escaping (CGFloat) -> Void) -> some View {
        onSizeChange { callback($0.width) }
    }

    func onHeightChange(_ callback: @Sendable @escaping (CGFloat) -> Void) -> some View {
        onSizeChange { callback($0.height) }
    }
}
